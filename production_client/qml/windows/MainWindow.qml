import QtQuick 6.0
import QtQuick.Controls 6.0

ApplicationWindow {
    width: 800
    height: 600
    visible: true
    title: "Главное окно"
    
    Text {
        anchors.centerIn: parent
        text: "Добро пожаловать!"
        font.pixelSize: 24
    }
}
