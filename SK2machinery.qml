import QtQuick 6.4

Item {


    id:mchainery
    width: parent.width
    height: parent.height



    property string layoutColor:"#00BFFF"
    property string mainColor:"#4682B4"
    property string itemColor:"#98F5FF"
    property string textColor:"#9AFF9A"
    property string groundColor:"#2F4F4F"
    property string mainwindowColor:"#01113a"



    //=======================================参数变量
    property double moveLength:100
    property double pushLength: 0
    property double rotateAngle: 30
    property double distance2Base:1
    property double waterDepth: 30
    property double transducerPressure:0
    property double cylinderPressure:0



    onMoveLengthChanged:total.requestPaint()
    onPushLengthChanged:total.requestPaint()
    onRotateAngleChanged: total.requestPaint()
    onDistance2BaseChanged: total.requestPaint()
    onWaterDepthChanged: total.requestPaint()
    onTransducerPressureChanged: total.requestPaint()
    onCylinderPressureChanged: total.requestPaint()


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
    property double dianjiCenter_y:frameWork_bottomRight_y-toPixels(0.035)-pushLength;

    property double dianjikuangjialeft_x:frameWork_bottomRight_x-toPixels(0.1);
    property double dianjikuangjialeft_y:frameWork_bottomRight_y-toPixels(0.05)

    //===================================================摆臂属性
    property double bichang_0 :toPixels(0.15)
    property double bichang_0_endx:dianjiCenter_x+Math.cos(degToRad(90-rotateAngle))*bichang_0;
    property double bichang_0_endy:dianjiCenter_y-Math.sin(degToRad(90-rotateAngle))*bichang_0
    property double bichang_1:toPixels(0.07);
    property double bichang_1_endx:bichang_0_endx+Math.sin(degToRad(90-rotateAngle))*bichang_1;
    property double bichang_1_endy:bichang_0_endy+Math.sin(degToRad(rotateAngle))*bichang_1;
    property double bichang_2:toPixels(0.7);
    property double bichang_2_endx:bichang_1_endx+Math.cos(degToRad(90-rotateAngle))*bichang_2;
    property double bichang_2_endy:bichang_1_endy-Math.sin(degToRad(90-rotateAngle))*bichang_2;

    property double sensordistance:toPixels(0.15);
    property double sensorArmLength:toPixels(0.1);


    property double sensor_0_start_x: bichang_1_endx+Math.cos(degToRad(90-rotateAngle))*toPixels(0.07);
    property double sensor_0_start_y: bichang_1_endy-Math.sin(degToRad(90-rotateAngle))*toPixels(0.07);
    property double sensor_0_end_x:sensor_0_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength;
    property double sensor_0_end_y:sensor_0_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength;

    property double sensor_0_ball_x: sensor_0_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength*0.6;
    property double sensor_0_ball_y: sensor_0_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength*0.6;


    property double sensor_1_start_x: sensor_0_start_x+Math.cos(degToRad(90-rotateAngle))*sensordistance;
    property double sensor_1_start_y:sensor_0_start_y-Math.sin(degToRad(90-rotateAngle))*sensordistance;
    property double sensor_1_end_x:sensor_1_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength
    property double sensor_1_end_y:sensor_1_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength

    property double sensor_1_ball_x: sensor_1_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength*0.6;
    property double sensor_1_ball_y: sensor_1_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength*0.6;

    property double sensor_2_start_x: sensor_1_start_x+Math.cos(degToRad(90-rotateAngle))*sensordistance;
    property double sensor_2_start_y:sensor_1_start_y-Math.sin(degToRad(90-rotateAngle))*sensordistance;
    property double sensor_2_end_x:sensor_2_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength
    property double sensor_2_end_y:sensor_2_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength

    property double sensor_2_ball_x: sensor_2_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength*0.6;
    property double sensor_2_ball_y: sensor_2_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength*0.6;

    property double sensor_3_start_x: sensor_2_start_x+Math.cos(degToRad(90-rotateAngle))*sensordistance;
    property double sensor_3_start_y:sensor_2_start_y-Math.sin(degToRad(90-rotateAngle))*sensordistance;
    property double sensor_3_end_x:sensor_3_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength
    property double sensor_3_end_y:sensor_3_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength

    property double tP_x:sensor_3_end_x+Math.cos(degToRad(rotateAngle))*sensorArmLength*2
    property double tP_y:sensor_3_end_y+Math.sin(degToRad(rotateAngle))*sensorArmLength*2

    property double sensor_3_ball_x: sensor_3_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength*0.6;
    property double sensor_3_ball_y: sensor_3_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength*0.6;

    property double sensor_4_start_x: sensor_3_start_x+Math.cos(degToRad(90-rotateAngle))*sensordistance;
    property double sensor_4_start_y:sensor_3_start_y-Math.sin(degToRad(90-rotateAngle))*sensordistance;
    property double sensor_4_end_x:sensor_4_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength
    property double sensor_4_end_y:sensor_4_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength

    property double sensor_4_ball_x: sensor_4_start_x+Math.cos(degToRad(rotateAngle))*sensorArmLength*0.6;
    property double sensor_4_ball_y: sensor_4_start_y+Math.sin(degToRad(rotateAngle))*sensorArmLength*0.6;
    //====================================海底尺寸
    property double base_mid_x:width*0.3
    property double base_mid_y:frameWork_bottomRight_y+toPixels(0.1);


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
//                 ctx.beginPath();
//                 ctx.strokeStyle = mainColor;
//                 ctx.lineWidth = 2;
//                 ctx.moveTo(frameWork_topLeft_x, frameWork_topLeft_y);
//                 ctx.lineTo(frameWork_midLeft_x, frameWork_midLeft_y);
//                 ctx.lineTo(frameWork_bottomLeft_x, frameWork_bottomLeft_y);
//                 ctx.lineTo(frameWork_bottomRight_x, frameWork_bottomRight_y);
//                 ctx.lineTo(frameWork_midRight_x, frameWork_midRight_y);
//                 ctx.lineTo(frameWork_topRight_x, frameWork_topRight_y);
//                 ctx.closePath();
//                 ctx.stroke();
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
                //==========================================油缸
                ctx.beginPath();
                ctx.lineWidth = toPixels(0.15);
                ctx.strokeStyle = mainColor;
                ctx.moveTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y);
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.03));
                ctx.stroke();
                ctx.beginPath();
                ctx.lineWidth = toPixels(0.17);
                ctx.strokeStyle = mainColor;
                ctx.moveTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.03));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.04));
                ctx.stroke();

                ctx.beginPath();
                ctx.lineWidth = toPixels(0.15);
                ctx.strokeStyle = mainColor;
                ctx.moveTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.04));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.2));
                ctx.stroke();
                ctx.beginPath();
                ctx.lineWidth = toPixels(0.17);
                ctx.strokeStyle = mainColor;
                ctx.moveTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.2));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.21));
                ctx.stroke();

                ctx.beginPath();
                ctx.lineWidth = toPixels(0.13);
                ctx.strokeStyle = mainColor;
                ctx.moveTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.21));
                ctx.lineTo(frameWork_bottomLeft_x+toPixels(0.1), frameWork_bottomLeft_y-toPixels(0.24));
                ctx.stroke();

                ctx.textAlign="center";
                ctx.font="17px Arial"
                ctx.fillStyle=itemColor
                ctx.fillText(String("油缸压力"),frameWork_bottomLeft_x+toPixels(0.1),frameWork_bottomLeft_y-toPixels(0.45))
                ctx.fillStyle=textColor
                var ygyl = "%1bar"
                var ygyl_value = cylinderPressure.toFixed(2)
                ctx.textAlign="center";
                ctx.font="20px Arial"
               // console.log(message.arg(count))
                ctx.fillText(ygyl.arg(ygyl_value),frameWork_bottomLeft_x+toPixels(0.1),frameWork_bottomLeft_y-toPixels(0.35))

                //========================================== 离底高度绘图

                ctx.beginPath();
                var grd=ctx.createLinearGradient(base_mid_x,base_mid_y+distance2Base,base_mid_x,height);
                grd.addColorStop(0,groundColor);
                grd.addColorStop(1,mainwindowColor);
                ctx.fillStyle=grd;
                ctx.fillRect(base_mid_x-toPixels(1),base_mid_y+distance2Base,base_mid_x+toPixels(2),height);
                ctx.fill();

                ctx.textAlign="center";
                ctx.font="17px Arial"
                ctx.fillStyle=itemColor
                ctx.fillText(String("离底高度"),base_mid_x+toPixels(0.3),base_mid_y+distance2Base+toPixels(0.2))
                ctx.fillStyle=textColor
                var ldgd = "%1mm"
                var ldgdt_value = distance2Base.toFixed(0)
                ctx.textAlign="center";
                ctx.font="25px Arial"
               // console.log(message.arg(count))
                ctx.fillText(ldgd.arg(ldgdt_value),base_mid_x+toPixels(0.3),base_mid_y+distance2Base+toPixels(0.3))
                ctx.fillStyle=itemColor
                ctx.textAlign="center";
                ctx.font="20px Arial"
                ctx.fillText(String("入水深度:"),dianjiCenter_x+toPixels(0.5),dianjikuangjialeft_y-toPixels(1.4))
                ctx.fillStyle=textColor
                ctx.textAlign="left";
                var rssd = "%1m"
                var rssd_text = waterDepth.toFixed(0)
                ctx.font="25px Arial"
               // console.log(message.arg(count))
                ctx.fillText(rssd.arg(rssd_text),dianjiCenter_x+toPixels(0.7),dianjikuangjialeft_y-toPixels(1.4))


                //=========================================画布边框
//                 ctx.beginPath();
//                 //ctx.strokeStyle = mainColor;
//                 ctx.lineWidth = 3;
//                 ctx.moveTo(width*0.95, 0);
//                 ctx.lineTo(width*0.95, height);
//                 ctx.stroke();
//                 ctx.beginPath();
//                 ctx.strokeStyle = mainColor;
//                 ctx.lineWidth = 3;
//                 ctx.moveTo(5, 0);
//                 ctx.lineTo(5, height);
//                 ctx.stroke();
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

                ctx.fillText(String("下插深度:"),frameWork_topMid_x-polesWidth*5,frameWork_topMid_y+polesWidth*21+moveLength*0.7)
                 ctx.fillStyle=textColor
                var xc = "%1mm"
                var count_5 =  moveLength .toFixed(0)
                ctx.textAlign="left";
                ctx.font="25px Arial"
                ctx.fillText(xc.arg(count_5),frameWork_topMid_x-polesWidth*6,frameWork_topMid_y+polesWidth*22.5+moveLength*0.7)

                // ctx.font="20px Arial"
                // ctx.fillText(String(moveLength.toFixed(0)-50),frameWork_topMid_x-polesWidth*2.4,frameWork_topMid_y+polesWidth*19+moveLength*0.7)
                //=========================================扩展臂--系列
                //=============================================摆臂上提油缸结构

                ctx.beginPath();
                ctx.lineWidth =toPixels(0.02);
                ctx.strokeStyle = mainColor
                ctx.moveTo(dianjikuangjialeft_x-toPixels(0.07), dianjikuangjialeft_y+toPixels(0.05))
                ctx.lineTo(dianjikuangjialeft_x-toPixels(0.07), dianjikuangjialeft_y-toPixels(0.1));
                ctx.lineTo(dianjikuangjialeft_x+toPixels(0.07), dianjikuangjialeft_y-toPixels(0.1));
                ctx.lineTo(dianjikuangjialeft_x+toPixels(0.07), dianjikuangjialeft_y+toPixels(0.05));
                ctx.stroke()

                ctx.beginPath();
                ctx.moveTo(dianjikuangjialeft_x-toPixels(0.02), dianjikuangjialeft_y-toPixels(0.1));
                ctx.lineTo(dianjikuangjialeft_x-toPixels(0.02), dianjikuangjialeft_y-toPixels(0.2));
                ctx.lineTo(dianjikuangjialeft_x+toPixels(0.02), dianjikuangjialeft_y-toPixels(0.2));
                ctx.lineTo(dianjikuangjialeft_x+toPixels(0.02), dianjikuangjialeft_y-toPixels(0.1));

                ctx.closePath()
                ctx.fillStyle = mainColor
                ctx.fill();
                ctx.beginPath();
                ctx.lineWidth =toPixels(0.03);
                ctx.moveTo(dianjikuangjialeft_x, dianjikuangjialeft_y-toPixels(0.2));
                ctx.lineTo(dianjikuangjialeft_x, dianjikuangjialeft_y-toPixels(0.25));
                ctx.stroke()
                //=============================================================
                //=========================================扩展旋转电机
                ctx.beginPath();
                ctx.arc(dianjiCenter_x,dianjiCenter_y,toPixels(0.03),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();
                ctx.lineWidth =toPixels(0.03);
                 ctx.strokeStyle = itemColor
                ctx.moveTo(dianjiCenter_x, dianjiCenter_y);
                ctx.lineTo(bichang_0_endx,bichang_0_endy);
                ctx.stroke()
                ctx.beginPath();
                ctx.arc(bichang_0_endx, bichang_0_endy,toPixels(0.015),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle =itemColor
                ctx.fill();
                ctx.beginPath();

                ctx.moveTo(bichang_0_endx, bichang_0_endy);
                ctx.lineTo(bichang_1_endx, bichang_1_endy);
                ctx.stroke()

                ctx.beginPath();
                ctx.arc(bichang_1_endx, bichang_1_endy,toPixels(0.015),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle =itemColor
                ctx.fill();

                ctx.beginPath();

                ctx.moveTo(bichang_1_endx, bichang_1_endy);
                ctx.lineTo(bichang_2_endx, bichang_2_endy);
                ctx.stroke()
                //=========================================扩展旋转-水听器
                ctx.lineWidth =toPixels(0.01);
                ctx.beginPath();
                ctx.moveTo(sensor_0_start_x, sensor_0_start_y);
                ctx.lineTo(sensor_0_end_x, sensor_0_end_y);
                ctx.stroke()
                ctx.beginPath();
                ctx.arc(sensor_0_ball_x, sensor_0_ball_y,toPixels(0.02),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle = itemColor
                ctx.fill();

                ctx.lineWidth =toPixels(0.01);
                ctx.beginPath();
                ctx.moveTo(sensor_1_start_x, sensor_1_start_y);
                ctx.lineTo(sensor_1_end_x, sensor_1_end_y);
                ctx.stroke()
                ctx.beginPath();
                ctx.arc(sensor_1_ball_x, sensor_1_ball_y,toPixels(0.02),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle = itemColor
                ctx.fill();

                ctx.lineWidth =toPixels(0.01);
                ctx.beginPath();
                ctx.moveTo(sensor_2_start_x, sensor_2_start_y);
                ctx.lineTo(sensor_2_end_x, sensor_2_end_y);
                ctx.stroke()
                ctx.beginPath();
                ctx.arc(sensor_2_ball_x, sensor_2_ball_y,toPixels(0.02),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle = itemColor
                ctx.fill();

                ctx.lineWidth =toPixels(0.01);
                ctx.beginPath();
                ctx.moveTo(sensor_3_start_x, sensor_3_start_y);
                ctx.lineTo(sensor_3_end_x, sensor_3_end_y);
                ctx.stroke()
                ctx.beginPath();
                ctx.arc(sensor_3_ball_x, sensor_3_ball_y,toPixels(0.02),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle = itemColor
                ctx.fill();

                ctx.lineWidth =toPixels(0.01);
                ctx.beginPath();
                ctx.moveTo(sensor_4_start_x, sensor_4_start_y);
                ctx.lineTo(sensor_4_end_x, sensor_4_end_y);
                ctx.stroke()
                ctx.beginPath();
                ctx.arc(sensor_4_ball_x, sensor_4_ball_y,toPixels(0.03),0,2*Math.PI)
                ctx.closePath()
                ctx.fillStyle = itemColor
                ctx.fill();

                ctx.textAlign="center";
                ctx.font="17px Arial"
                ctx.fillText(String("摆臂角度:"),sensor_3_ball_x-toPixels(0.1),sensor_4_ball_y-toPixels(0.4))
                 ctx.fillStyle=textColor
                var bd = "%1°"
                var count_4 = rotateAngle.toFixed(1)
                ctx.textAlign="left";
                ctx.font="25px Arial"
               // console.log(message.arg(count))
                ctx.fillText(bd.arg(count_4),sensor_3_ball_x+toPixels(0.05),sensor_4_ball_y-toPixels(0.4))

                ctx.fillStyle=itemColor
                ctx.textAlign="center";
                ctx.font="17px Arial"
                ctx.fillText(String("换能器压力"),tP_x,tP_y)
                ctx.fillStyle=textColor
                ctx.textAlign="center";
                var hnqyl = "%1bar"
                var hnqyl_text = transducerPressure.toFixed(2)
                ctx.font="25px Arial"
               // console.log(message.arg(count))
                ctx.fillText(hnqyl.arg(hnqyl_text),tP_x,tP_y+toPixels(0.1))

                //====================================================电机上拉提板

                ctx.beginPath();
                ctx.lineWidth =toPixels(0.01);
                ctx.strokeStyle = itemColor
                ctx.moveTo(dianjiCenter_x, dianjiCenter_y)
                ctx.lineTo(dianjiCenter_x, dianjikuangjialeft_y-toPixels(0.09));
                ctx.stroke()
                ctx.fillStyle=itemColor
                ctx.textAlign="center";
                ctx.font="12px Arial"
               // ctx.fillText(String("移动距离"),dianjiCenter_x-toPixels(0.05),dianjikuangjialeft_y-toPixels(0.45))
                ctx.fillText(String("移动距离"),dianjiCenter_x-toPixels(0.05),dianjikuangjialeft_y-toPixels(0.38))
                ctx.fillStyle=textColor
                ctx.textAlign="left";
                var message_2 = "%1mm"
                var count_2 = pushLength.toFixed(0)
                ctx.font="17px Arial"
               // console.log(message.arg(count))
                ctx.fillText(message_2.arg(count_2),dianjiCenter_x-toPixels(0.13),dianjikuangjialeft_y-toPixels(0.3))





               //====================================================







            }









          }







}
