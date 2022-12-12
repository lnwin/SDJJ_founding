import QtQuick 6.4
import QtQuick.Controls 6.4


Rectangle
{
    id:roundButton
    height:100
    width:100
    radius:width/2


       property url imageUrlHover: "qrc:/imagines/buttons_hoved.png"     //按下显示的图片路径
       property url imageUrlNormal: "qrc:/imagines/buttons_normal.png"    //正常显示的图片路径
       property url imageUrlPress: "qrc:/imagines/buttons_press.png"
       property url imageUrl:imageUrlNormal
       signal myClicked           //自定义信号rbClicked,用来表示鼠标点击事件
       signal myEntered
       signal myExited
       signal myPress
       color: "#01113a"
       Image
       {
           id: img
           anchors.fill: parent
           source:area.containsPress ? roundButton.imageUrlPress : roundButton.imageUrlNormal

       }
       Text {
           id: name
           anchors.centerIn: parent
           font.pixelSize: 15
           text: qsTr("急停")
       }
       MouseArea
          {
              id: area
              anchors.fill: parent
              hoverEnabled: parent.enabled
              onClicked:
              {
                  myClicked()
              }

              onEntered:
              {
                  myEntered()
              }

              onExited:
              {
                  myExited()
              }

              onPressed:
              {
                  myPress()
              }






          }



}


