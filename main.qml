import QtQuick.Window 2.12
import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtCharts 2.3
import QtQuick.Controls 2.14
import QtQuick.Controls.Imagine 2.14
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
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
    title: qsTr("abc")
    //====================================================qml 信号槽   仪表盘中转值

   // property var  kphPreviously:50
    property var  pitchPreviously:0
    property var  rollPreviously:0
    property var  yawPreviously:0
    property var  movelengthPreviously:0
    property var  rotateAnglePreviously:0
    property var  pushLengthPreviously:0
    property var  distance2BasePreviously:100
    property var  controlPowerPreviously:0
    property var  depthPreviously:0
    property var transducerPressurePreviously:0
    property var cylinderPressurePreviously:100


   // property var  kphNow:50
    property var  pitchNow:0
    property var  rollNow:0
    property var  yawNow:0
    property var  movelengthNow:0
    property var  rotateAngleNow:0
    property var  pushLengthNow:0
    property var  distance2BaseNow:100
    property var  controlPowerNow:0
    property var  depthNow:0
    property var transducerPressureNow:0
    property var cylinderPressureNow:100
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
            duration: 1000
            easing.type: Easing.Linear //匀

        }
        NumberAnimation {
            target: valueSource
            property: "roll"
           // easing.type: Easing.InOutSine //仪表盘
            from: rollPreviously
            to: rollNow
            duration: 1000
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "yaw"
           // easing.type: Easing.InOutSine //仪表盘
            from: yawPreviously
            to: yawNow
            duration: 1000
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "movelength"
           // easing.type: Easing.InOutSine
            from: movelengthPreviously
            to: movelengthNow
            duration: 1000
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "rotateAngle"
           // easing.type: Easing.InOutSine
            from: rotateAnglePreviously
            to: rotateAngleNow
            duration: 1000
            easing.type: Easing.Linear //匀
        }

        NumberAnimation {
            target: valueSource
            property: "pushLength"
           // easing.type: Easing.InOutSine
            from: pushLengthPreviously
            to: pushLengthNow
            duration: 1000
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "distance2Base"
           // easing.type: Easing.InOutSine
            from: distance2BasePreviously
            to: distance2BaseNow
            duration: 1000
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "controlPower"
           // easing.type: Easing.InOutSine
            from: controlPowerPreviously
            to: controlPowerNow
            duration: 1000
            easing.type: Easing.Linear //匀
        }
        NumberAnimation {
            target: valueSource
            property: "impetusPower"
           // easing.type: Easing.InOutSine
            from: 100
            to: 70
            duration: 1000
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


    Button {
        id: button
        x: 949
        y: 194
        width: 49
        height: 20
        text: qsTr("Button")

                onClicked:
                {

                }



    }




    SK2level
    {
        id:pitch
        x: 540
        y:23
        width: 140
        height: 130
        angleValue: valueSource.pitch
        itemName:"Pitch"

    }
    SK2machinery
    {
        x: 511
        y: 299
        width: 502
        height: 694
        moveLength: valueSource.movelength
        rotateAngle: valueSource.rotateAngle
        pushLength: valueSource.pushLength
        distance2Base:valueSource.distance2Base
        waterDepth: valueSource.waterDepth
        transducerPressure:valueSource.transducerPressure
        cylinderPressure:valueSource.cylinderPressure




    }

    SK2power
    {

        id:controlP
        x: 573
        y: 177
        width: 425
        height: 53
        itemName:"控制电池"
        inputPower:valueSource.controlPower


    }

    SK2power
    {

        id:impetusP
        x: 573
        y: 230
        width: 425
        height: 53
        itemName:"动力电池"
        inputPower:valueSource.impetusPower

    }

    Button {
        id: button1
        x: 1829
        y: 9
        width: 77
        height: 27
        text: qsTr("Close")
        onClicked:
            mainWindow.close()
    }

    SK2level {
        id: roll
        x: 707
        y: 23
        width: 142
        height: 130
        angleValue: valueSource.roll
         itemName:"Roll"
    }

    SK2level {
        id: yaw
        x: 865
        y: 23
        width: 143
        height: 130
        angleValue: valueSource.yaw
        itemName:"Yaw"
    }

    TextArea {
        id: textArea
        x: 35
        y: 784
        width: 460
        height: 203
       // font.pixelSize:15
        verticalAlignment: Text.AlignBottom
        placeholderText: qsTr("Text Area")
    }

    Canvas
    {

        id:textLine
        //parent: textArea
        // width: parent.width
        //height:parent.height
        x: 35
        y: 782
        width: 460
        height: 206
        layer.enabled: true
        enabled: false

        onPaint:
        {


            var ctx = textLine.getContext('2d');
            var grd=ctx.createLinearGradient(0, 0, 460, 0);
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
            ctx.lineTo(460, 0);
            ctx.stroke();
            var grd1=ctx.createLinearGradient(0, 206, 460, 206);
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
            ctx.lineTo(460, 206);
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
        x: 35
        y: 730
        width: 402
        height: 50
        color:"#01113a"
       RowLayout
        {
            id:configButtons
            anchors.leftMargin: 20
            anchors.rightMargin: 20

            anchors.fill: parent
            anchors.margins: 7
            spacing: 15
            Button {
                                id: cameraInt
                                text: qsTr("注册相机")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                                onClicked:
                                {
                                    if(camera_obj.longID()&&camera_obj.longID_1())
                                    {
                                        textArea.text+="Camera Status: Init Success\n"
                                    }
                                    else
                                    {
                                        textArea.text +="Camera Status: Init Faile \n"
                                    }
                                }



                            }

            Button {
                                id: cameraopenORclose
                                text: qsTr("开启相机")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                                onClicked:
                                {
                                    camera_obj.realPlayer();
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

                                }
                            }
            Button {
                                id: rec
                                text: qsTr("开始录像")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true
            }


        }



    }
    Rectangle
    {
        id:buttonFiled
        x: 35
        y: 987
        width: 402
        height: 50
        color:"#01113a"
       RowLayout
        {
            id:cameraButtons
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.fill: parent
            anchors.margins: 7
            spacing: 25

             //property var listOfLists: mpwaveMSG

            Button {
                                id: socketopen
                                text: qsTr("开启监听")
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
                                // threadPond_obj.socket_Listing()

                                }
                            }
            Button {
                                id: ewe3
                                text: qsTr("Navigation")
                                font.pixelSize:15
                                //icon.name: "navigation"
                                Layout.fillHeight: true

            }


        }

    }

    Rectangle {
        id: tabRec
        x: 1036
        y: 48
        width: 875
        height: 989
        color: bgColor
        border.color: mainColor
       // color: mainColor
       //  TableView
        TabBar {    //点击相应的按钮实现切换
               id: bar
               width: parent.width
               height: parent.height
               currentIndex: 0
               TabButton {
                   font.pixelSize:15
                   text: qsTr("控制界面")
                  //height: 20
               }
               TabButton {
                   font.pixelSize:15
                   text: qsTr("波形界面")
               }

           }
        StackLayout {   //栈布局管理器
               anchors.centerIn: parent
               width: parent.width
               height: parent.height*0.9
               currentIndex: bar.currentIndex  //当前视图的索引
               Item {
                   ColumnLayout//垂直总布局
                   {
                       id:controlColumnLayout
                       anchors.fill: parent
                       spacing: 1
                       //leftMargin:10
                       // Layout.leftMargin:50
                       Rectangle//扩展臂释放
                       {
                           id:extensionArm
                           height: 100
                           color: "#00000000"
                          // border.color: mainColor
                           width: 850
                           Layout.alignment:Qt.AlignCenter


                           RowLayout
                           {
                               anchors.fill: parent
                               spacing: 50

                           Button {
                               id: button2
                               width: 149
                               height: 70
                               icon.width: 30
                               icon.height: 30
                               icon.source: "qrc:/imagines/activity-outline.svg"
                               display: Button.TextUnderIcon
                               text: qsTr("扩展臂释放")
                               font.pointSize: 15
                               Layout.leftMargin:50
                               onClicked:
                               {
                                  threadPond_obj.armrelease() ;
                               }
                           }

                           Button {
                               id: button3

                               width: 149
                               height: 70
                               icon.width: 30
                               icon.height: 30
                               icon.source: "qrc:/imagines/slash-outline.svg"
                               display: Button.TextUnderIcon
                               text: qsTr("扩展臂制动")
                               font.pointSize: 15
                               onClicked:
                               {
                                  threadPond_obj.armstop();
                               }
                           }

                           Button {
                               id: button4

                               width: 149
                               height: 70
                               icon.width: 30
                               icon.height: 30
                               icon.source: "qrc:/imagines/undo-outline.svg"
                               display: Button.TextUnderIcon
                               text: qsTr("扩展臂回收")
                               font.pointSize: 15
                               onClicked:
                               {
                                  threadPond_obj.armrecover() ;
                               }
                           }
                           SK2button
                           {
                               id:sk2
                               width: 80
                               height: 80
                               onMyPress:
                               {
                                    imageUrl="qrc:/imagines/buttons_press.png"
                               }
                               onMyEntered:
                               {

                                   imageUrl="qrc:/imagines/buttons_hoved.png";
                               }
                               onMyExited:
                               {
                                   imageUrl="qrc:/imagines/buttons_normal.png"
                               }



                           }
                           }

                       }
                       Rectangle//扩展臂移动
                       {
                           id:extensionArm_move
                           height: 230
                           color: "#00000000"
                          // border.color: mainColor
                           width: 850
                           Layout.alignment:Qt.AlignCenter
                        RowLayout
                        {
                           // anchors.fill: parent
                            Layout.alignment:Qt.AlignCenter
                            spacing: 10
                           ColumnLayout
                           {
                               height: 230
                               width: 100
                               spacing: 50
                               Layout.leftMargin: 50
                               Layout.topMargin: 70
                               Text
                               {
                                   id: kmu
                                   text: qsTr("扩展臂上移距离(mm):")
                                   font.pixelSize: 20
                                  // font.family: "Times New Roman"
                                   color: itemColor
                                  // anchors.fill: parent
                                  //  Layout.preferredWidth: 40
                                  //  Layout.preferredHeight: 40


                               }
                               Text
                               {
                                   id: kmd
                                   color: itemColor
                                   text: qsTr("扩展臂下移距离(mm):")
                                   font.pixelSize: 20
                                   //anchors.fill: parent
                                    Layout.alignment: Qt.AlignHCenter
                                   //Layout.preferredWidth: 40
                                   // Layout.preferredHeight: 40


                               }
                           }
                           ColumnLayout
                           {
                               id:ss1
                               height: 230
                               width: 20
                               spacing: 50
                               Layout.topMargin: 70
                               TextField {
                                   id: kmu_numb
                                   x: 361
                                   y: 16
                                   width: 77
                                   height: 34
                                   font.pixelSize: 18
                                   font.bold: true
                                   color: textColor
                                   placeholderText: qsTr("_______")
                               }
                               TextField {
                                   id: kmd_numb
                                   x: 361
                                   y: 16
                                   width: 77
                                   height: 34
                                   font.bold: true
                                   color: textColor
                                   font.pixelSize: 18
                                   placeholderText: qsTr("_______")
                               }





                           }
                           ColumnLayout
                           {
                               id:ss2
                               height: 230
                               width: 100
                               spacing: 30
                               Layout.topMargin: 70
                               Layout.leftMargin: 10
                               Button {
                                   id: kmu_button

                                  width: 149
                                   height: 20
                                   icon.source: "qrc:/imagines/arrow-circle-up-outline.svg"
                                   text: qsTr("上移")
                                   font.pointSize: 15
                                   onClicked:
                                   {
                                      threadPond_obj .armmoveup(Number(kmu_numb.text));
                                   }
                               }
                               Button {
                                   id: kmd_button
                                   width: 149
                                   height: 50
                                   icon.source: "qrc:/imagines/arrow-circle-down-outline.svg"
                                   text: qsTr("下移")
                                   font.pointSize: 15
                                   onClicked:
                                   {
                                      threadPond_obj .armmoveup(Number(kmd_numb.text));
                                   }

                               }

                           }
                           ColumnLayout
                           {
                               id:ss3
                               height: 230
                               width: 100
                               Layout.topMargin: 70
                               Button {
                                   id: kmd_stop
                                   width: 149
                                   height: 50
                                   text: qsTr("停止")
                                   icon.source: "qrc:/imagines/close-circle-outline.svg"
                                   icon.width: 50
                                   icon.height: 50
                                   display: Button.TextUnderIcon
                                   Layout.fillHeight: true
                                   font.pointSize: 15
                                   onClicked:
                                   {
                                      threadPond_obj.armstop();
                                   }
                               }

                           }


                        }



                       }
                       Rectangle//探杆下插
                       {
                           id:drill_downup
                           height: 230
                           color: "#00000000"
                          // border.color: mainColor
                           width: 850
                           Layout.alignment:Qt.AlignCenter
                           RowLayout
                           {
                              // anchors.fill: parent
                               Layout.alignment:Qt.AlignCenter
                               spacing: 10
                              ColumnLayout
                              {
                                  height: 230
                                  width: 100
                                  spacing: 50
                                  Layout.leftMargin: 50
                                  Layout.topMargin: 70
                                  Text
                                  {
                                      id: tgu
                                      text: qsTr("探杆上移距离(mm):")
                                      font.pixelSize: 20
                                     // font.family: "Times New Roman"
                                      color: itemColor
                                     // anchors.fill: parent
                                     //  Layout.preferredWidth: 40
                                     //  Layout.preferredHeight: 40


                                  }
                                  Text
                                  {
                                      id: tgd
                                      color: itemColor
                                      text: qsTr("探杆下移距离(mm):")
                                      font.pixelSize: 20
                                      //anchors.fill: parent
                                       Layout.alignment: Qt.AlignHCenter
                                      //Layout.preferredWidth: 40
                                      // Layout.preferredHeight: 40


                                  }
                              }
                              ColumnLayout
                              {
                                  id:s1
                                  height: 230
                                  width: 20
                                  spacing: 50
                                  Layout.topMargin: 70
                                  Layout.leftMargin: 20
                                  TextField {
                                      id: tgu_numb
                                      x: 361
                                      y: 16
                                      width: 77
                                      height: 34
                                      font.pixelSize: 18
                                      font.bold: true
                                      color: textColor
                                      placeholderText: qsTr("_______")
                                  }
                                  TextField {
                                      id: tgd_numb
                                      x: 361
                                      y: 16
                                      width: 77
                                      height: 34
                                      font.bold: true
                                      color: textColor
                                      font.pixelSize: 18
                                      placeholderText: qsTr("_______")
                                  }
                              }
                              ColumnLayout
                              {
                                  id:s2
                                  height: 230
                                  width: 100
                                  spacing: 30
                                  Layout.topMargin: 70
                                  Layout.leftMargin: 10
                                  Button {
                                      id: tgu_button

                                      width: 149
                                      height: 20
                                      icon.source: "qrc:/imagines/arrowhead-up-outline.svg"
                                      text: qsTr("上提")
                                      font.pointSize: 15
                                      onClicked:
                                      {
                                         threadPond_obj.tGup(Number(tgu_numb.text));
                                      }
                                  }
                                  Button {
                                      id: tgd_button
                                      width: 149
                                      height: 50
                                      icon.source: "qrc:/imagines/arrowhead-down-outline.svg"
                                      text: qsTr("下插")
                                      font.pointSize: 15
                                      onClicked:
                                      {
                                         threadPond_obj.tGup(Number(tgd_numb.text));
                                      }

                                  }

                              }
                              ColumnLayout
                              {
                                  id:s3
                                  height: 230
                                  width: 100
                                  Layout.topMargin: 70
                                  Button {
                                      id: tgu_stop
                                      width: 149
                                      height: 50
                                      icon.source: "qrc:/imagines/close-circle-outline.svg"
                                      icon.width: 50
                                      icon.height: 50
                                      display: Button.TextUnderIcon
                                      text: qsTr("停止")
                                      Layout.fillHeight: true
                                      font.pointSize: 15
                                      onClicked:
                                      {
                                         threadPond_obj.tGstop() ;
                                      }

                                  }

                              }

                           }

                       }
                       Rectangle//探杆自动探测
                       {
                           id:extensionArm_AUTO
                           height: 300
                           color: "#00000000"
                          // border.color: mainColor
                         width: 850
                         Layout.alignment:Qt.AlignCenter
                         RowLayout
                         {
                         ColumnLayout
                         {
                             height: 230
                             width: 100
                             spacing: 50
                             Layout.leftMargin: 50
                             Layout.topMargin: 70
                             Text
                             {
                                 id: xcjl
                                 text: qsTr("探杆下插距离(mm):")
                                 font.pixelSize: 20
                                // font.family: "Times New Roman"
                                 color: itemColor
                                // anchors.fill: parent
                                //  Layout.preferredWidth: 40
                                //  Layout.preferredHeight: 40


                             }
                             Text
                             {
                                 id: stepA
                                 color: itemColor
                                 text: qsTr("探杆下插步长(mm):")
                                 font.pixelSize: 20
                                 //anchors.fill: parent
                                 //Layout.preferredWidth: 40
                                 // Layout.preferredHeight: 40


                             }
                             Text
                             {
                                 id: sxml
                                 color: itemColor
                                 text: qsTr("声学命令选择:")
                                 font.pixelSize: 20
                                 //anchors.fill: parent
                                 //Layout.preferredWidth: 40
                                 // Layout.preferredHeight: 40


                             }
                         }
                         ColumnLayout
                         {
                             id:s4
                             height: 230
                             width: 20
                             spacing: 50
                             Layout.topMargin: 70
                             Layout.leftMargin: 20
                             TextField {
                                 id: atgjl
                                 x: 361
                                 y: 16
                                 width: 77
                                 height: 34
                                 font.pixelSize: 18
                                 font.bold: true
                                 color: textColor
                                 placeholderText: qsTr("_______")
                             }
                             TextField {
                                 id: atgjl_bc
                                 x: 361
                                 y: 16
                                 width: 77
                                 height: 34
                                 font.bold: true
                                 color: textColor
                                 font.pixelSize: 18
                                 placeholderText: qsTr("_______")
                             }
                             ComboBox
                             {
                                  id:comID
                         //         x:900
                         //         y:800
                                  width: 100
                                  height: 30
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

                         }

                         ColumnLayout
                         {
                             id:s5
                             height: 230
                             width: 20
                             spacing: 50
                             Layout.topMargin: 70
                             Layout.leftMargin: 20
                             Button {
                                id: atoD1
                                width: 149
                                 height: 20
                                 Layout.fillHeight: true
                                 icon.source: "qrc:/imagines/shake-outline.svg"
                                 icon.width: 50
                                 icon.height: 50
                                 display: Button.TextUnderIcon
                                 text: qsTr("开始自动探测")
                                 font.pointSize: 15
                             }


                         }



                 }



                       }




                   }

                   Canvas
                   {

                       id:textLine1
                       //parent: textArea
                       // width: parent.width
                       //height:parent.height
                       x: 0
                       y: 0
                       width: 850
                       height: 900
                       layer.enabled: true
                       enabled: false

                       onPaint:
                       {

                           var ctx = textLine1.getContext('2d');
                           var grd2=ctx.createLinearGradient(10, 130, 850, 130);
                           grd2.addColorStop(0,color);
                           grd2.addColorStop(0.5,mainColor);
                           grd2.addColorStop(1,color);
                           // 将渐变赋值给线的样式
                           ctx.strokeStyle=grd2;
                           // 设置线的宽度
                           ctx.lineWidth = 3;
                           // 绘制线
                           ctx.beginPath();
                           ctx.moveTo(10, 130);
                           ctx.lineTo(850, 130);
                           ctx.stroke();


                           var grd3=ctx.createLinearGradient(10, 350, 850, 350);
                           grd3.addColorStop(0,color);
                           grd3.addColorStop(0.5,mainColor);
                           grd3.addColorStop(1,color);
                           // 将渐变赋值给线的样式
                           ctx.strokeStyle=grd3;
                           // 设置线的宽度
                           ctx.lineWidth = 3;
                           // 绘制线
                           ctx.beginPath();
                           ctx.moveTo(10, 350);
                           ctx.lineTo(850, 350);
                           ctx.stroke();


                           var grd4=ctx.createLinearGradient(10, 570, 850, 570);
                           grd4.addColorStop(0,color);
                           grd4.addColorStop(0.5,mainColor);
                           grd4.addColorStop(1,color);
                           // 将渐变赋值给线的样式
                           ctx.strokeStyle=grd4;
                           // 设置线的宽度
                           ctx.lineWidth = 3;
                           // 绘制线
                           ctx.beginPath();
                           ctx.moveTo(10, 570);
                           ctx.lineTo(850, 570);
                           ctx.stroke();

                       }
                   }



               }
               Item {
                   Text {
                       anchors.centerIn: parent
                       text: qsTr("Second")
                       color: mainColor
                   }
               }

               Item {
               }


           }



    }

//===================================================

    ThreadDLL
    {
      id:threadPond_obj

      onSendSocketState2QML://CPP 信号函数
      {


          textArea.text+=Qt.formatDateTime(new Date(),"yyyy-MM-dd HH:mm:ss")+" "+ssMsg;


      }
      onSendcontrolMSG2QML://传感器参数接收
      {
          textArea.text+=mMSG[0].toFixed(2);
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
//           console.log("rollNow",rollNow);
//           console.log("pitchNow",pitchNow);
//           console.log("yawNow",yawNow);
//           console.log("depthNow",depthNow);
//           console.log("distance2BaseNow",distance2BaseNow);
//           console.log("rotateAngleNow",rotateAngleNow);
//           console.log("pushLengthNow",pushLengthNow);
//           console.log("movelengthNow",movelengthNow);
//           console.log("transducerPressureNow",transducerPressureNow);
//           console.log("cylinderPressureNow",cylinderPressureNow);

          //controlPowerNow=mMSG[1].toFixed(2);
          mainCarton.start();


//          rollPreviously=rollNow
//          pitcPreviously=pitchNow
//          yawPreviously=yawNow
//          depthPreviously=depthNow
//          distance2BasePreviously=distance2BaseNow
//          rotateAnglePreviously=rotateAngleNow
//          pushLengthPreviously= pushLengthNow
//          movelengthPreviously= movelengthNow
//          transducerPressurePreviously=transducerPressureNow
//          cylinderPressurePreviously= cylinderPressureNow

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



