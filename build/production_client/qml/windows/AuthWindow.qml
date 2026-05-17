import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0
import "../styles"

Rectangle {
    id: root
    anchors.fill: parent
    color: Colors.background
    
    signal loginSuccess()
    
    Rectangle {
        anchors.centerIn: parent
        width: Math.min(parent.width - 40, 380)
        height: 520
        radius: 12
        color: Colors.surface
        border.color: Colors.border
        border.width: 1
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 24
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
                text: "Корпоративная информационная система"
                font.pixelSize: 12
                color: Colors.textSecondary
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
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
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 8
                        
                        Text { text: "📧"; font.pixelSize: 18 }
                        
                        TextField {
                            id: emailField
                            Layout.fillWidth: true
                            placeholderText: "user@company.com"
                            placeholderTextColor: Colors.textSecondary
                            color: Colors.text
                            font.pixelSize: 14
                            background: Rectangle { color: "transparent" }
                            selectByMouse: true
                            onAccepted: performLogin()
                        }
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
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 8
                        
                        Text { text: "🔒"; font.pixelSize: 18 }
                        
                        TextField {
                            id: passwordField
                            Layout.fillWidth: true
                            placeholderText: "••••••••"
                            placeholderTextColor: Colors.textSecondary
                            echoMode: TextField.Password
                            color: Colors.text
                            font.pixelSize: 14
                            background: Rectangle { color: "transparent" }
                            selectByMouse: true
                            onAccepted: performLogin()
                        }
                        
                        Button {
                            width: 32
                            height: 32
                            background: Rectangle { color: "transparent" }
                            contentItem: Text {
                                text: passwordField.echoMode === TextField.Password ? "👁️" : "🙈"
                                font.pixelSize: 18
                            }
                            onClicked: passwordField.echoMode = passwordField.echoMode === TextField.Password ?
                                        TextField.Normal : TextField.Password
                        }
                    }
                }
            }
            
            Button {
                text: "Войти"
                Layout.fillWidth: true
                Layout.preferredHeight: 48
                onClicked: performLogin()
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
            
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 16
                Text {
                    text: "Забыли пароль?"
                    color: Colors.button
                    font.pixelSize: 12
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: console.log("Reset password requested")
                    }
                }
            }
        }
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
