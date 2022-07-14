import QtQuick 2.0

Item {

    id: valueSource
    property real kph: 30
    property real agr: 0
    property real movelength: 50
    property real rotateAngle: 0
    property real pushLength: 0
    property real distance2Base: 0
    property real waterDepth: 30
    property real transducerPressure:0
    property real cylinderPressure:100
    property real controlPower:50
    property real impetusPower:90

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
