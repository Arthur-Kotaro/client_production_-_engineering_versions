import QtQuick 6.0
import QtQuick.Controls 6.0

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Corporate Client"
    
    Rectangle {
        anchors.fill: parent
        color: "#2c3e50"
        
        Text {
            anchors.centerIn: parent
            text: "Corporate Client\nSuccessfully Started!"
            color: "white"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
        }
        
        Button {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Exit"
            onClicked: Qt.quit()
        }
    }
}
