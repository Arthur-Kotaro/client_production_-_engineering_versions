import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0
import "../styles"

Rectangle {
    id: root
    anchors.fill: parent
    color: Colors.background
    
    signal loginSuccess()
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        
        Item { Layout.fillHeight: true }
        
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 450
            radius: 16
            color: Colors.surface
            border.color: Colors.border
            border.width: 1
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30
                spacing: 20
                
                Text {
                    text: "🏢"
                    font.pixelSize: 48
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Text {
                    text: "Вход в систему"
                    font.pixelSize: 24
                    font.bold: true
                    color: Colors.text
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Text {
                    text: "Engineering :re"
                    font.pixelSize: 12
                    color: Colors.textSecondary
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8
                    
                    Text {
                        text: "Email"
                        font.pixelSize: 14
                        font.bold: true
                        color: Colors.text
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        height: 48
                        radius: 8
                        color: Colors.surface
                        border.color: emailField.activeFocus ? Colors.button : Colors.border
                        border.width: emailField.activeFocus ? 2 : 1
                        
                        TextField {
                            id: emailField
                            anchors.fill: parent
                            anchors.margins: 12
                            placeholderText: "user@example.com"
                            placeholderTextColor: Colors.textSecondary
                            color: Colors.text
                            font.pixelSize: 14
                            background: Rectangle { color: "transparent" }
                            selectByMouse: true
                            onAccepted: performLogin()
                        }
                    }
                }
                
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8
                    
                    Text {
                        text: "Пароль"
                        font.pixelSize: 14
                        font.bold: true
                        color: Colors.text
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        height: 48
                        radius: 8
                        color: Colors.surface
                        border.color: passwordField.activeFocus ? Colors.button : Colors.border
                        border.width: passwordField.activeFocus ? 2 : 1
                        
                        TextField {
                            id: passwordField
                            anchors.fill: parent
                            anchors.margins: 12
                            placeholderText: "••••••••"
                            placeholderTextColor: Colors.textSecondary
                            echoMode: TextField.Password
                            color: Colors.text
                            font.pixelSize: 14
                            background: Rectangle { color: "transparent" }
                            selectByMouse: true
                            onAccepted: performLogin()
                        }
                    }
                }
                
                Button {
                    text: "Войти"
                    Layout.fillWidth: true
                    Layout.preferredHeight: 48
                    onClicked: performLogin()
                    background: Rectangle {
                        color: Colors.button
                        radius: 8
                    }
                    contentItem: Text {
                        text: parent.text
                        color: Colors.buttonText
                        font.pixelSize: 14
                        font.bold: true
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                
                BusyIndicator {
                    id: loginBusy
                    running: false
                    Layout.alignment: Qt.AlignHCenter
                    visible: running
                }
                
                Text {
                    id: errorText
                    visible: false
                    color: Colors.error
                    font.pixelSize: 12
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                }
                
                Text {
                    text: "Забыли пароль?"
                    color: Colors.button
                    font.pixelSize: 12
                    Layout.alignment: Qt.AlignHCenter
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: console.log("Reset password requested")
                    }
                }
            }
        }
        
        Item { Layout.fillHeight: true }
    }
    
    function performLogin() {
        loginBusy.running = true
        errorText.visible = false
        authBridge.attemptLogin(emailField.text, passwordField.text)
    }
    
    Connections {
        target: authBridge
        function onLoginSuccess() {
            loginBusy.running = false
            root.loginSuccess()
        }
        function onLoginFailed(message) {
            loginBusy.running = false
            errorText.text = message
            errorText.visible = true
        }
    }
}
