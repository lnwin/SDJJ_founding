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

Window {

    id:mainWindow
    visible: true
    x:0
    y:0
    width: 1920
    height: 1080
    color: "#01113a"
    property string mainColor:"#4682B4"
    title: qsTr("Hello World")

    ValueSource
    {
        id: valueSource
    }




    Button {
        id: button
        x: 891
        y: 420
        width: 68
        height: 43
        text: qsTr("Button")

        //        onClicked:
        //        ParallelAnimation {
        //            // We changed gears so we lost a bit of speed.
        //            NumberAnimation {
        //                target: valueSource           //动画应用于目标对象
        //                 property: "kph"               //y轴方向的运动
        //                 from:30
        //                 to: 50
        //                 duration: 1000              //运动时间为3秒
        //                 // loops:10                    //运动为10个周期
        //                 easing.type: Easing.Linear //匀
        //            }
        //            NumberAnimation {
        //                target: valueSource
        //                property: "agr"
        //               // easing.type: Easing.InOutSine
        //                from: 0
        //                to: 30.5
        //                duration: 1000
        //                easing.type: Easing.Linear //匀
        //            }
        //            NumberAnimation {
        //                target: valueSource
        //                property: "movelength"
        //               // easing.type: Easing.InOutSine
        //                from: 50
        //                to: 300
        //                duration: 1000
        //                easing.type: Easing.Linear //匀
        //            }
        //            NumberAnimation {
        //                target: valueSource
        //                property: "rotaAngle"
        //               // easing.type: Easing.InOutSine
        //                from: 30
        //                to: 90
        //                duration: 1000
        //                easing.type: Easing.Linear //匀
        //            }

        //            NumberAnimation {
        //                target: valueSource
        //                property: "pushLength"
        //               // easing.type: Easing.InOutSine
        //                from: 0
        //                to: 10
        //                duration: 1000
        //                easing.type: Easing.Linear //匀
        //            }
        //            NumberAnimation {
        //                target: valueSource
        //                property: "distance2Base"
        //               // easing.type: Easing.InOutSine
        //                from: 100
        //                to: 0
        //                duration: 1000
        //                easing.type: Easing.Linear //匀
        //            }
        //        }


    }




    CircularGauge {
        id: speedometer
        x: 823
        width: 120
        height: 99
        value: valueSource.kph
        minimumValue: -150
        maximumValue: 150
        anchors.verticalCenter: parent.verticalCenter

        // We set the width to the height, because the height will always be
        // the more limited factor. Also, all circular controls letterbox
        // their contents to ensure that they remain circular. However, we
        // don't want to extra space on the left and right of our gauges,
        // because they're laid out horizontally, and that would create
        // large horizontal gaps between gauges on wide screens.
        anchors.verticalCenterOffset: -249

        style: AKleveStyle {}

    }

    SK2level
    {
        id:pitch
        x: 540
        y:23
        width: 140
        height: 130
        angleValue: valueSource.agr
        itemName:"Pitch"

    }
    SK2machinery
    {
        x: 511
        y: 299
        width: 502
        height: 694
        moveLength: valueSource.movelength
        rotaAngle: valueSource.rotaAngle
        pushLength: valueSource.pushLength
        distance2Base:valueSource.distance2Base
        waterDepth: valueSource.waterDepth
        transducerPressure:valueSource.transducerPressure
        cylinderPressure:valueSource.cylinderPressure
        controlPower:valueSource.controlPower
        impetusPower:valueSource.impetusPower

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
        id: sK2level
        x: 707
        y: 23
        width: 142
        height: 130
    }

    SK2level {
        id: sK2level1
        x: 865
        y: 23
        width: 143
        height: 130
    }

    ChartView {
        id: spline
        x: 1019
        y: 69
        width: 443
        height: 242
        layer.smooth: true
        layer.samples: 16
        layer.enabled: false
        titleColor: "#01122d"
        plotAreaColor: "#0e89cf"
        backgroundColor: "#01122d"
        SplineSeries {
            name: "SplineSeries"
            XYPoint {
                x: 0
                y: 1
            }

            XYPoint {
                x: 3
                y: 4.3
            }

            XYPoint {
                x: 5
                y: 3.1
            }

            XYPoint {
                x: 8
                y: 5.8
            }
        }
    }

    ChartView {
        id: spline1
        x: 1462
        y: 69
        width: 444
        height: 242
        backgroundColor: "#01122d"
        plotAreaColor: "#01122d"
        SplineSeries {
            name: "SplineSeries"
            XYPoint {
                x: 0
                y: 1
            }

            XYPoint {
                x: 3
                y: 4.3
            }

            XYPoint {
                x: 5
                y: 3.1
            }

            XYPoint {
                x: 8
                y: 5.8
            }
        }
    }

    ChartView {
        id: spline2
        x: 1019
        y: 288
        width: 443
        height: 242
        backgroundColor: "#01122d"
        plotAreaColor: "#01122d"
        SplineSeries {
            name: "SplineSeries"
            XYPoint {
                x: 0
                y: 1
            }

            XYPoint {
                x: 3
                y: 4.3
            }

            XYPoint {
                x: 5
                y: 3.1
            }

            XYPoint {
                x: 8
                y: 5.8
            }
        }
    }

    ChartView {
        id: spline3
        x: 1463
        y: 288
        width: 443
        height: 242
        backgroundColor: "#01122d"
        plotAreaColor: "#01122d"
        SplineSeries {
            name: "SplineSeries"
            XYPoint {
                x: 0
                y: 1
            }

            XYPoint {
                x: 3
                y: 4.3
            }

            XYPoint {
                x: 5
                y: 3.1
            }

            XYPoint {
                x: 8
                y: 5.8
            }
        }
    }

    ChartView {
        id: spline4
        x: 1019
        y: 512
        width: 443
        height: 242
        backgroundColor: "#01122d"
        plotAreaColor: "#01122d"
        SplineSeries {
            name: "SplineSeries"
            XYPoint {
                x: 0
                y: 1
            }

            XYPoint {
                x: 3
                y: 4.3
            }

            XYPoint {
                x: 5
                y: 3.1
            }

            XYPoint {
                x: 8
                y: 5.8
            }
        }
    }

    ChartView {
        id: spline5
        x: 1463
        y: 512
        width: 443
        height: 242
        backgroundColor: "#01122d"
        plotAreaColor: "#01122d"
        SplineSeries {
            name: "SplineSeries"
            XYPoint {
                x: 0
                y: 1
            }

            XYPoint {
                x: 3
                y: 4.3
            }

            XYPoint {
                x: 5
                y: 3.1
            }

            XYPoint {
                x: 8
                y: 5.8
            }
        }
    }

    TextArea {
        id: textArea
        x: 35
        y: 784
        width: 460
        height: 203
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
            id:configButtons
            anchors.leftMargin: 20
            anchors.rightMargin: 20

            anchors.fill: parent
            anchors.margins: 7
            spacing: 70


            Button {
                                id: sadas
                                text: qsTr("Navigation")
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                            }
            Button {
                                id: dsad
                                text: qsTr("Navigation")
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                            }
            Button {
                                id: asdasd
                                text: qsTr("Navigation")
                                //icon.name: "navigation"
                                Layout.fillHeight: true
                            }


        }



    }

}



