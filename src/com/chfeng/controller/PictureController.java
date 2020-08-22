package com.chfeng.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chfeng.po.Picture;
import com.chfeng.po.User;
import com.chfeng.service.PictureService;

@Controller
@RequestMapping("/picture")
public class PictureController {
    @Autowired
    private PictureService pictureService;

    /**
     * 查询图片
     */
    @RequestMapping(value = "/findpicture.action", method = RequestMethod.GET)
    public String findpicture(String pic_type, Model model) {
        List<Picture> resultPicture = (List<Picture>) pictureService.findpicture(pic_type);
        model.addAttribute("page", resultPicture);
        return "main";
    }

    /**
     * 上传壁纸
     */
    @RequestMapping(value = "/upload.action", method = RequestMethod.POST)
    public String upload(@RequestParam("pic_name") String pic_name, @RequestParam("pic_type") String pic_type, @RequestParam("pic_content") String pic_content,
                         @RequestParam("account") String account, @RequestParam("uploadfile") List<MultipartFile> uploadfile,
                         HttpServletRequest request) {


        // 设置上传文件的保存地目录
        for (MultipartFile file : uploadfile) {
            // 获取上传文件的原始名
            String originalFilename = file.getOriginalFilename();

            String dirPath =
                    request.getServletContext().getRealPath("/upload/");
            File filePath = new File(dirPath);
            // 如果保存文件的地不存在，就先创建目录
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            // 使用UUID重新命名上传的文件名(上传人_uuid_原始文件名称)
            String newFilename = pic_name + UUID.randomUUID() + "_" + originalFilename;//".jpg";
            try {
                // 使用MultipartFile接口的方法完成文件上传到指定位置
                file.transferTo(new File(dirPath + newFilename));
            } catch (Exception e) {
                e.printStackTrace();
                return "error";
            }
            //写入数据库
            int uploadpicture = pictureService.upload(pic_name, pic_type, newFilename, pic_content, account);
        }
        // 跳转到成功页
        return "uploadSuccess";
    }


    /**
     * 跳转到发布页面upload.jsp
     */
    @RequestMapping(value = "/toUpload.action")
    public String toUpload() {
        return "uploadPicture";
    }


    /**
     * 跳转到我的主页
     */
    @RequestMapping(value = "/tomyIndex.action")
    public String tomyIndex() {
        return "myindex";
    }

    /**
     * 查询我的上传记录
     */
    @RequestMapping(value = "/findMyPicture.action", method = RequestMethod.GET)
    public String findMyPicture(HttpSession session, Model model) {
        User user = (User) session.getAttribute("currentUser");
        List<Picture> resultMyPicture = (List<Picture>) pictureService.findMyPicture(user.getAccount(), user.getPassword(), "2");
        model.addAttribute("myPicture", resultMyPicture);
        return "myindex";
    }

    /**
     * 查询我的审核中
     */
    @RequestMapping(value = "/findMyReviewPicture.action", method = RequestMethod.GET)
    public String findMyReviewPicture(HttpSession session, Model model) {
        User user = (User) session.getAttribute("currentUser");
        List<Picture> resultMyPicture = (List<Picture>) pictureService.findMyPicture(user.getAccount(), user.getPassword(), "1");
        model.addAttribute("myPicture", resultMyPicture);
        return "myindex";
    }

    /**
     * 查询单张图片
     */
    @RequestMapping(value = "/findIdPicture.action", method = RequestMethod.GET)
    @ResponseBody
    public Picture findIdPicture(Picture picture, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        picture.setAccount(user.getAccount());
        Picture resultpicture = pictureService.findIdPicture(picture);
        //System.out.println(resultpicture);
        //if(resultpicture!=null)System.out.println("请求成功!"+resultpicture);
        return resultpicture;
    }

    /**
     * 删除我的图片
     */
    @RequestMapping(value = "/deleteMyPicture.action", method = RequestMethod.POST)
    @ResponseBody
    public String deleteMyPicture(String account, Integer pic_id, String pic_src, HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("currentUser");
        int rows = pictureService.deleteMyPicture(user.getAccount(), pic_id, pic_src);
        String dirPath = request.getServletContext().getRealPath("/upload/");
        File oldFile = new File(dirPath + pic_src);
        oldFile.delete();//直接删除
        if (rows > 0) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 修改我的图片
     */
    @RequestMapping(value = "/updateMyPicture.action", method = RequestMethod.POST)
    @ResponseBody
    public String updateMyPicture(@RequestParam("pic_name") String pic_name, @RequestParam("pic_type") String pic_type, @RequestParam("pic_content") String pic_content,
                                  @RequestParam("account") String account, @RequestParam("pic_id") Integer pic_id) {
        int rows = pictureService.updateMyPicture(pic_name, pic_type, pic_content, account, pic_id);
        if (rows > 0) {
            return "OK";
        } else {
            return "FALL";
        }
    }

    /**
     * 下载
     */
    @RequestMapping(value = "/download.action")
    public ResponseEntity<byte[]> fileDownload(HttpServletRequest request, String filename)
            throws Exception {
        String path = request.getServletContext().getRealPath("/upload/");
        File file = new File(path + File.separator + filename);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachement", filename);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
    }


}