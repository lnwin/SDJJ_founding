import QtQuick
import QtQuick.Controls

CircularGaugeStyle {
    id:levelchart
    tickmarkInset: toPixels(0.04)
    minorTickmarkInset: tickmarkInset
    tickmarkStepSize: 30//刻度间隔
    labelStepSize: 30//刻度字体间隔
    labelInset: toPixels(0.23)

    minimumValueAngle: -150
    maximumValueAngle: 150



    property real xCenter: outerRadius
    property real yCenter: outerRadius
    property real needleLength: outerRadius - tickmarkInset * 1.25
    property real needleTipWidth: toPixels(0.02)
    property real needleBaseWidth: toPixels(0.06)
    property bool halfGauge: false  //半表选择




    function toPixels(percentage) {
        return percentage * outerRadius;
    }

    function degToRad(degrees) {
        return degrees * (Math.PI / 180);
    }

    function radToDeg(radians) {
        return radians * (180 / Math.PI);
    }

    function paintBackground(ctx,skdf) {
        if (halfGauge) {
            ctx.beginPath();
            ctx.rect(0, 0, ctx.canvas.width, ctx.canvas.height / 2);
            ctx.clip();
        }

        ctx.beginPath();
        ctx.fillStyle = "black";
        ctx.ellipse(0, 0, ctx.canvas.width, ctx.canvas.height);
        ctx.fill();

//        ctx.beginPath();
//        ctx.lineWidth = tickmarkInset;
//        ctx.strokeStyle = "black";
//        ctx.arc(xCenter, yCenter, outerRadius - ctx.lineWidth / 2, outerRadius - ctx.lineWidth / 2, 0, Math.PI * 2);
//        ctx.stroke();

//        ctx.beginPath();//背景环
//        ctx.lineWidth = tickmarkInset / 2;
//        ctx.strokeStyle = "#622";
//        ctx.arc(xCenter, yCenter, outerRadius - ctx.lineWidth / 2, outerRadius - ctx.lineWidth / 2, 0, Math.PI * 2);
//        ctx.stroke();

        ctx.beginPath();
        ctx.lineWidth =levelchart.toPixels(1);
        ctx.strokeStyle = Qt.rgba(0.4, 0, 1, 1);
        var warningCircumference = 90;
        var startAngle = 0;
        ctx.arc(outerRadius, outerRadius,
        // Start the line in from the decorations, and account for the width of the line itself.
        outerRadius - tickmarkInset - ctx.lineWidth / 2,
        degToRad(0),
        degToRad(180 ), false);
        ctx.stroke();

        ctx.beginPath(); //表芯过渡色
        var gradient = ctx.createRadialGradient(xCenter, yCenter, 0, xCenter, yCenter, outerRadius * 1.5);
        gradient.addColorStop(0, Qt.rgba(1, 1, 1, 0));
        gradient.addColorStop(0.7, Qt.rgba(1, 1, 1, 0.13));
        gradient.addColorStop(1, Qt.rgba(1, 1, 1, 1));
        ctx.fillStyle = gradient;
        ctx.arc(xCenter, yCenter, outerRadius - tickmarkInset, outerRadius - tickmarkInset, 0, Math.PI * 2);
        ctx.fill();




    }

    background: Canvas {
        onPaint: {
            var ctx = getContext("2d");
            var sdsds=100;
            ctx.reset();
            paintBackground(ctx,sdsds);

        }

        Text {
            id: speedText
            font.pixelSize: toPixels(0.3)
            text: kphInt
            color: "white"
            horizontalAlignment: Text.AlignRight
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: toPixels(0.1)

            readonly property int kphInt: control.value
        }
        Text {
            text: "km/h"
            color: "white"
            font.pixelSize: toPixels(0.09)
            anchors.top: speedText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    needle: Canvas {
        implicitWidth: needleBaseWidth
        implicitHeight: needleLength

        property real xCenter: width / 2
        property real yCenter: height / 2

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            ctx.beginPath();
            ctx.moveTo(xCenter - needleBaseWidth / 2, height/2);
            ctx.lineTo(xCenter + needleBaseWidth / 2, height/2);
            ctx.lineTo(xCenter, 0);
            ctx.closePath();
            ctx.fillStyle = Qt.rgba(1, 0, 0, 0.6);
            ctx.fill();


        }
    }

    foreground: null
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
