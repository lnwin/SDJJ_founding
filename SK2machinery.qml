import QtQuick 2.0

Item {


    id:mchainery
    width: parent.width
    height: parent.height



    property string layoutColor:"#00BFFF"
    property string mainColor:"#4682B4"
    property string itemColor:"#98F5FF"


    property double moveLength:100

    //====================================外框架
    property double frameWork_topMid_x: width*0.3
    property double frameWork_topMid_y: height*0.05
    property double frameWork_topLeft_x: frameWork_topMid_x-frameWork_topLength/2
    property double frameWork_topLeft_y: frameWork_topMid_y
    property double frameWork_topRight_x: frameWork_topMid_x+frameWork_topLength/2
    property double frameWork_topRight_y: frameWork_topMid_y
    property double frameWork_midLeft_x: frameWork_topMid_x-frameWork_bottomLength/2
    property double frameWork_midLeft_y: frameWork_topLeft_y+frameWork_Height/2
    property double frameWork_midRight_x: frameWork_topMid_x+frameWork_bottomLength/2
    property double frameWork_midRight_y: frameWork_midLeft_y
    property double frameWork_bottomLeft_x: frameWork_midLeft_x
    property double frameWork_bottomLeft_y: frameWork_midLeft_y+frameWork_Height/2
    property double frameWork_bottomRight_x: frameWork_bottomLeft_x+frameWork_bottomLength
    property double frameWork_bottomRight_y: frameWork_bottomLeft_y
    property double frameWork_topLength:toPixels(0.5);
    property double frameWork_bottomLength:toPixels(1);
    property double frameWork_Height:toPixels(1.5);
    property double dianjiCenter_x:frameWork_bottomRight_x-toPixels(0.1);
    property double dianjiCenter_y:frameWork_bottomRight_y-toPixels(0.05);
    property double rotaAngle: 30
    //===================================================摆臂属性
    property double bichang_0 :toPixels(0.15)


    //====================================滑杆尺寸
    property double polesHeight: frameWork_Height
    property double polesWidth: frameWork_topLength*0.15
    //=====================================探杆尺寸
    property double feelerLeverHeight:0
    property double feelerLeverWidth:0
    //=====================================电机尺寸
    property double eleMachineryHeight:0
    property double eleMachineryWidth:0
    //====================================
    //====================================
    //====================================
    //====================================
    //====================================
    property double topItem_mid_x: 0
    property double topItem_mid_y: 0


    onMoveLengthChanged:total.requestPaint()

    function toPixels(percentage) {
        return percentage *Math.min(mchainery.width, mchainery.height) * 0.5 ;
         }
    function degToRad(degrees) {
        return degrees * (Math.PI / 180);
         }
    function radToDeg(radians) {
        return radians * (180 / Math.PI);
    }


    Canvas {

            id:total
            width: mchainery.width
            height:mchainery.height

            onPaint:
            {
                var ctx = getContext("2d");
                //==========================================外框架
                 ctx.clearRect(0,0,width,height);
                 ctx.beginPath();
                 ctx.strokeStyle = mainColor;
                 ctx.lineWidth = 2;
                 ctx.moveTo(frameWork_topLeft_x, frameWork_topLeft_y);
                 ctx.lineTo(frameWork_midLeft_x, frameWork_midLeft_y);
                 ctx.lineTo(frameWork_bottomLeft_x, frameWork_bottomLeft_y);
                 ctx.lineTo(frameWork_bottomRight_x, frameWork_bottomRight_y);
                 ctx.lineTo(frameWork_midRight_x, frameWork_midRight_y);
                 ctx.lineTo(frameWork_topRight_x, frameWork_topRight_y);
                 ctx.closePath();
                 ctx.stroke();
                //==========================================外框架--底座+支架
                ctx.beginPath();
                ctx.moveTo(frameWork_bottomLeft_x-toPixels(0.02), frameWork_bottomLeft_y);
                ctx.lineTo(frameWork_bottomRight_x+toPixels(0.02), frameWork_bottomRight_y);
                ctx.lineTo(frameWork_bottomRight_x+toPixels(0.02), frameWork_bottomRight_y+toPixels(0.03));
                ctx.lineTo(frameWork_bottomLeft_x-toPixels(0.02), frameWork_bottomRight_y+toPixels(0.03));
                ctx.closePath();
                ctx.fillStyle =mainColor
                ctx.fill();
                ctx.beginPath();
                ctx.moveTo(frameWork_bottomLeft_x+toPixels(0.02), frameWork_bottomLeft_y+toPixels(0.03));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.07), frameWork_bottomLeft_y+toPixels(0.03));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.07), frameWork_bottomLeft_y+toPixels(0.09));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.02), frameWork_bottomLeft_y+toPixels(0.09));
                ctx.closePath();
                ctx.fillStyle =mainColor
                ctx.fill();
                ctx.beginPath();
                ctx.moveTo(frameWork_bottomLeft_x+toPixels(0.005), frameWork_bottomLeft_y+toPixels(0.09));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.085), frameWork_bottomLeft_y+toPixels(0.09));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.085), frameWork_bottomLeft_y+toPixels(0.1));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.005), frameWork_bottomLeft_y+toPixels(0.1));
                ctx.closePath();
                ctx.fillStyle =mainColor
                ctx.fill();

                ctx.beginPath();
                ctx.moveTo(frameWork_bottomRight_x-toPixels(0.02), frameWork_bottomRight_y+toPixels(0.03));
                ctx.lineTo(frameWork_bottomRight_x-toPixels(0.07), frameWork_bottomRight_y+toPixels(0.03));
                ctx.lineTo(frameWork_bottomRight_x-toPixels(0.07), frameWork_bottomRight_y+toPixels(0.09));
                ctx.lineTo(frameWork_bottomRight_x-toPixels(0.02), frameWork_bottomRight_y+toPixels(0.09));
                ctx.closePath();
                ctx.fillStyle =mainColor
                ctx.fill();
                ctx.beginPath();
                ctx.moveTo(frameWork_bottomRight_x-toPixels(0.005), frameWork_bottomRight_y+toPixels(0.09));
                ctx.lineTo(frameWork_bottomRight_x-toPixels(0.085), frameWork_bottomRight_y+toPixels(0.09));
                ctx.lineTo(frameWork_bottomRight_x-toPixels(0.085), frameWork_bottomRight_y+toPixels(0.1));
                ctx.lineTo(frameWork_bottomRight_x-toPixels(0.005), frameWork_bottomRight_y+toPixels(0.1));
                ctx.closePath();
                ctx.fillStyle =mainColor
                ctx.fill();


                //=========================================画布边框
                 ctx.beginPath();
                 //ctx.strokeStyle = mainColor;
                 ctx.lineWidth = 3;
                 ctx.moveTo(width*0.95, 0);
                 ctx.lineTo(width*0.95, height);
                 ctx.stroke();
                 ctx.beginPath();
                 ctx.strokeStyle = mainColor;
                 ctx.lineWidth = 3;
                 ctx.moveTo(5, 0);
                 ctx.lineTo(5, height);
                 ctx.stroke();
                //==========================================滑杆
                 ctx.beginPath();
                 ctx.lineWidth =1;
                 ctx.moveTo(frameWork_topLeft_x, frameWork_topLeft_y);
                 ctx.lineTo(frameWork_topLeft_x, frameWork_topLeft_y+frameWork_Height);
                 ctx.lineTo(frameWork_topLeft_x+polesWidth, frameWork_topLeft_y+frameWork_Height);
                 ctx.lineTo(frameWork_topLeft_x+polesWidth, frameWork_topLeft_y);
                 ctx.closePath();
                 //ctx.fillStyle = Qt.rgba(1, 0, 0, 0.5);
                 ctx.fillStyle =mainColor
                 ctx.fill();
                 ctx.beginPath();
                // ctx.lineWidth =3;
                // ctx.strokeStyle = mainColor;
                 ctx.moveTo(frameWork_topRight_x-polesWidth, frameWork_topRight_y);
                 ctx.lineTo(frameWork_topRight_x-polesWidth, frameWork_topRight_y+frameWork_Height);
                 ctx.lineTo(frameWork_topRight_x, frameWork_topRight_y+frameWork_Height);
                 ctx.lineTo(frameWork_topRight_x, frameWork_topRight_y);
                 ctx.closePath();
                // ctx.stroke();
                //ctx.fillStyle = Qt.rgba(1, 0, 0, 0.5);
                 ctx.fillStyle =mainColor;
                 ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topLeft_x+polesWidth, frameWork_topLeft_y);
                ctx.lineTo(frameWork_topLeft_x+polesWidth, frameWork_topLeft_y+polesWidth);
                ctx.lineTo(frameWork_topLeft_x+polesWidth*1.5, frameWork_topLeft_y+polesWidth);
                ctx.lineTo(frameWork_topLeft_x+polesWidth*2, frameWork_topLeft_y+polesWidth*0.5);
                ctx.lineTo( frameWork_topRight_x-polesWidth*2 ,frameWork_topLeft_y+polesWidth*0.5);
                ctx.lineTo(frameWork_topRight_x-polesWidth*1.5, frameWork_topLeft_y+polesWidth);
                ctx.lineTo(frameWork_topRight_x-polesWidth, frameWork_topLeft_y+polesWidth);
                ctx.lineTo(frameWork_topRight_x-polesWidth, frameWork_topRight_y);
                ctx.closePath();
                //ctx.fillStyle = Qt.rgba(1, 0, 0, 0.5);
                ctx.fillStyle =mainColor
                ctx.fill();
                //==========================================钢丝绳
                ctx.beginPath();
                ctx.lineWidth =toPixels(0.01);
                ctx.strokeStyle = mainColor;
                ctx.moveTo(frameWork_topMid_x, frameWork_topMid_y+polesWidth*0.5);
                ctx.lineTo(frameWork_topMid_x, frameWork_topMid_y+polesWidth*0.5+moveLength);
                ctx.stroke();
                //==========================================电机
                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*1, frameWork_topMid_y+polesWidth*0.5+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*1, frameWork_topMid_y+polesWidth*0.5+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*1, frameWork_topMid_y+polesWidth*0.7+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*1, frameWork_topMid_y+polesWidth*0.7+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*0.8, frameWork_topMid_y+polesWidth*0.7+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.8, frameWork_topMid_y+polesWidth*0.7+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.8, frameWork_topMid_y+polesWidth*2.7+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*0.8, frameWork_topMid_y+polesWidth*2.7+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();
                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*1, frameWork_topMid_y+polesWidth*2.7+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*1, frameWork_topMid_y+polesWidth*2.7+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*1, frameWork_topMid_y+polesWidth*2.9+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*1, frameWork_topMid_y+polesWidth*2.9+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*0.65, frameWork_topMid_y+polesWidth*2.9+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.65, frameWork_topMid_y+polesWidth*2.9+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.65, frameWork_topMid_y+polesWidth*3.9+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*0.65, frameWork_topMid_y+polesWidth*3.9+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();
                //==========================================固定架 上
                ctx.beginPath();
                ctx.lineWidth =5;
                ctx.strokeStyle = itemColor
                ctx.arc(frameWork_topMid_x,frameWork_topMid_y+polesWidth*1+moveLength,50,degToRad(230),degToRad(310))
                ctx.stroke();
                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*1.8, frameWork_topMid_y+polesWidth*2+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*1.8, frameWork_topMid_y*0.3+polesWidth*0.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.5, frameWork_topMid_y*0.3+polesWidth*0.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.5, frameWork_topMid_y+polesWidth*2+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();
                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x+polesWidth*1.8, frameWork_topMid_y+polesWidth*2+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*1.8, frameWork_topMid_y*0.3+polesWidth*0.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.5, frameWork_topMid_y*0.3+polesWidth*0.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.5, frameWork_topMid_y+polesWidth*2+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();
                //==========================================固定架 下
                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*1.8, frameWork_topMid_y+polesWidth*3.9+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*1.8, frameWork_topMid_y+polesWidth*3.9+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.8, frameWork_topMid_y+polesWidth*4.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.8, frameWork_topMid_y+polesWidth*4.1+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*1.8, frameWork_topMid_y+polesWidth*3.9+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*1.8, frameWork_topMid_y+polesWidth*3.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.6, frameWork_topMid_y+polesWidth*3.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.6, frameWork_topMid_y+polesWidth*3.9+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x+polesWidth*1.8, frameWork_topMid_y+polesWidth*3.9+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*1.8, frameWork_topMid_y+polesWidth*3.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.6, frameWork_topMid_y+polesWidth*3.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.6, frameWork_topMid_y+polesWidth*3.9+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();
                //==========================================固定架 侧
                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*2.25, frameWork_topMid_y+polesWidth*3.5+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*2.25, frameWork_topMid_y*0.7+polesWidth*0.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.9, frameWork_topMid_y*0.7+polesWidth*0.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.9, frameWork_topMid_y+polesWidth*3.5+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();
                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x+polesWidth*2.25, frameWork_topMid_y+polesWidth*3.5+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*2.25, frameWork_topMid_y*0.7+polesWidth*0.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.9, frameWork_topMid_y*0.7+polesWidth*0.1+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.9, frameWork_topMid_y+polesWidth*3.5+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*3, frameWork_topMid_y+polesWidth+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*3, frameWork_topMid_y*0.7+polesWidth+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.5, frameWork_topMid_y*0.7+polesWidth+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.5, frameWork_topMid_y+polesWidth+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x+polesWidth*3, frameWork_topMid_y+polesWidth+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*3, frameWork_topMid_y*0.7+polesWidth+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.5, frameWork_topMid_y*0.7+polesWidth+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.5, frameWork_topMid_y+polesWidth+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*3.3, frameWork_topMid_y*2.3+polesWidth+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*3.3, frameWork_topMid_y*2+polesWidth+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.6, frameWork_topMid_y*2+polesWidth+moveLength);
                 ctx.lineTo(frameWork_topMid_x-polesWidth*1.6, frameWork_topMid_y*2.3+polesWidth+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =3;
                ctx.strokeStyle = itemColor
                ctx.moveTo(frameWork_topMid_x-polesWidth*3.33, frameWork_topMid_y*2.4+polesWidth+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*3.33, frameWork_topMid_y*1.9+polesWidth+moveLength);
                ctx.stroke();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x+polesWidth*3.3, frameWork_topMid_y*2.3+polesWidth+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*3.3, frameWork_topMid_y*2+polesWidth+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.6, frameWork_topMid_y*2+polesWidth+moveLength);
                 ctx.lineTo(frameWork_topMid_x+polesWidth*1.6, frameWork_topMid_y*2.3+polesWidth+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =3;
                ctx.strokeStyle = itemColor
                ctx.moveTo(frameWork_topMid_x+polesWidth*3.33, frameWork_topMid_y*2.4+polesWidth+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*3.33, frameWork_topMid_y*1.9+polesWidth+moveLength);
                ctx.stroke();
              //=================================================探杆
                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*0.5, frameWork_topMid_y+polesWidth*4.1+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.5, frameWork_topMid_y+polesWidth*4.1+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.5, frameWork_topMid_y+polesWidth*4.3+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*0.5, frameWork_topMid_y+polesWidth*4.3+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*0.2, frameWork_topMid_y+polesWidth*4.3+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.2, frameWork_topMid_y+polesWidth*4.3+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.2, frameWork_topMid_y+polesWidth*16.3+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*0.2, frameWork_topMid_y+polesWidth*16.3+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*0.3, frameWork_topMid_y+polesWidth*16.3+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.3, frameWork_topMid_y+polesWidth*16.3+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.3, frameWork_topMid_y+polesWidth*16.9+moveLength);
                ctx.lineTo(frameWork_topMid_x-polesWidth*0.3, frameWork_topMid_y+polesWidth*16.9+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =1;
                ctx.moveTo(frameWork_topMid_x-polesWidth*0.3, frameWork_topMid_y+polesWidth*16.9+moveLength);
                ctx.lineTo(frameWork_topMid_x+polesWidth*0.3, frameWork_topMid_y+polesWidth*16.9+moveLength);
                ctx.lineTo(frameWork_topMid_x, frameWork_topMid_y+polesWidth*17.3+moveLength);
                ctx.closePath();
                ctx.fillStyle =itemColor
                ctx.fill();


                ctx.fillStyle=itemColor;
                ctx.textAlign="center";
                ctx.font="17px Arial"
                var message = "下插深度:%1"
                var count = moveLength.toFixed(0)-50
               // console.log(message.arg(count))
                ctx.fillText(message.arg(count),frameWork_topMid_x-polesWidth*4,frameWork_topMid_y+polesWidth*21+moveLength*0.7)
                // ctx.font="20px Arial"
                // ctx.fillText(String(moveLength.toFixed(0)-50),frameWork_topMid_x-polesWidth*2.4,frameWork_topMid_y+polesWidth*19+moveLength*0.7)
                //=========================================扩展臂--系列

                //=========================================扩展旋转电机


                ctx.beginPath();
                ctx.arc(dianjiCenter_x,dianjiCenter_y,toPixels(0.045),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle =itemColor
                ctx.fill();
                //=========================================扩展臂--臂长
                var bichang_0=toPixels(0.15);
                ctx.beginPath();
                ctx.lineWidth =toPixels(0.03);
                var bichang_0_endx=dianjiCenter_x+Math.cos(degToRad(90-rotaAngle))*bichang_0;
                var bichang_0_endy=dianjiCenter_y-Math.sin(degToRad(90-rotaAngle))*bichang_0
                ctx.moveTo(dianjiCenter_x, dianjiCenter_y);
                ctx.lineTo(bichang_0_endx,bichang_0_endy);
                ctx.stroke()
                ctx.beginPath();
                ctx.arc(bichang_0_endx, bichang_0_endy,toPixels(0.015),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle =itemColor
                ctx.fill();
                ctx.beginPath();
                var bichang_1=toPixels(0.07);
                var bichang_1_endx=bichang_0_endx+Math.sin(degToRad(90-rotaAngle))*bichang_1;
                var bichang_1_endy=bichang_0_endy+Math.sin(degToRad(rotaAngle))*bichang_1;
                ctx.moveTo(bichang_0_endx, bichang_0_endy);
                ctx.lineTo(bichang_1_endx, bichang_1_endy);
                ctx.stroke()

                ctx.beginPath();
                ctx.arc(bichang_1_endx, bichang_1_endy,toPixels(0.015),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                var bichang_2=toPixels(0.7);
                var bichang_2_endx=bichang_1_endx+Math.cos(degToRad(90-rotaAngle))*bichang_2;
                var bichang_2_endy=bichang_1_endy-Math.sin(degToRad(90-rotaAngle))*bichang_2;
                ctx.moveTo(bichang_1_endx, bichang_1_endy);
                ctx.lineTo(bichang_2_endx, bichang_2_endy);
                ctx.stroke()




            }









          }







}
