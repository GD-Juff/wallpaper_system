(function(window, document, undefined) {
    var hearts = [];
    window.requestAnimationFrame = (function() {
        return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||
        function(callback) {
            setTimeout(callback, 1000 / 60);
        }
    })();
    init();
    function init() {
        css(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: absolute;}.heart:after{top: -5px;}.heart:before{left: -5px;}");
        attachEvent();
        gameloop();
    }
    function gameloop() {
        for (var i = 0; i < hearts.length; i++) {
            if (hearts[i].alpha <= 0) {
                document.body.removeChild(hearts[i].el);
                hearts.splice(i, 1);
                continue;
            }
            hearts[i].y--;
            hearts[i].scale += 0.004;
            hearts[i].alpha -= 0.013;
            hearts[i].el.style.cssText = "left:" + hearts[i].x + "px;top:" + hearts[i].y + "px;opacity:" + hearts[i].alpha + ";transform:scale(" + hearts[i].scale + "," + hearts[i].scale + ") rotate(45deg);background:" + hearts[i].color;
        }
        requestAnimationFrame(gameloop);
    }
    function attachEvent() {
        var old = typeof window.onclick === "function" && window.onclick;
        window.onclick = function(event) {
            old && old();
            createHeart(event);
        }
    }
    function createHeart(event) {
        var d = document.createElement("div");
        d.className = "heart";
        hearts.push({
            el: d,
            x: event.clientX - 5,
            y: event.clientY - 5,
            scale: 1,
            alpha: 1,
            color: randomColor()
        });
        document.body.appendChild(d);
    }
    function css(css) {
        var style = document.createElement("style");
        style.type = "text/css";
        try {
            style.appendChild(document.createTextNode(css));
        } catch(ex) {
            style.styleSheet.cssText = css;
        }
        document.getElementsByTagName('head')[0].appendChild(style);
    }
    function randomColor() {
        return "rgb(" + (~~ (Math.random() * 255)) + "," + (~~ (Math.random() * 255)) + "," + (~~ (Math.random() * 255)) + ")";
    }
})(window, document);

















//var c = document.getElementById("canv"),
//$ = c.getContext("2d");
//main();

// bitmap font
var clockAlpha = {
    " ": [ 0x00, 0x00, 0x00, 0x00, 0x00 ],
    "0": [ 0x3e, 0x45, 0x49, 0x51, 0x3e ],
    "1": [ 0x00, 0x21, 0x7f, 0x01, 0x00 ],
    "2": [ 0x21, 0x43, 0x45, 0x49, 0x31 ],
    "3": [ 0x22, 0x41, 0x49, 0x49, 0x36 ],
    "4": [ 0x0c, 0x14, 0x24, 0x7f, 0x04 ],
    "5": [ 0x72, 0x51, 0x51, 0x51, 0x4e ],
    "6": [ 0x1e, 0x29, 0x49, 0x49, 0x06 ],
    "7": [ 0x40, 0x47, 0x48, 0x50, 0x60 ],
    "8": [ 0x36, 0x49, 0x49, 0x49, 0x36 ],
    "9": [ 0x30, 0x49, 0x49, 0x4a, 0x3c ],
    ":": [ 0x00, 0x36, 0x36, 0x00 ]
};

var sec;   //seconds
var ld;    //last date
var colhue = 0; //color hue

var blkSize = 25;  //num block size
var blkGap = 2;   // block spacing
var charGap = 15;  //letter spacing
var hue_clk_Inc = 3;  //increment clock hue
var hue_row_Inc = 5; //increment row hue

function main() {
    window.setInterval(clkInt, 100); //clock interaval
    window.setInterval(rnbwInt, 30); //rainbow interval
}

function clkInt() {    
    var d = new Date();
    var s = d.getSeconds();

    if (s != sec) {
        sec = s;
        ld = d;
    }
}

function rnbwInt() {
    if (ld !== undefined) {
        colhue = incHue(colhue, hue_clk_Inc);

        draw();
    }
}

function draw() {
    var h = ld.getHours();
    var m = ld.getMinutes();
    var s = ld.getSeconds();
  
   //easy conversion to 'normal' hours:
   if(h == 0){  //if midnight (00 hours) hour = 12
      h=12;
   }
   else if (h >= 13 ){  //convert military hours at and over 1300 (1pm) to regular hours by subtracting 12. 
      h -=12;
   }
   //display
    var text = twoDigStr(h, " ") + ":" + twoDigStr(m, "0") + ":"
            + twoDigStr(s, "0");
   
    clear();

    var x = 10;
    var y = 10;
    var hue = colhue;

    for ( var i = 0; i < text.length; i++) {
        var ch = text.charAt(i);

        var rows = clockAlpha[ch];

        for ( var s = 0; s < rows.length; s++) {
            var row = rows[s];

            var color = new RGBACol();
            color.setFromHSV(hue, 1, 1, 1);
            $.shadowColor = 'hsla(0, 0%, 0%, .8)';
            $.shadowBlur = 25;
            $.shadowOffsetX = 10;
            $.shadowOffsetY = 5; 
            $.fillStyle = "rgb(" + color.r + "," + color.g + ","
                    + color.b + ")";

            for ( var d = 0; d < 7; d++) {
                if ((row & 1) != 0) {
                    var blkIdx = 6 - d;

                    var blkX = x;
                    var blkY = y + blkIdx * (blkSize + blkGap);

                    $.fillRect(blkX, blkY, blkSize, blkSize);
                }

                row >>= 1;
            }

            x += blkSize + blkGap;
            hue = incHue(hue, hue_row_Inc);
        }

        x += charGap;
    }
}

function clear() {
    $.clearRect(0, 0, c.width, c.height);
}

function twoDigStr(v, padding) {
    var s = String(v);
    return s.length == 1 ? padding + s : s;
}

function incHue(hue, inc) {
    return (hue + inc) % 360;
}


function RGBACol(r, g, b, alpha) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.alpha = alpha;
}

RGBACol.prototype.setFromHSV = function(h, s, v, alpha) {
    h = h % 360;

    if (h < 0) {
        h += 360;
    }

    var c = v * s;
    var h1 = h / 60;
    var x = c * (1 - Math.abs(h1%2 - 1));
    var r1 = 0, g1 = 0, b1 = 0;

    switch (Math.floor(h1)) {
    case 0: r1 = c; g1 = x; b1 = 0; break;
    case 1: r1 = x; g1 = c; b1 = 0; break;
    case 2: r1 = 0; g1 = c; b1 = x; break;
    case 3: r1 = 0; g1 = x; b1 = c; break;
    case 4: r1 = x; g1 = 0; b1 = c; break;
    case 5: r1 = c; g1 = 0; b1 = x; break;
    }

    var m = v - c;

    this.r = Math.floor((r1 + m) * 255);
    this.g = Math.floor((g1 + m) * 255);
    this.b = Math.floor((b1 + m) * 255);
    this.alpha = alpha;
};

RGBACol.prototype.setRGBA = function(r, g, b, alpha) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.alpha = alpha;
};

