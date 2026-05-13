import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0

ApplicationWindow {
    id: root
    width: 400
    height: 500
    visible: true
    title: "Авторизация"
    
    property bool loggedIn: false
    
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: loginPage
    }
    
    Component {
        id: loginPage
        Rectangle {
            color: "#2c3e50"
            
            ColumnLayout {
                anchors.centerIn: parent
                width: parent.width - 40
                spacing: 20
                
                Text {
                    text: "Корпоративная ИС"
                    color: "white"
                    font.pixelSize: 24
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                }
                
                TextField {
                    id: emailField
                    Layout.fillWidth: true
                    placeholderText: "Email"
                    color: "white"
                    background: Rectangle {
                        color: "#34495e"
                        radius: 4
                    }
                }
                
                TextField {
                    id: passwordField
                    Layout.fillWidth: true
                    placeholderText: "Пароль"
                    echoMode: TextField.Password
                    color: "white"
                    background: Rectangle {
                        color: "#34495e"
                        radius: 4
                    }
                    onAccepted: loginButton.clicked()
                }
                
                Button {
                    id: loginButton
                    text: "Войти"
                    Layout.fillWidth: true
                    enabled: emailField.text.length > 0 && passwordField.text.length > 0
                    onClicked: appBridge.login(emailField.text, passwordField.text)
                }
                
                Text {
                    id: errorText
                    Layout.fillWidth: true
                    color: "#e74c3c"
                    wrapMode: Text.WordWrap
                    visible: false
                }
            }
            
            Connections {
                target: appBridge
                function onLoginFailed(message) {
                    errorText.text = message
                    errorText.visible = true
                }
                function onLoginStatusChanged() {
                    if (appBridge.isLoggedIn) {
                        stackView.push(mainPage)
                    }
                }
            }
        }
    }
    
    Component {
        id: mainPage
        Rectangle {
            color: "#2c3e50"
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 20
                
                Text {
                    text: "Добро пожаловать!"
                    color: "white"
                    font.pixelSize: 24
                    font.bold: true
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    height: 100
                    color: "#34495e"
                    radius: 8
                    
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 5
                        
                        Text {
                            text: "Имя: " + appBridge.userName
                            color: "white"
                            font.pixelSize: 16
                        }
                        Text {
                            text: "Должность: " + appBridge.userPosition
                            color: "white"
                            font.pixelSize: 14
                        }
                    }
                }
                
                Button {
                    text: "Выйти"
                    Layout.alignment: Qt.AlignRight
                    onClicked: {
                        appBridge.logout()
                        stackView.pop()
                    }
                }
            }
        }
    }
}
