import QtQuick 6.0
import QtQuick.Controls 6.0

Window {
    visible: true
    width: 400
    height: 500
    title: "Авторизация"
    
    Column {
        anchors.centerIn: parent
        spacing: 10
        
        TextField { id: emailField; placeholderText: "Email" }
        TextField { id: passwordField; placeholderText: "Password"; echoMode: TextField.Password }
        Button { text: "Login"; onClicked: Qt.quit() }
    }
}
