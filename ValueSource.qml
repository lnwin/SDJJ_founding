import QtQuick 6.4

Item {

    id: valueSource
    property real kph: 30
    property real pitch: 0
    property real roll: 0
    property real yaw: 0
    property real movelength: 0//3000
    property real rotateAngle:0 //90
    property real pushLength:0//210
    property real distance2Base: 0
    property real waterDepth: 30
    property real transducerPressure:0
    property real cylinderPressure:100
    property real controlPower:25.3
    property real impetusPower:51.3
    property real soundPower:24.1

    property string gear: {
        var g;
        if (kph == 0) {
            return "P";
        }
        if (kph < 30) {
            return "1";
        }
        if (kph < 50) {
            return "2";
        }
        if (kph < 80) {
            return "3";
        }
        if (kph < 120) {
            return "4";
        }
        if (kph < 160) {
            return "5";
        }
    }
    property int turnSignal: gear == "P" && !start ? randomDirection() : -1
    property real temperature: 0.6
    property bool start: true

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
