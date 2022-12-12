import QtQuick 6.4
import QtQuick.Controls 6.4
Item


{

id:myAircraftdashboard

width: 100
height: 100

property double angleValue: 120
property double endAngle: angleValue+180
property double midAngle: angleValue-90
property double tickmarkInset: toPixels(0.04)
property double minorTickmarkInset: 0
property double tickmarkStepSize: 30//刻度间隔
property double labelStepSize: 30//刻度字体间隔
property double minValue:120
property double maxValue:450
property double stepAngle:30

property double needleTopPosition_x:0
property double needleTopPosition_y:0
property double needleBotPosition_0_x:100
property double needleBotPosition_0_y:100
property double needleBotPosition_1_x:200
property double needleBotPosition_1_y:200
property double needleBotWidth:10
property string itemName:"Pitch"



onAngleValueChanged: backPain.requestPaint()


function toPixels(percentage) {
    return percentage *Math.min(myAircraftdashboard.width, myAircraftdashboard.height) * 0.5 ;
     }
function degToRad(degrees) {
    return degrees * (Math.PI / 180);
     }
function radToDeg(radians) {
    return radians * (180 / Math.PI);
}
Canvas {

        id:backPain
        width: myAircraftdashboard.width
        height:myAircraftdashboard.height

       onPaint:
       {

           var ground = getContext("2d");


           ground.beginPath();
          // ground.lineWidth = width/2*0.07;
           ground.fillStyle = "#483D8B";
           ground.beginPath();
           ground.arc(width/2, height/2,Math.min(width, height)/2*0.95,
                      0,2*Math.PI);
           ground.fill();
            ground.beginPath();
           ground.fillStyle = "#8B4513";
           ground.arc(width/2, height/2, Math.min(width, height)/2*0.9, Math.PI * 2, 0)
           ground.fill();
           ///===========================sky
           ground.beginPath();//sky
           ground.fillStyle ="#1E90FF";
           ground.arc(width/2, height/2,
           // Start the line in from the decorations, and account for the width of the line itself.
           Math.min(width, height)/2*0.9,
           degToRad(angleValue),
           degToRad(endAngle), true);
           ground.fill();
           ///===========================sky


           ground.lineWidth = width/2*0.01;
           ground.strokeStyle = "#D3D3D3";
           ground.beginPath();
                       for(let i=minValue;i<maxValue;i+=tickmarkStepSize){
                           var tmp_x = (width/2)+Math.min(width, height)*0.42*Math.cos(i/180*Math.PI);
                           var tmp_y = (height/2)+Math.min(width, height)*0.42*Math.sin(i/180*Math.PI);
                           var bmp_x = (width/2)+Math.min(width, height)*0.35*Math.cos(i/180*Math.PI);
                           var bmp_y = (height/2)+Math.min(width, height)*0.35*Math.sin(i/180*Math.PI);
                           var tex_x = (width/2)+Math.min(width, height)*0.3*Math.cos(i/180*Math.PI);
                           var tex_y = (height/2)+Math.min(width, height)*0.3*Math.sin(i/180*Math.PI);
                           ground.fillStyle="#D3D3D3";
                           ground.textAlign="center";
                           ground.font="10px Arial"
                          // ground.font=toPixels(1)
                           ground.fillText(String(i-270),tex_x,tex_y)
                           ground.moveTo(tmp_x, tmp_y);
                           ground.lineTo(bmp_x, bmp_y);

                       }
                      for(let k=minValue;k<maxValue-20;k+=10)
                       {
                           var tmp_x_1 = (width/2)+Math.min(width, height)*0.42*Math.cos(k/180*Math.PI);
                           var tmp_y_1 = (height/2)+Math.min(width, height)*0.42*Math.sin(k/180*Math.PI);
                           var bmp_x_1 = (width/2)+Math.min(width, height)*0.4*Math.cos(k/180*Math.PI);
                           var bmp_y_1 = (height/2)+Math.min(width, height)*0.4*Math.sin(k/180*Math.PI);
                           ground.moveTo(tmp_x_1, tmp_y_1);
                           ground.lineTo(bmp_x_1, bmp_y_1);

                       }
           ground.stroke();

           needleTopPosition_x=(width/2)+width*0.28*Math.cos(midAngle/180*Math.PI);
           needleTopPosition_y=(height/2)+height*0.28*Math.sin(midAngle/180*Math.PI)
           var leftAngle = midAngle-radToDeg(Math.atan(needleBotWidth/(width*0.25))) ;
           var rightAngle= midAngle+radToDeg(Math.atan(needleBotWidth/(width*0.25))) ;
           needleBotPosition_0_x=(width/2)+width*0.20*Math.cos(leftAngle/180*Math.PI);
           needleBotPosition_0_y=(height/2)+height*0.20*Math.sin(leftAngle/180*Math.PI)
           needleBotPosition_1_x=(width/2)+width*0.20*Math.cos(rightAngle/180*Math.PI);
           needleBotPosition_1_y=(height/2)+height*0.20*Math.sin(rightAngle/180*Math.PI)

           ground.beginPath();
           ground.moveTo(needleBotPosition_0_x, needleBotPosition_0_y);
           ground.lineTo(needleTopPosition_x,needleTopPosition_y);//topPosition
           ground.lineTo(needleBotPosition_1_x, needleBotPosition_1_y);
           ground.closePath();
           ground.fillStyle = Qt.rgba(1, 0, 0, 0.5);
           ground.fill();



       }

       Text {
           id: angleText
           font.pixelSize: toPixels(0.2)
           font.weight: Font.Bold
           text: kphInt
           color: "white"
           horizontalAlignment: Text.AlignRight
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: parent.verticalCenter
           anchors.topMargin: toPixels(0.2)
           readonly property double kphInt: angleValue.toFixed(1)
       }
       Text {
           text: "°"
           color: "white"
           font.weight: Font.Bold
           //font.pointSize: 20
           font.pixelSize: toPixels(0.2)
           anchors.left: angleText.right
           anchors.top: angleText.top
          // anchors.topMargin: 25
           anchors.horizontalCenter: parent.horizontalCenter
       }
       Text {
           text: itemName
           color: "#FF7F24"
           font.weight: Font.Bold
           //font.pointSize: 20
           font.pixelSize: toPixels(0.2)
           anchors.top: angleText.bottom
           anchors.topMargin: toPixels(0.2)
           anchors.horizontalCenter: parent.horizontalCenter
       }
}





}
