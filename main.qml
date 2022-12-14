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
//    property string bgColor:"gray"
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
    property real  controlPowerPreviously:0
    property real  depthPreviously:0
    property real transducerPressurePreviously:0
    property real cylinderPressurePreviously:100


   // property var  kphNow:50
    property real  pitchNow:0
    property real  rollNow:0
    property real  yawNow:0
    property real  movelengthNow:0
    property real  rotateAngleNow:0
    property real  pushLengthNow:0
    property real  distance2BaseNow:100
    property real  controlPowerNow:0
    property real  depthNow:0
    property real transducerPressureNow:0
    property real cylinderPressureNow:100

    property real zdkg:1
    property real yykg:1
    property real sbkg:1
    property real zjkg:1

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
            from: 100
            to: 70
            duration: 300
            easing.type: Easing.Linear //匀
        }

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
            console.log("finish");
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

        Button {
            id: button
            x: 410
            y: 316
            width: 56
            height: 48
            text: qsTr("Button")
            onClicked:
            {
                threadPond_obj.crctest();
            }
        }
    }

    SK2power
    {

        id:controlP
        x: 617
        y: 708
        width: 576
        height: 53
        itemName:"控制电池"
        inputPower:valueSource.controlPower


    }

    SK2power
    {

        id:impetusP
        x: 617
        y: 776
        width: 576
        height: 53
        itemName:"动力电池"
        inputPower:valueSource.impetusPower

    }



    Button {
        id: winclose
        x: 1825
        y: 27
        width: 75
        height: 30
        text: qsTr("关闭窗口")
        onClicked:
            mainWindow.close()
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
        y: 855
        width: 576
        height: 163
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
        y: 852
        width: 576
        height: 166
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
            ctx.moveTo(0, 206);
            ctx.lineTo(576, 206);
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
        x: 1254
        y: 852
        width: 502
        height: 166
        color:"#01113a"
       RowLayout
        {
            id:configButtons
            anchors.leftMargin: 20
            anchors.rightMargin: 20

            anchors.fill: parent
            anchors.margins: 7
            anchors.bottomMargin: 22
            spacing: 15
            Button {
                                id: cameraInt
                                text: qsTr("开启相机")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                                onClicked:
                                {
                                    //if(camera_obj.longID()&&camera_obj.longID_1())
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
                                }



                            }

            Button {
                                id: capture
                                text: qsTr("单张抓拍")
                                font.pixelSize:15
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
                                }
                            }
            Button {
                                id: rec
                                text: qsTr("开始录像")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                                onClicked:
                                {
                                    if(camera_obj.startREC())
                                    {
                                        textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 1号相机开始录像！\r\n";
                                    }
                                }
            }
            Button {
                                id: stoprec
                                text: qsTr("停止录像")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                                onClicked:
                                {
                                    if(camera_obj.stopREC())
                                    {
                                        {
                                            textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" 1号相机录像停止！\r\n";
                                        }
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
        height: 613
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
                           height: 40
                           icon.width: 10
                           icon.height: 10
                           icon.source: "qrc:/imagines/activity-outline.svg"
                          // display: Button.TextUnderIcon
                           text: qsTr("扩展臂释放")
                           font.pointSize: 10
                           Layout.leftMargin:50
                           onClicked:
                           {
                               threadPond_obj.armrelease() ;
                           }
                       }

                       Button {
                           id: button6
                           x: 329
                           y: 108
                           width: 105
                           height: 40
                           icon.width: 10
                           icon.height: 10
                           icon.source: "qrc:/imagines/slash-outline.svg"
                          // display: Button.TextUnderIcon
                           text: qsTr("扩展臂制动")
                           font.pointSize: 10
                           onClicked:
                           {
                               threadPond_obj.armstop();
                           }
                       }

                       Button {
                           id: button3
                           x: 329
                           y: 48
                           width: 105
                           height: 40
                           icon.width: 10
                           icon.height: 10
                           icon.source: "qrc:/imagines/undo-outline.svg"
                          // display: Button.TextUnderIcon
                           text: qsTr("扩展臂回收")
                           font.pointSize: 10
                           onClicked:
                           {
                               threadPond_obj.armrecover() ;
                           }
                       }

                       Button {
                           id: button2
                           x: 445
                           y: -14
                           width: 83
                           height: 162
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
                            }

                       }

                       Label {
                           id: label
                           x: 36
                           y: 192
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
                           y: 239
                           width: 185
                           height: 20
                           color: itemColor
                           text: qsTr("探杆下移距离(mm):")
                           font.pixelSize: 20

                       }

                       TextField {
                           x: 227
                           y: 198
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
                           placeholderTextColor:itemColor
                           placeholderText: qsTr("_______")
                       }

                       TextField {
                           x: 227
                           y: 239
                           width: 96
                           height: 21
                           id: tgd_numb
                           //x: 361
                           //y: 16
                          // width: 77
                          // height: 34
                           font.bold: true
                           color: textColor
                           font.pixelSize: 18
                           placeholderTextColor:itemColor
                           placeholderText: qsTr("_______")
                       }

                       Button {
                           id: tgu_button
                           x: 329
                           y: 181
                           width: 105
                           height: 33

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
                           }
                       }

                       Button {
                           id: tgd_button
                           x: 329
                           y: 226
                           width: 105
                           height: 34
                           icon.source: "qrc:/imagines/arrowhead-down-outline.svg"
                           text: qsTr("下插")
                           font.pointSize: 15
                           onClicked:
                           {
                               threadPond_obj.tGdown((Number(tgd_numb.text)));
                           }
                       }

                       Button {
                          // id: button4
                           x: 445
                           y: 181
                           width: 83
                           height: 79
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
                           }
                       }

                       Label {
                           //id: label2
                           x: 38
                           y: 298
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
                           y: 341
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
                               threadPond_obj .armmoveup(Number(kmd_numb.text));
                           }
                       }

                       Button {

                           x: 445
                           y: 284
                           width: 83
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
                               threadPond_obj.armstop();
                           }
                       }

                       TextField {

                           x: 229
                           y: 298
                           id: kmu_numb
                         //  x: 361
                         //  y: 16
                           width: 94
                           height: 20
                           font.pixelSize: 18
                           font.bold: true
                           placeholderTextColor:itemColor
                           color: textColor
                           placeholderText: qsTr("_______")
                       }

                       TextField {

                           x: 229
                           y: 341
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
                           font.pixelSize: 18
                           placeholderText: qsTr("_______")
                       }

                       Label {

                           x: 36
                           y: 398
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

                           x: 36
                           y: 437
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

                       Label {

                           x: 38
                           y: 480
                           width: 185
                           height: 20
                           id: sxml
                           color: itemColor
                           text: qsTr("声学命令选择:")
                           font.pixelSize: 20
                           //anchors.fill: parent
                           //Layout.preferredWidth: 40
                           // Layout.preferredHeight: 40
                       }

                       TextField {

                           x: 228
                           y: 398
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

                           x: 227
                           y: 437
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

                       ComboBox {
                           //id: comboBox
                           x: 229
                           y: 471
                           width: 66
                           height: 34
                           id:comID
                  //         x:900
                  //         y:800
                          // width: 100
                          // height: 30
                           Layout.topMargin: 20
                           Layout.fillWidth: true
                           editable: false
                           flat: false
                           clip: true
                         //clip: true
                           visible: true
                           font.pixelSize: 15
                           popup.font.pixelSize: 15//下拉菜单字体大小
                           popup.topPadding:33 //距离选定数字的距离，必须设置
                           popup.margins: 20
                           enabled: true
                           focusPolicy: Qt.ClickFocus
                           model:["1号","2号","3号","4号","5号"]

                                      onActivated: {
                                          console.log(displayText)
                                          console.log(index)
                                      }
                       }

                       Button {

                           x: 331
                           y: 398
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
                            }


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
                           y: 124
                           width: 135
                           height: 24
                           text: "钻进电机开关:"
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
                            }
                       }

                       Button {
                           id: zuanjinbutton
                           x: 226
                           y: 116
                           width: 84
                           height: 32
                           text: qsTr("钻进上电")
                            font.pixelSize: 15
                            onClicked:
                            {
                                threadPond_obj.zuanjinKG();
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
                           y: 124
                           width: 43
                           height: 24
                           color: "#FF0000"
                           text: qsTr("关闭")
                           font.pixelSize: 20
                       }

                       Label {
                           id: label5
                           x: 36
                           y: -6
                           width: 133
                           height: 24
                           text: "液压电机状态:"
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
                           }
                       }


//                   Canvas
//                   {

//                       id:textLine1
//                       //parent: textArea
//                       // width: parent.width
//                       //height:parent.height
//                       x: 0
//                       y: 0
//                       width: 850
//                       height: 900
//                       layer.enabled: true
//                       enabled: false

//                       onPaint:
//                       {

//                           var ctx = textLine1.getContext('2d');
//                           var grd2=ctx.createLinearGradient(10, 130, 850, 130);
//                           grd2.addColorStop(0,color);
//                           grd2.addColorStop(0.5,mainColor);
//                           grd2.addColorStop(1,color);
//                           // 将渐变赋值给线的样式
//                           ctx.strokeStyle=grd2;
//                           // 设置线的宽度
//                           ctx.lineWidth = 3;
//                           // 绘制线
//                           ctx.beginPath();
//                           ctx.moveTo(10, 130);
//                           ctx.lineTo(850, 130);
//                           ctx.stroke();


//                           var grd3=ctx.createLinearGradient(10, 350, 850, 350);
//                           grd3.addColorStop(0,color);
//                           grd3.addColorStop(0.5,mainColor);
//                           grd3.addColorStop(1,color);
//                           // 将渐变赋值给线的样式
//                           ctx.strokeStyle=grd3;
//                           // 设置线的宽度
//                           ctx.lineWidth = 3;
//                           // 绘制线
//                           ctx.beginPath();
//                           ctx.moveTo(10, 350);
//                           ctx.lineTo(850, 350);
//                           ctx.stroke();


//                           var grd4=ctx.createLinearGradient(10, 570, 850, 570);
//                           grd4.addColorStop(0,color);
//                           grd4.addColorStop(0.5,mainColor);
//                           grd4.addColorStop(1,color);
//                           // 将渐变赋值给线的样式
//                           ctx.strokeStyle=grd4;
//                           // 设置线的宽度
//                           ctx.lineWidth = 3;
//                           // 绘制线
//                           ctx.beginPath();
//                           ctx.moveTo(10, 570);
//                           ctx.lineTo(850, 570);
//                           ctx.stroke();

//                       }
//                   }



               }
               Item {
                   Text {
                       anchors.centerIn: parent
                       text: qsTr("Second")
                       color: mainColor
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
      }
      else
      {
          zddianjiState.color="#00FF00";
          zddianjiState.text="打开"
      }

      if(sbkg==0)
      {
          shuibengState.color="#FF0000";
          shuibengState.text="关闭"
      }
      else
      {
          shuibengState.color="#00FF00";
          shuibengState.text="打开"
      }

      if(zjkg==0)
      {
          zuanjinState.color="#FF0000";
          zuanjinState.text="关闭"
      }
      else
      {
          zuanjinState.color="#00FF00";
          zuanjinState.text="打开"
      }
      if(yykg==0)
      {
          yeyaState.color="#FF0000";
          yeyaState.text="关闭"
      }
      else
      {
          yeyaState.color="#00FF00";
          yeyaState.text="打开"
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
         // textArea.text+=mMSG[0].toFixed(2);
          rollNow=mMSG[0].toFixed(2)
          pitchNow=mMSG[1].toFixed(2);
          yawNow=mMSG[2].toFixed(2);
          depthNow=mMSG[3].toFixed(2);
          distance2BaseNow=mMSG[4].toFixed(2);
          rotateAngleNow=mMSG[5].toFixed(2);
          pushLengthNow=mMSG[6].toFixed(2);
          movelengthNow=mMSG[7].toFixed(2);
          transducerPressureNow=mMSG[8].toFixed(2);
          cylinderPressureNow=mMSG[9].toFixed(2);

          zdkg=mMSG[13];
          yykg=mMSG[14];
          sbkg=mMSG[15];
          zjkg=mMSG[16];

          checkState()
          mainCarton.start();

      }




    }
    CameraDLL
    {
        id:camera_obj
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
