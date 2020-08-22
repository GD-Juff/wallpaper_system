package com.chfeng.session;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener{
public static HashMap<String,String> userMap = new HashMap<String,String>();  
 
public static HashMap<String,HttpSession> sessionMap = new HashMap<String,HttpSession>();
@Override
public void sessionCreated(HttpSessionEvent httpSessionEvent) {
// TODO Auto-generated method stub
 
}
 
 
@Override
public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
// TODO Auto-generated method stub
		HttpSession session = httpSessionEvent.getSession();  
        String sessionId = session.getId();  
        sessionMap.remove(sessionId);  
        for(String key : userMap.keySet()){  
            if(userMap.get(key).equals(sessionId)){  
                userMap.remove(key);  
            }  
        }  
}
 
 
}
