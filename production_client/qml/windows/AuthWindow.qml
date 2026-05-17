import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0

Rectangle {
    id: root
    anchors.fill: parent
    color: "#1a1a2e"
    
    signal loginSuccess()
    
    Rectangle {
        anchors.centerIn: parent
        width: Math.min(parent.width - 40, 380)
        height: 520
        radius: 12
        color: "#1E1E1E"
        border.color: "#404040"
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
                color: "white"
                Layout.alignment: Qt.AlignHCenter
            }
            
            Text {
                text: "Корпоративная информационная система"
                font.pixelSize: 12
                color: "#B0B0B0"
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
                    color: "white"
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    height: 48
                    radius: 8
                    color: "#2C2C2C"
                    border.color: emailField.activeFocus ? "#2196F3" : "#555555"
                    border.width: emailField.activeFocus ? 2 : 1
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 8
                        
                        Text {
                            text: "📧"
                            font.pixelSize: 18
                        }
                        
                        TextField {
                            id: emailField
                            Layout.fillWidth: true
                            placeholderText: "user@company.com"
                            placeholderTextColor: "#757575"
                            color: "white"
                            font.pixelSize: 14
                            background: Rectangle { color: "transparent" }
                            selectByMouse: true
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
                    color: "white"
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    height: 48
                    radius: 8
                    color: "#2C2C2C"
                    border.color: passwordField.activeFocus ? "#2196F3" : "#555555"
                    border.width: passwordField.activeFocus ? 2 : 1
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 8
                        
                        Text {
                            text: "🔒"
                            font.pixelSize: 18
                        }
                        
                        TextField {
                            id: passwordField
                            Layout.fillWidth: true
                            placeholderText: "••••••••"
                            placeholderTextColor: "#757575"
                            echoMode: TextField.Password
                            color: "white"
                            font.pixelSize: 14
                            background: Rectangle { color: "transparent" }
                            selectByMouse: true
                            onAccepted: loginButton.clicked()
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
                id: loginButton
                text: "Войти"
                Layout.fillWidth: true
                Layout.preferredHeight: 48
                enabled: emailField.text.length > 0 && passwordField.text.length > 0 && !loginBusy.running
                
                contentItem: Text {
                    text: loginButton.text
                    color: "white"
                    font.pixelSize: 14
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                
                background: Rectangle {
                    radius: 8
                    color: loginButton.enabled ? "#0D47A1" : "#424242"
                }
                
                onClicked: {
                    console.log("Login clicked:", emailField.text)
                    loginBusy.running = true
                    errorText.visible = false
                    authBridge.attemptLogin(emailField.text, passwordField.text)
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
                color: "#FF5252"
                font.pixelSize: 12
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
            }
            
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 16
                
                Button {
                    text: "Забыли пароль?"
                    flat: true
                    font.pixelSize: 12
                    contentItem: Text {
                        text: parent.text
                        color: "#1565C0"
                        font: parent.font
                    }
                    onClicked: {
                        console.log("Reset password requested")
                    }
                }
            }
        }
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
