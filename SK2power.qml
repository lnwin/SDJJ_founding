import QtQuick

Item {
    id:power
    width: 200
    height: 100
    property string itemColor:"#98F5FF"
    property string textColor:"#9AFF9A"

    function toPixels(percentage) {
        return percentage *Math.min(power.width, power.height) * 0.5 ;
         }
    function degToRad(degrees) {
        return degrees * (Math.PI / 180);
         }
    function radToDeg(radians) {
        return radians * (180 / Math.PI);
    }

    //======================================参数变量
     property double inputPower:78
     property double totalPower:100
     property string itemName:"动力电池"

     onInputPowerChanged: mainCan.requestPaint()

    //=====================================绘制参量
     property double cornerRadius:toPixels(0.1)
     property double start_x:toPixels(0.3)
     property double start_y:toPixels(0.3)
     property double powerWidth:toPixels(4.5)
     property double powerHeight:toPixels(1.4)
     property double powerMargin:toPixels(0.43)


    //=====================================

    Canvas {

            id:mainCan
            width: power.width
            height:power.height

            onPaint:
            {

                var ctx = getContext("2d");
                ctx.clearRect(0,0,width,height);

                ctx.beginPath();
                ctx.lineWidth = toPixels(0.15);
                ctx.strokeStyle = mainColor;
                ctx.moveTo(start_x,start_y);
                ctx.lineTo(start_x,start_y+powerHeight);
                ctx.stroke();

                ctx.beginPath();
                ctx.arc(start_x+cornerRadius,start_y+powerHeight,cornerRadius,Math.PI,0.5*Math.PI,true)
                ctx.stroke();

                ctx.moveTo(start_x+cornerRadius,start_y+powerHeight+cornerRadius);
                ctx.lineTo(start_x+cornerRadius+powerWidth,start_y+powerHeight+cornerRadius);
                ctx.stroke();

                ctx.beginPath();
                ctx.arc(start_x+cornerRadius+powerWidth,start_y+powerHeight,cornerRadius,0.5*Math.PI,0,true)
                ctx.stroke();

                ctx.moveTo(start_x+cornerRadius*2+powerWidth,start_y+powerHeight+cornerRadius);
                ctx.lineTo(start_x+cornerRadius*2+powerWidth,start_y+cornerRadius);
                ctx.stroke();

                ctx.moveTo(start_x+cornerRadius*4+powerWidth,powerHeight*1);
                ctx.lineTo(start_x+cornerRadius*4+powerWidth,powerHeight*0.5);
                ctx.stroke();


                ctx.textAlign="center";
                ctx.font="17px Arial"
                ctx.fillStyle=itemColor
                ctx.fillText(String(itemName+":"),start_x+cornerRadius*20+powerWidth,powerHeight*0.9)
                ctx.fillStyle=textColor
                var dldc = "%1%"
                var dldc_value = inputPower.toFixed(0)
                ctx.textAlign="left";
                ctx.font="25px Arial"
               // console.log(message.arg(count))
                ctx.fillText(dldc.arg(dldc_value),start_x+cornerRadius*35+powerWidth,powerHeight*0.95)

                ctx.beginPath();
                ctx.arc(start_x+cornerRadius+powerWidth,start_y+cornerRadius,cornerRadius,0,1.5*Math.PI,true)
                ctx.stroke();

                ctx.moveTo(start_x+cornerRadius+powerWidth,start_y);
                ctx.lineTo(start_x+cornerRadius,start_y);
                ctx.stroke();

                ctx.beginPath();
                ctx.arc(start_x+cornerRadius,start_y+cornerRadius,cornerRadius,1.5*Math.PI,1*Math.PI,true)
                ctx.stroke();


                //==================================================电量格子
                ctx.lineWidth = toPixels(0.3);
                ctx.strokeStyle = itemColor ;
                var cout=inputPower/totalPower*10;
                for(var i=0;i<cout;i++)
                {
                    ctx.beginPath();
                    ctx.moveTo(start_x+cornerRadius*4+i*powerMargin,start_y+cornerRadius*2);
                    ctx.lineTo(start_x+cornerRadius*4+i*powerMargin,start_y+cornerRadius*13);
                    ctx.stroke();
                }


                 start_y+cornerRadius







            }

            }






}
