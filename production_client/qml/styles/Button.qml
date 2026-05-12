import QtQuick 6.0
import QtQuick.Controls 6.0

Button {
    id: control
    font.pixelSize: Typography.button
    font.bold: true
    
    background: Rectangle {
        color: control.down ? Colors.primaryDark : Colors.primary
        radius: 4
    }
    
    contentItem: Text {
        text: control.text
        color: "white"
        font: control.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
