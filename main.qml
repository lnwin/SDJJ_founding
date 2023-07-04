import QtQuick 6.4
import QtQuick.Layouts 6.4
import QtQuick.Controls 6.4
//import QtQuick.Controls.Imagine
//import QtQuick.Extras
//import QtQuick.Controls.Styles
import Qt.labs.animation 1.0
import Mycamera 1.0
import Mythreadpond 1.0

Window {

    id:mainWindow
    visible: true
    x:0
    y:0
    width: 1920
    height: 1080
    color: bgColor
    property string bgColor:"#01113a"
    property string mainColor:"#4682B4"
    property string itemColor:"#98F5FF"
    property string textColor:"#9AFF9A"
//    property string bgColor:"#000000" // rzpeise
//    property string mainColor:"#4682B4"
//    property string itemColor:"#98F5FF"
//     property string textColor:"#9AFF9A"
    title: qsTr("abc")
    //====================================================qml 信号槽   仪表盘中转值

   // property var  kphPreviously:50
    property real  pitchPreviously:0
    property real  rollPreviously:0
    property real  yawPreviously:0
    property real  movelengthPreviously:0
    property real  rotateAnglePreviously:0
    property real  pushLengthPreviously:0
    property real  distance2BasePreviously:100
    property real  depthPreviously:0
    property real transducerPressurePreviously:0
    property double cylinderPressurePreviously:1
    property double controlPowerPreviously:1
    property double soundPowerPreviously:1
    property double powerPowerPreviously:1


   // property var  kphNow:50
    property real  pitchNow:0
    property real  rollNow:0
    property real  yawNow:0
    property real  movelengthNow:0
    property real  rotateAngleNow:0
    property real  pushLengthNow:0
    property real  distance2BaseNow:100
    property real  depthNow:0
    property real transducerPressureNow:0
    property double cylinderPressureNow:1

     property double controlPowerNow:1
     property double soundPowerNow:1
     property double powerPowerNow:1

    property double zdkg:1
    property double yykg:1
    property double sbkg:1
    property double zjkg:1
    property double xjkg:1
    property double zmkg:1
    property double gongzuomoshi:1
    property double donglikg:1

    //var kphPreviously=0

    //====================================================qml 信号槽

    ValueSource
    {
        id: valueSource
    }

    ParallelAnimation {

        id:mainCarton
        NumberAnimation {
            target: valueSource
            property: "pitch"
           // easing.type: Easing.InOutSine //仪表盘
            from: pitchPreviously
            to: pitchNow
            duration: 300
            easing.type: Easing.Linear //匀

        }
        NumberAnimation {
            target: valueSource
            property: "roll"
           // easing.type: Easing.InOutSine //仪表盘
            from: rollPreviously
            to: rollNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "yaw"
           // easing.type: Easing.InOutSine //仪表盘
            from: yawPreviously
            to: yawNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "waterDepth"
           // easing.type: Easing.InOutSine //深度
            from: depthPreviously
            to: depthNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "movelength"
           // easing.type: Easing.InOutSine
            from: pushLengthPreviously
            to: pushLengthNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "rotateAngle"
           // easing.type: Easing.InOutSine
            from: rotateAnglePreviously
            to: rotateAngleNow
            duration: 300
            easing.type: Easing.Linear //匀
        }

        NumberAnimation {
            target: valueSource
            property: "pushLength"
           // easing.type: Easing.InOutSine
            from: movelengthPreviously
            to: movelengthNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "distance2Base"
           // easing.type: Easing.InOutSine
            from: distance2BasePreviously
            to: distance2BaseNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "controlPower"
           // easing.type: Easing.InOutSine
            from: controlPowerPreviously
            to: controlPowerNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "impetusPower"
           // easing.type: Easing.InOutSine
            from: powerPowerPreviously
            to: powerPowerNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "soundPower"
           // easing.type: Easing.InOutSine
            from: soundPowerPreviously
            to: soundPowerNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "transducerPressure"
           // easing.type: Easing.InOutSine
            from: transducerPressurePreviously
            to: transducerPressureNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "cylinderPressure"
           // easing.type: Easing.InOutSine
            from: cylinderPressurePreviously
            to: cylinderPressureNow
            duration: 300
            easing.type: Easing.Linear //匀
        }
//        NumberAnimation {
//            target: valueSource
//            property: "impetusPower"
//           // easing.type: Easing.InOutSine
//            from: 100
//            to: 70
//            duration: 300
//            easing.type: Easing.Linear //匀
//        }

        onFinished:
        {
            rollPreviously=rollNow
            pitchPreviously=pitchNow
            yawPreviously=yawNow
            depthPreviously=depthNow
            distance2BasePreviously=distance2BaseNow
            rotateAnglePreviously=rotateAngleNow
            pushLengthPreviously= pushLengthNow
            movelengthPreviously= movelengthNow
            transducerPressurePreviously=transducerPressureNow
            cylinderPressurePreviously= cylinderPressureNow
            controlPowerPreviously=controlPowerNow
            soundPowerPreviously=soundPowerNow
            powerPowerPreviously= powerPowerNow
        }

    }





     SK2machinery
    {
        x: 50
        y: 244
        width: 502
        height: 774
        moveLength: valueSource.movelength
        rotateAngle: valueSource.rotateAngle
        pushLength: valueSource.pushLength
        distance2Base:valueSource.distance2Base
        waterDepth: valueSource.waterDepth
        transducerPressure:valueSource.transducerPressure
        cylinderPressure:valueSource.cylinderPressure

//        Button {
//            id: button
//            x: 388
//            y: 314
//            width: 84
//            height: 48
//            text: qsTr("Test")
//            onClicked:
//            {
//                threadPond_obj.crctest();
//            }
//        }
    }

    SK2power
    {

        id:controlP
        x: 617
        y: 558
       // textColor:"#FF0000"
        width: 576
        height: 53
        itemName:"控制电池"
        inputPower:valueSource.controlPower
        totalPower:29


    }

    SK2power
    {

        id:impetusP
        x: 617
        y: 629
        width: 576
        height: 53
        itemName:"动力电池"
        inputPower:valueSource.impetusPower
        totalPower:54

    }

    SK2power {
        id: soundPower
        x: 617
        y: 699
        width: 576
        height: 53
        itemName:"功放电量"
        inputPower:valueSource.soundPower
        totalPower:29
//soundPower
         }

    Button {
        id: winclose
        x: 1825
        y: 27
        width: 75
        height: 30
        text: qsTr("关闭窗口")
        onClicked:
        {
            mainWindow.close()
            threadPond_obj.closeAll();
        }
    }
    Button {
        id: min
        x: 1740
        y: 27
        width: 75
        height: 30
        text: qsTr("最小化")
        onClicked:
            mainWindow.showMinimized();
    }

    SK2level {
        id:pitch
        x: 50
        y:71
        width: 140
        height: 140
        angleValue: valueSource.pitch
        itemName:"Pitch"

    }

    SK2level {
        id: roll
        x: 231
        y: 71
        width: 140
        height: 140
        angleValue: valueSource.roll
         itemName:"Roll"
    }

    SK2level {
        id: yaw
        x: 412
        y: 71
        width: 140
        height: 140
        angleValue: valueSource.yaw
        itemName:"Yaw"
    }
//ScrollView{

   // anchors.fill: parent

    TextArea {
        id: textArea
        x: 617
        y: 773
        width: 576
        height: 245
        verticalAlignment: Text.AlignBottom
        placeholderText: qsTr("Text Area")
        selectByKeyboard: true
        selectByMouse: true

   }
//}

    Canvas
    {

        id:textLine
        //parent: textArea
        // width: parent.width
        //height:parent.height
        x: 617
        y: 773
        width: 576
        height: 245
        layer.enabled: true
        enabled: false

        onPaint:
        {


            var ctx = textLine.getContext('2d');
            var grd=ctx.createLinearGradient(0, 0, 576, 0);
            grd.addColorStop(0,color);
            grd.addColorStop(0.5,mainColor);
            grd.addColorStop(1,color);
            // 将渐变赋值给线的样式
            ctx.strokeStyle=grd;
            // 设置线的宽度
            ctx.lineWidth = 7;
            // 绘制线
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(576, 0);
            ctx.stroke();
            var grd1=ctx.createLinearGradient(0, 206, 576, 206);
            grd1.addColorStop(0,color);
            grd1.addColorStop(0.5,mainColor);
            grd1.addColorStop(1,color);
            // 将渐变赋值给线的样式
            ctx.strokeStyle=grd1;
            // 设置线的宽度
            ctx.lineWidth = 7;
            // 绘制线
            ctx.beginPath();
            ctx.moveTo(0, 301);
            ctx.lineTo(576, 301);
            ctx.stroke();

//            var grd2=ctx.createLinearGradient(865, 40, 1000, 40);
//            grd2.addColorStop(0,color);
//            grd2.addColorStop(0.5,mainColor);
//            grd2.addColorStop(1,color);
//            // 将渐变赋值给线的样式
//            ctx.strokeStyle=grd2;
//            // 设置线的宽度
//            ctx.lineWidth = 10;
//            // 绘制线
//            ctx.beginPath();
//            ctx.moveTo(865, 40);
//            ctx.lineTo(1000, 40);
//            ctx.stroke();

        }
    }

    Rectangle
    {
        id:camerabuttonFiled
        x: 1263
        y: 869
        width: 601
        height: 149
        color:"#01113a"

        Label {
            id: aaa
            x: 20
            y: -56

            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            text: qsTr("动力电源:")
            font.pixelSize: 25
        }
        Label {
            id: dongliState
            x: 140
            y: -56
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            color: "#FF0000"
            text: qsTr("关闭")
            font.pixelSize: 25
        }

                Label {
                    id: ccc
                    x: 210
                    y: -56

                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("相机电源:")
                    font.pixelSize: 25
                }
                Label {
                    id: cameraPowerState
                    x: 330
                    y: -56
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignLeft
                    color: "#FF0000"
                    text: qsTr("关闭")
                    font.pixelSize: 25
                }
                Label {
                    id: lll
                    x: 400
                    y: -56
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("照明电源:")
                    font.pixelSize: 25
                }
                Label {
                    id: lightPowerState
                    x: 520
                    y: -56

                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignLeft
                    color: "#FF0000"
                    text: qsTr("关闭")
                    font.pixelSize: 25
                }


            RowLayout
            {
                id:configButtons
                 anchors.leftMargin: 3
                 anchors.rightMargin: 3

                 anchors.fill: parent
                 anchors.margins: 1
                 anchors.topMargin: 8
                 // anchors.topMargin: 115
                 anchors.bottomMargin: 8
                 spacing: 5
                 Button {
                                     id: donglibutton
                                     text: qsTr("动力开启")
                                     font.pixelSize:17
                                     //icon.name: "navigation"
                                     Layout.fillHeight: true
                                     onClicked:
                                     {
                                          threadPond_obj.dongliKG();
                                         if(donglibutton.text=="动力上电")
                                         {
                                             donglibutton.text=="动力下电"
                                         }
                                         else
                                         {
                                             donglibutton.text="动力上电"
                                         }

                                         //threadPond_obj.addMSG2sql("相机上电","");
                                     }
                 }
                 Button {
                                     id: cameraPower
                                     text: qsTr("相机上电")
                                     font.pixelSize:17
                                     //icon.name: "navigation"
                                     Layout.fillHeight: true
                                     onClicked:
                                     {
                                         if(cameraPower.text=="相机上电")
                                         {

                                              threadPond_obj.addMSG2sql("相机上电","");
                                              threadPond_obj.cameraPowerUp();
                                              threadPond_obj.addMSG2sql("相机上电","");
                                              timer_button.start();

                                         }
                                         else
                                         {
                                              threadPond_obj.addMSG2sql("相机断电","");
                                              threadPond_obj.cameraPowerDown();
                                              threadPond_obj.addMSG2sql("相机断电","");
                                              cameraInt.enabled=false;
                                              timer_button.stop();
                                         }

                                     }
                 }
                 Button {
                                     id: lightPower
                                     text: qsTr("照明上电")
                                     font.pixelSize:17
                                     //icon.name: "navigation"
                                     Layout.fillHeight: true

                                     onClicked:
                                     {
                                         if(lightPower.text=="照明上电")
                                         {
                                              threadPond_obj.addMSG2sql("照明上电","");
                                              threadPond_obj.lightPowerUp();
                                              threadPond_obj.addMSG2sql("照明上电","");
                                         }
                                         else
                                         {
                                              threadPond_obj.addMSG2sql("照明断电","");
                                              threadPond_obj.lightPowerDown();
                                              threadPond_obj.addMSG2sql("照明断电","");
                                         }
                                     }
                 }
                 Button {
                                     id: cameraInt
                                     text: qsTr("开启相机")
                                     font.pixelSize:17
                                     //icon.name: "navigation"
                                     Layout.fillHeight: true
                                     enabled:false;
                                     onClicked:
                                     {
                                           timer_button.stop();
                                          if(camera_obj.longID())
                                         {
                                             camera_obj.realPlayer()
                                             textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 1号相机开启成功！\n"
                                         }
                                         else
                                         {
                                             textArea.text +=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 1号相机开启失败！ \n"
                                         }
                                          if(camera_obj.longID_1())
                                         {
                                             camera_obj.realPlayer_1();
                                             textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 2号相机开启成功！\n"
                                         }
                                         else
                                         {
                                             textArea.text +=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 2号相机开启失败！ \n"
                                         }
                                          threadPond_obj.addMSG2sql("开启相机","");
                                     }



                                 }
                 Button {
                                     id: capture
                                     text: qsTr("单张抓拍")
                                     font.pixelSize:17
                                     //icon.name: "navigation"
                                     Layout.fillHeight: true
                                     onClicked:
                                     {
                                         if(camera_obj.startCatch())
                                         {
                                             textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 抓拍成功！\n"
                                         }
                                         else
                                         {
                                             textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 抓拍失败！\n"
                                         }
                                         threadPond_obj.addMSG2sql("单张抓拍","");
                                     }
                                 }
                 Button {
                                     id: rec
                                     text: qsTr("开始录像")
                                     font.pixelSize:17
                                     //icon.name: "navigation"
                                     Layout.fillHeight: true
                                     onClicked:
                                     {
                                         if(rec.text=="停止录像")
                                         {
                                             if(camera_obj.stopREC())
                                             {
                                                 {
                                                     textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 1号相机录像停止！\r\n";
                                                 }
                                             }
                                             rec.text=="开始录像"
                                             threadPond_obj.addMSG2sql("停止录像","");
                                         }
                                         else
                                         {
                                             if(camera_obj.startREC())
                                             {
                                                 textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 1号相机开始录像！\r\n";

                                             }
                                             rec.text=="停止录像"
                                             threadPond_obj.addMSG2sql("开始录像","");
                                         }

                                     }
                 }



             }






    }
    Rectangle
    {
        id:buttonFiled
        x: 35
        y: 987
        //width: 402
        height: 50
        color:"#01113a"
       RowLayout
        {
            id:cameraButtons
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.fill: parent
            anchors.margins: 7
            spacing: 5

             //property var listOfLists: mpwaveMSG

            Button {
                                id: socketopen
                                text: qsTr("连接网络")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true

                                onClicked:
                                {
                                   threadPond_obj.socket_Listing()
                                   threadPond_obj.addMSG2sql("连接网络","");
                                }


                            }
            Button {
                                id: checkNote
                                text: qsTr("查看操作日志")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                                onClicked:
                                {
                                //threadPond_obj.socket_Listing()

                                }
                            }


        }

    }
// 控制按键面板
    Rectangle {
        id: tabRec
        x: 617
        y: 71
        width: 576
        height: 468
        color: bgColor
        border.color: mainColor
       // color: mainColor
       //  TableView
        TabBar {    //点击相应的按钮实现切换
               id: bar
               width: parent.width
             //  height: parent.height
               currentIndex: 0
               TabButton {
                   font.pixelSize:15
                   text: qsTr("调试模式")
                  //height: 20
               }
               TabButton {
                   font.pixelSize:15
                   text: qsTr("工作模式")
               }

           }
        StackLayout {   //栈布局管理器

               y:parent.y
               //width: 700
             //  height: 400
               currentIndex: bar.currentIndex  //当前视图的索引
               Item {

                       //id:controlColumnLayout
                      // x: 143
                      // y: -143
                      // anchors.fill: parent
                       //leftMargin:10
                       // Layout.leftMargin:50
                       Button {
                           id: button5
                           x: 329
                           y: -14
                           width: 105
                           height: 30
                           icon.width: 10
                           icon.height: 10
                           icon.source: "qrc:/imagines/activity-outline.svg"
                          // display: Button.TextUnderIcon
                           text: qsTr("扩展臂释放")
                           font.pointSize: 10
                           Layout.leftMargin:50
                           onClicked:
                           {
                               threadPond_obj.armrelease(Number(kuozhanbishifang_numb.text)) ;
                               threadPond_obj.addMSG2sql("扩展臂释放","");
                           }
                       }
                       Label {
                           id: kuozhanbishifangjiaodu
                           x: 440
                           y: -9
                           width: 185
                           height: 20
                           text: qsTr("释放角度:")
                           font.pixelSize: 15
                           // font.family: "Times New Roman"
                           color: itemColor
                       }
                       TextField {
                           x: 520
                           y: -8
                           width: 96
                           height: 17
                           id: kuozhanbishifang_numb
                           //x: 361
                          // y: 16
                          // width: 77
                          // height: 34
                           font.pixelSize: 18
                           font.bold: true
                           color: textColor
                           text: "0"
                           placeholderTextColor:itemColor
                           placeholderText: qsTr("_______")
                       }

                       Button {
                           id: button6
                           x: 329
                           y: 73
                           width: 105
                           height: 30
                           icon.width: 10
                           icon.height: 10
                           icon.source: "qrc:/imagines/slash-outline.svg"
                          // display: Button.TextUnderIcon
                           text: qsTr("扩展臂制动")
                           font.pointSize: 10
                           onClicked:
                           {
                               threadPond_obj.armstop();
                               threadPond_obj.addMSG2sql("扩展臂制动","");
                           }
                       }

                       Button {
                           id: button3
                           x: 329
                           y: 30
                           width: 105
                           height: 30
                           icon.width: 10
                           icon.height: 10
                           icon.source: "qrc:/imagines/undo-outline.svg"
                          // display: Button.TextUnderIcon
                           text: qsTr("扩展臂回收")
                           font.pointSize: 10
                           onClicked:
                           {
                               threadPond_obj.armrecover(Number(kuozhanbihuishou_numb.text)) ;
                               threadPond_obj.addMSG2sql("扩展臂回收","");
                           }
                       }
                       Label {
                           id: kuozhanbihuishoujiaodu
                           x: 440
                           y: 37
                           width: 185
                           height: 20
                           text: qsTr("回收角度:")
                           font.pixelSize: 15
                           // font.family: "Times New Roman"
                           color: itemColor
                       }
                       TextField {
                           x: 520
                           y: 37
                           width: 96
                           height: 17
                           id: kuozhanbihuishou_numb
                           //x: 361
                          // y: 16
                          // width: 77
                          // height: 34
                           font.pixelSize: 18
                           font.bold: true
                           color: textColor
                           text: "0"
                           placeholderTextColor:itemColor
                           placeholderText: qsTr("_______")
                       }

                       Button {
                           id: button2
                           x: 450
                           y: 450
                           width: 83
                           height: 123
                           text: qsTr("急停")
                            font.pointSize: 25
                            font.weight:Font.Bold
                            background: Rectangle {
                                        border.color: "#14191D"
                                        color: "#8B1A1A"
                                        // I want to change text color next
                                    }
                            onClicked:
                            {
                                threadPond_obj.shutDown();
                                threadPond_obj.addMSG2sql("急停","");
                            }

                       }

                       Label {
                           id: shuibengzhuansu
                           x: 329
                           y: 122
                           width: 185
                           height: 20
                           text: qsTr("水泵转速(转/秒):")
                           font.pixelSize: 15
                           // font.family: "Times New Roman"
                           color: itemColor
                       }

                       TextField {
                           x: 450
                           y: 122
                           width: 96
                           height: 17
                           id: shuibengzhuansu_numb
                           //x: 361
                          // y: 16
                          // width: 77
                          // height: 34
                           font.pixelSize: 18
                           font.bold: true
                           color: textColor
                           text: "0"
                           placeholderTextColor:itemColor
                           placeholderText: qsTr("_______")
                       }

                       Label {
                           id: zuanjinzhuansu
                           x: 329
                           y: 162
                           width: 185
                           height: 20
                           text: qsTr("钻进转速(转/秒):")
                           font.pixelSize: 15
                           // font.family: "Times New Roman"
                           color: itemColor
                       }

                       TextField {
                           x: 450
                           y: 162
                           width: 96
                           height: 17
                           id: zuanjinzhuansu_numb
                           //x: 361
                          // y: 16
                          // width: 77
                          // height: 34
                           font.pixelSize: 18
                           font.bold: true
                           color: textColor
                           text: "0"
                           placeholderTextColor:itemColor
                           placeholderText: qsTr("_______")
                       }

                       Button {
                           id: shuibengzhuansupeizhi
                           x: 500
                           y: 115
                           width: 60
                           height: 28
                           text: qsTr("配置")
                            font.pointSize: 10
                            font.weight:Font.Bold
//                            background: Rectangle {
//                                        border.color: "#14191D"
//                                        color: "#8B1A1A"
//                                        // I want to change text color next
//                                    }
                            onClicked:
                            {
                                threadPond_obj.zhuansupeizhi(Number(shuibengzhuansu_numb.text),0);
                                threadPond_obj.addMSG2sql("转速配置","");
                            }

                       }
                       Button {
                           id: zuanjinzhuansupeizhi
                           x: 500
                           y: 155
                           width: 60
                           height: 28
                           text: qsTr("配置")
                            font.pointSize: 10
                            font.weight:Font.Bold
//                            background: Rectangle {
//                                        border.color: "#14191D"
//                                        color: "#8B1A1A"
//                                        // I want to change text color next
//                                    }
                            onClicked:
                            {
                                threadPond_obj.zhuansupeizhi(0,Number(zuanjinzhuansu_numb.text));
                                threadPond_obj.addMSG2sql("转速配置","");
                            }

                       }

                       Label {
                           id: label
                           x: 36
                           y: 200
                           width: 185
                           height: 20
                           text: qsTr("探杆上移距离(mm):")
                           font.pixelSize: 20
                           // font.family: "Times New Roman"
                           color: itemColor
                       }

                       Label {
                           id: label1
                           x: 36
                           y: 245
                           width: 185
                           height: 20
                           color: itemColor
                           text: qsTr("探杆下移距离(mm):")
                           font.pixelSize: 20

                       }

                       TextField {
                           x: 227
                           y: 205
                           width: 96
                           height: 17
                           id: tgu_numb
                           //x: 361
                          // y: 16
                          // width: 77
                          // height: 34
                           font.pixelSize: 18
                           font.bold: true
                           color: textColor
                           text: "0"
                           placeholderTextColor:itemColor
                           placeholderText: qsTr("_______")
                       }

                       TextField {
                           x: 227
                           y: 245
                           width: 96
                           height: 21
                           id: tgd_numb
                           //x: 361
                           //y: 16
                          // width: 77
                          // height: 34
                           font.bold: true
                           color: textColor
                           text: "0"
                           font.pixelSize: 18
                           placeholderTextColor:itemColor
                           placeholderText: qsTr("_______")
                       }

                       Button {
                           id: tgu_button
                           x: 329
                           y: 200
                           width: 105
                           height: 30

                          // width: 200
                          // height: 20
                           icon.source: "qrc:/imagines/arrowhead-up-outline.svg"
                           text: qsTr("上提")
                           font.pointSize: 15
               //                                      Layout.preferredWidth: 150
               //                                       Layout.preferredHeight: 40
               //                                      Layout.fillWidth: true      //占据为其分配的所有宽度
               //                                      Layout.fillHeight: true
                           onClicked:
                           {
                               threadPond_obj.tGup(Number(tgu_numb.text));
                               threadPond_obj.addMSG2sql("探杆上提",tgu_numb.text+"mm");
                           }
                       }

                       Button {
                           id: tgd_button
                           x: 329
                           y: 240
                           width: 105
                           height: 30
                           icon.source: "qrc:/imagines/arrowhead-down-outline.svg"
                           text: qsTr("下插")
                           font.pointSize: 15
                           onClicked:
                           {
                               threadPond_obj.tGdown((Number(tgd_numb.text)));
                               threadPond_obj.addMSG2sql("探杆下插",tgd_numb.text+"mm");
                           }
                       }

                       Button {
                          // id: button4
                           x: 450
                           y: 200
                           width: 90
                           height: 70
                           id: tgu_stop
                          // width: 149
                          // height: 50
                           icon.source: "qrc:/imagines/close-circle-outline.svg"
                           icon.width: 40
                           icon.height: 40
                           display: Button.TextUnderIcon
                           text: qsTr("停止")
                           Layout.fillHeight: true
                           font.pointSize: 15
                           onClicked:
                           {
                               threadPond_obj.tGstop() ;
                               threadPond_obj.addMSG2sql("探杆停止","");
                           }
                       }

                       Label {
                           //id: label2
                           x: 38
                           y: 290
                           width: 185
                           height: 20
                           id: kmu
                           text: qsTr("扩展臂上移距离(mm):")
                           font.pixelSize: 20
                          // font.family: "Times New Roman"
                           color: itemColor
                          // anchors.fill: parent
                           //  Layout.preferredWidth: 40
                           //  Layout.preferredHeight: 40
                       }

                       Label {

                           x: 38
                           y: 335
                           width: 185
                           height: 20
                           id: kmd
                           color: itemColor
                           text: qsTr("扩展臂下移距离(mm):")
                           font.pixelSize: 20
                           //anchors.fill: parent
                          //  Layout.alignment: Qt.AlignHCenter
                           //Layout.preferredWidth: 40
                           // Layout.preferredHeight: 40
                       }

                       Button {

                           x: 329
                           y: 284
                           width: 105
                           height: 34
                           id: kmu_button

                         //  width: 149
                          // height: 20
                           icon.source: "qrc:/imagines/arrow-circle-up-outline.svg"
                           text: qsTr("上移")
                           font.pointSize: 15
                           onClicked:
                           {
                               threadPond_obj .armmoveup(Number(kmu_numb.text));
                               threadPond_obj.addMSG2sql("扩展臂上移",kmu_numb.text+"mm");
                           }
                       }

                       Button {

                           x: 331
                           y: 327
                           width: 103
                           height: 34
                           id: kmd_button
                          // width: 149
                          // height: 50
                           icon.source: "qrc:/imagines/arrow-circle-down-outline.svg"
                           text: qsTr("下移")
                           font.pointSize: 15
                           onClicked:
                           {
                               threadPond_obj .armmovedown(Number(kmd_numb.text));
                               threadPond_obj.addMSG2sql("扩展臂下移",kmd_numb.text+"mm");
                           }
                       }

                       Button {

                           x: 450
                           y: 285
                           width: 90
                           height: 77
                           id: kmd_stop
                           text: qsTr("停止")
                           icon.source: "qrc:/imagines/close-circle-outline.svg"
                           icon.width: 40
                           icon.height: 40
                           display: Button.TextUnderIcon
                           Layout.fillHeight: true
                           font.pointSize: 15
                           onClicked:
                           {
                               threadPond_obj.armmovestop();
                               threadPond_obj.addMSG2sql("扩展臂停止","");
                           }
                       }

                       TextField {

                           x: 229
                           y: 290
                           id: kmu_numb
                         //  x: 361
                         //  y: 16
                           width: 94
                           height: 20
                           font.pixelSize: 18
                           font.bold: true
                           placeholderTextColor:itemColor
                           color: textColor
                           text: "0"
                           placeholderText: qsTr("_______")
                       }

                       TextField {

                           x: 229
                           y: 335
                           width: 94
                           height: 20
                           id: kmd_numb
                          // x: 361
                          // y: 16
                          // width: 77
                          // height: 34
                           font.bold: true
                           placeholderTextColor:itemColor
                           color: textColor
                           text: "0"
                           font.pixelSize: 18
                           placeholderText: qsTr("_______")
                       }


                       Label {
                           id: label2
                           x: 36
                           y: 36
                           width: 135
                           height: 24
                           text: "振动电机状态:"
                           font.pixelSize: 20
                       }

                       Label {
                           id: label3
                           x: 36
                           y: 79
                           width: 135
                           height: 24
                           text: "水泵电机开关:"
                           font.pixelSize: 20
                       }

                       Label {
                           id: label4
                           x: 36
                           y: 120
                           width: 135
                           height: 24
                           text: "钻进电机开关:"
                           font.pixelSize: 20
                       }
                       Label {
                           id: label5
                           x: 36
                           y: 159
                           width: 135
                           height: 24
                           text: "贯入模式:"
                           font.pixelSize: 20
                       }

                       Button {
                           id: zhendongbutton
                           x: 226
                           y: 31
                           width: 84
                           height: 29
                           text: qsTr("振动上电")
                            font.pixelSize: 15
                            onClicked:
                            {
                                threadPond_obj.zhendongKG();
                                threadPond_obj.addMSG2sql(zhendongbutton.text,"");
                            }
                       }

                       Button {
                           id: shuibengbutton
                           x: 226
                           y: 73
                           width: 84
                           height: 30
                           text: qsTr("水泵上电")
                            font.pixelSize: 15
                            onClicked:
                            {
                                threadPond_obj.shuibengKG();
                                threadPond_obj.addMSG2sql(shuibengbutton.text,"");
                            }
                       }

                       Button
                       {
                           id: zuanjinbutton
                           x: 226
                           y: 114
                           width: 84
                           height: 32
                           text: qsTr("钻进上电")
                            font.pixelSize: 15
                            onClicked:
                            {
                                threadPond_obj.zuanjinKG();
                                threadPond_obj.addMSG2sql(zuanjinbutton.text,"");

                            }
                       }



                       Button {
                           id: gongzuobutton
                           x: 226
                           y: 154
                           width: 84
                           height: 32
                           text: qsTr("模式切换")
                            font.pixelSize: 15
                            onClicked:
                            {
                                 threadPond_obj.gongzuoKG();
                                 threadPond_obj.addMSG2sql(gongzuoState.text,"");

                            }
                       }

                       Label {
                           id: zddianjiState
                           x: 174
                           y: 36
                           width: 43
                           height: 24
                           color: "#FF0000"
                           text: qsTr("关闭")
                           font.pixelSize: 20
                       }

                       Label {
                           id: shuibengState
                           x: 174
                           y: 79
                           width: 43
                           height: 24
                           color: "#FF0000"
                           text: qsTr("关闭")
                           font.pixelSize: 20
                       }

                       Label {
                           id: zuanjinState
                           x: 175
                           y: 120
                           width: 43
                           height: 24
                           color: "#FF0000"
                           text: qsTr("关闭")
                           font.pixelSize: 20
                       }

                       Label {
                           id: gongzuoState
                           x: 175
                           y: 159
                           width: 43
                           height: 24
                           color: "#FF0000"
                           text: qsTr("NULL")
                           font.pixelSize: 20
                       }

                       Label {
                           id: yeyaState
                           x: 174
                           y: -6
                           width: 43
                           height: 24
                           color: "#FF0000"
                           text: qsTr("关闭")
                           font.pixelSize: 20
                       }

                       Label {
                           id: yeyastatus
                           x: 36
                           y: -6
                           width: 133
                           height: 24
                           text: "液压电机状态:"
                           font.pixelSize: 20
                       }



                       Button {
                           id: yeyabutton
                           x: 226
                           y: -14
                           width: 84
                           height: 32
                           text: qsTr("液压上电")
                           font.pixelSize: 15
                           onClicked:
                           {
                                threadPond_obj.yeyaKG();
                                threadPond_obj.addMSG2sql(yeyabutton.text,"");
                           }
                       }




               }
               Item {

                   Label {

                       x: 35
                       y: -4
                       width: 186
                       height: 20
                       id: xxsd
                       text: qsTr("循环次数:")
                       font.pixelSize: 20
                       // font.family: "Times New Roman"
                       color: itemColor
                      // anchors.fill: parent
                       //  Layout.preferredWidth: 40
                       //  Layout.preferredHeight: 40
                   }

                   Label {

                       x: 35
                       y: 37
                       width: 185
                       height: 20
                       id: stepA
                       color: itemColor
                       text: qsTr("探杆下插步长(mm):")
                       font.pixelSize: 20
                       //anchors.fill: parent
                       //Layout.preferredWidth: 40
                       // Layout.preferredHeight: 40
                   }

//                   Label {

//                       x: 35
//                       y: 80
//                       width: 185
//                       height: 20
//                       id: sxml
//                       color: itemColor
//                       text: qsTr("声学命令选择:")
//                       font.pixelSize: 20
//                       //anchors.fill: parent
//                       //Layout.preferredWidth: 40
//                       // Layout.preferredHeight: 40
//                   }

                   TextField {

                       x: 225
                       y: -4
                       width: 95
                       height: 20
                       id: atgjl
                       //x: 361
                       //y: 16
                       //width: 77
                      // height: 34
                        Layout.topMargin: 10
                       font.pixelSize: 18
                       font.bold: true
                       placeholderTextColor:itemColor
                       color: textColor
                       placeholderText: qsTr("_______")
                   }

                   TextField {

                       x: 225
                       y: 37
                       width: 96
                       height: 20
                       id: atgjl_bc
                       //x: 361
                       //y: 16
                       //width: 77
                       //height: 34
                        Layout.topMargin: 20
                       font.bold: true
                       color: textColor
                       font.pixelSize: 18
                       placeholderTextColor:itemColor
                       placeholderText: qsTr("_______")
                   }

//                   ComboBox {
//                       //id: comboBox
//                       x: 225
//                       y: 70
//                       width: 66
//                       height: 34
//                       id:comID
//              //         x:900
//              //         y:800
//                      // width: 100
//                      // height: 30
//                       Layout.topMargin: 20
//                       Layout.fillWidth: true
//                       editable: false
//                       flat: false
//                       clip: true
//                     //clip: true
//                       visible: true
//                       font.pixelSize: 15
//                       popup.font.pixelSize: 15//下拉菜单字体大小
//                       popup.topPadding:33 //距离选定数字的距离，必须设置
//                       popup.margins: 20
//                       enabled: true
//                       focusPolicy: Qt.ClickFocus
//                       model:["1号","2号","3号","4号","5号"]

//                                  onActivated: {
//                                      console.log(displayText)
//                                      console.log(index)
//                                  }
//                   }

                   Button {

                       x: 320
                       y: 10
                       width: 197
                       height: 102
                       id: atoD1
                        //width: 160
                       // height: 20
                        Layout.preferredWidth: 160
                        Layout.preferredHeight: 40
                        Layout.fillWidth: true      //占据为其分配的所有宽度
                        Layout.fillHeight: true
                        icon.source: "qrc:/imagines/shake-outline.svg"
                        icon.width: 50
                        icon.height: 50
                        display: Button.TextUnderIcon
                        text: qsTr("开始自动探测")
                        font.pointSize: 15
                        onClicked:
                        {
                            checkState();
                            threadPond_obj.startCircle(Number(atgjl.text),Number(atgjl_bc.text))
                            threadPond_obj.addMSG2sql("开始自动探测","");
                        }


                   }


                     }


        }


    }

//===================================================
    function checkState()
    {

      if(zdkg==0)
      {
          zddianjiState.color="#FF0000";
          zddianjiState.text="关闭"
          zhendongbutton.text="振动上电"
      }
      else
      {
          zddianjiState.color="#00FF00";
          zddianjiState.text="打开"
          zhendongbutton.text="振动断电"
      }

      if(sbkg==0)
      {
          shuibengState.color="#FF0000";
          shuibengState.text="关闭"
          shuibengbutton.text="水泵上电"
      }
      else
      {
          shuibengState.color="#00FF00";
          shuibengState.text="打开"
          shuibengbutton.text="水泵断电"
      }

      if(zjkg==0)
      {
          zuanjinState.color="#FF0000";
          zuanjinState.text="关闭"
          zuanjinbutton.text="钻进上电"
      }
      else
      {
          zuanjinState.color="#00FF00";
          zuanjinState.text="打开"
          zuanjinbutton.text="钻进断电"
      }
      if(yykg==0)
      {
          yeyaState.color="#FF0000";
          yeyaState.text="关闭"
          yeyabutton.text="液压上电"
      }
      else
      {
          yeyaState.color="#00FF00";
          yeyaState.text="打开"
          yeyabutton.text="液压断电"
      }
      if(xjkg==0)
      {
          cameraPowerState.color="#FF0000";
          cameraPowerState.text="关闭"
          cameraPower.text="相机上电"
      }
      else
      {
          cameraPowerState.color="#00FF00";
          cameraPowerState.text="打开"
          cameraPower.text="相机断电"
      }
      if(zmkg==0)
      {
          lightPowerState.color="#FF0000";
          lightPowerState.text="关闭"
          lightPower.text="照明上电"
      }
      else
      {
          lightPowerState.color="#00FF00";
          lightPowerState.text="打开"
          lightPower.text="照明断电"
      }
      if(gongzuomoshi==0)
      {
          gongzuoState.color="#FFFF00";
          gongzuoState.text="振动"
         // lightPower.text="照明上电"
      }
      else if (gongzuomoshi==1)
      {
          gongzuoState.color="#00FF00";
          gongzuoState.text="钻进"
         // lightPower.text="照明断电"
      }
      else if(gongzuomoshi==2)
      {
          gongzuoState.color="#00FFFF";
          gongzuoState.text="压入"
      }
      if(donglikg==0)
      {
          dongliState.color="#FF0000";
          dongliState.text="关闭"
          donglibutton.text="动力上电"
      }
      else
      {
          dongliState.color="#00FF00";
          dongliState.text="打开"
          donglibutton.text="动力断电"
      }



    }
//========================================




    ThreadDLL
    {
      id:threadPond_obj

      onSendSocketState2QML://CPP 信号函数
      {


          textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" "+ssMsg;


      }
      onSendcontrolMSG2QML://传感器参数接收
      {
         //textArea.text+=mMSG;
          rollNow=mMSG[0].toFixed(2)
          pitchNow=mMSG[1].toFixed(2);
          yawNow=mMSG[2].toFixed(2);
          depthNow=mMSG[3].toFixed(2);
          distance2BaseNow=mMSG[4].toFixed(2);
          rotateAngleNow=mMSG[5].toFixed(2);
          pushLengthNow=mMSG[6].toFixed(2);
          movelengthNow=mMSG[7].toFixed(2);
          transducerPressureNow=mMSG[8].toFixed(2);
          cylinderPressureNow=mMSG[9];//.toFixed(4);

          controlPowerNow= mMSG[10];
          if(controlPowerNow<=23)
          {
              controlP.textColor="#FF0000";
          }
          else
          {
              controlP.textColor="#9AFF9A";
          }
          soundPowerNow= mMSG[11];
          if(soundPowerNow<=23)
          {
              soundPower.textColor="#FF0000";
          }
          else
          {
               soundPower.textColor="#9AFF9A";
          }
          powerPowerNow= mMSG[12];
          if(powerPowerNow<=43)
          {
              impetusP.textColor="#FF0000";
          }
          else
          {
              impetusP.textColor="#9AFF9A";
          }
         // textArea.text+="ye ya"+mMSG[9].toFixed(2)+"\n";
          zdkg=mMSG[13].toFixed(2);
          yykg=mMSG[14].toFixed(2);
          sbkg=mMSG[15].toFixed(2);
          zjkg=mMSG[16].toFixed(2);
          xjkg=mMSG[17].toFixed(2);
          zmkg=mMSG[18].toFixed(2);
          gongzuomoshi=mMSG[19].toFixed(2);
          donglikg=mMSG[20].toFixed(2);
//======================该处需要修订下


         // textArea.text+=gongzuomoshi;
          checkState()
          mainCarton.start();

      }




    }
    CameraDLL
    {
        id:camera_obj
    }


    Timer {
            id: timer_button;
            interval: 60000;//设置定时器定时时间为500ms,默认1000ms
            repeat: false //是否重复定时,默认为false
            running: false //是否开启定时，默认是false，当为true的时候，进入此界面就开始定时
            triggeredOnStart: false // 是否开启定时就触发onTriggered，一些特殊用户可以用来设置初始值。
            onTriggered:
            {
                cameraInt.enabled=true;  //定时触发槽,定时完成一次就进入一次
            }
            //restart ,start,stop,定时器的调用方式，顾名思义


        }





//    Component.onCompleted://CPP-->qml信号槽链接
//    {

//       threadPond_obj.onSendSocketState2QML.connect(send_netstatus) //触发函数的第一个字母必须大写。

//    }

}








/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
