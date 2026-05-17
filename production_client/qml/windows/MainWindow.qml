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
        height: 85
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
            anchors.topMargin: 8
            anchors.bottomMargin: 8
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            spacing: 15
            
            // Левая часть - информация о пользователе (увеличен шрифт)
            ColumnLayout {
                spacing: 4
                Layout.fillWidth: true
                
                Text {
                    text: mainWindowBridge ? mainWindowBridge.userName : "Пользователь"
                    color: Colors.text
                    font.pixelSize: 17
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
            
            // Центральная часть - срок пароля (увеличен шрифт)
            ColumnLayout {
                spacing: 4
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: -20
                
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
            
            // Правая часть - кнопки
            RowLayout {
                spacing: 12
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                
                Button {
                    text: "🌓"
                    font.pixelSize: 22
                    flat: true
                    implicitWidth: 55
                    implicitHeight: 55
                    onClicked: root.themeToggleRequested()
                    ToolTip.text: "Сменить тему"
                    ToolTip.visible: hovered
                }
                
                Button {
                    text: "🔑"
                    font.pixelSize: 22
                    flat: true
                    implicitWidth: 55
                    implicitHeight: 55
                    onClicked: changePasswordDialog.open()
                    ToolTip.text: "Сменить пароль"
                    ToolTip.visible: hovered
                }
                
                Button {
                    text: "🚪"
                    font.pixelSize: 22
                    flat: true
                    implicitWidth: 55
                    implicitHeight: 55
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
            font.pixelSize: 18
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
