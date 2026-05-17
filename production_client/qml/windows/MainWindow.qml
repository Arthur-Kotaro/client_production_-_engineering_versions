import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0
import "../styles"
import "../dialogs" as Dialogs

Rectangle {
    id: root
    anchors.fill: parent
    color: Colors.background
    
    signal logoutRequested()
    signal themeToggleRequested()
    
    function getPasswordColor(days) {
        if (days > 30) return Colors.success
        if (days >= 15) return Colors.warning
        return Colors.error
    }
    
    function getPasswordText(days) {
        if (days > 30) return "✓ " + days + " дн."
        if (days >= 15) return "⚠ " + days + " дн."
        return "❗ " + days + " дн."
    }
    
    Rectangle {
        id: topBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 75
        color: Colors.primary
        z: 1
        
        Rectangle {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 1
            color: Colors.border
            opacity: 0.5
        }
        
        RowLayout {
            anchors.fill: parent
            anchors.margins: 15
            spacing: 20
            
            // Левая часть - информация о пользователе
            ColumnLayout {
                spacing: 4
                Layout.fillWidth: true
                
                Text {
                    text: mainWindowBridge ? mainWindowBridge.userName : "Пользователь"
                    color: Colors.text
                    font.pixelSize: 16
                    font.bold: true
                }
                Text {
                    text: mainWindowBridge ? mainWindowBridge.userPosition : ""
                    color: Colors.textSecondary
                    font.pixelSize: 14
                }
                Text {
                    text: mainWindowBridge ? mainWindowBridge.userEmail : ""
                    color: Colors.textSecondary
                    font.pixelSize: 13
                    opacity: 0.85
                }
            }
            
            // Центральная часть - срок пароля
            ColumnLayout {
                spacing: 4
                Layout.alignment: Qt.AlignVCenter
                
                Text {
                    text: "Пароль действителен:"
                    color: Colors.textSecondary
                    font.pixelSize: 12
                }
                Text {
                    text: mainWindowBridge ? getPasswordText(mainWindowBridge.passwordDaysLeft) : "Загрузка..."
                    color: mainWindowBridge ? getPasswordColor(mainWindowBridge.passwordDaysLeft) : Colors.textSecondary
                    font.pixelSize: 18
                    font.bold: true
                }
            }
            
            // Правая часть - кнопки (прижаты к правому краю)
            RowLayout {
                spacing: 12
                Layout.alignment: Qt.AlignRight
                
                Button {
                    text: "🌓"
                    font.pixelSize: 20
                    font.bold: true
                    flat: true
                    implicitWidth: 44
                    implicitHeight: 44
                    onClicked: root.themeToggleRequested()
                    ToolTip.text: "Сменить тему"
                    ToolTip.visible: hovered
                }
                
                Button {
                    text: "🔑"
                    font.pixelSize: 20
                    font.bold: true
                    flat: true
                    implicitWidth: 44
                    implicitHeight: 44
                    onClicked: changePasswordDialog.open()
                    ToolTip.text: "Сменить пароль"
                    ToolTip.visible: hovered
                }
                
                Button {
                    text: "🚪"
                    font.pixelSize: 20
                    font.bold: true
                    flat: true
                    implicitWidth: 44
                    implicitHeight: 44
                    onClicked: {
                        mainWindowBridge.logout()
                        root.logoutRequested()
                    }
                    ToolTip.text: "Выйти"
                    ToolTip.visible: hovered
                }
            }
        }
    }
    
    // Основная область
    Rectangle {
        anchors.top: topBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: Colors.background
        
        Text {
            anchors.centerIn: parent
            text: "Добро пожаловать!\nВыберите виджет в меню"
            color: Colors.textSecondary
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }
    }
    
    Dialogs.ChangePasswordDialog {
        id: changePasswordDialog
        onPasswordChanged: mainWindowBridge.checkPasswordExpiry()
    }
    
    Connections {
        target: mainWindowBridge
        function onLogoutCompleted() {
            root.logoutRequested()
        }
    }
}
