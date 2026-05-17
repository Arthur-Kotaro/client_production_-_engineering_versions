import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0
import "../styles"
import "../dialogs" as Dialogs

Rectangle {
    id: root
    anchors.fill: parent
    color: Colors.bgColor
    
    signal logoutRequested()
    signal themeToggleRequested()
    
    Rectangle {
        id: topBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 60
        color: Colors.primaryColor
        
        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            
            Text {
                text: mainWindowBridge ? mainWindowBridge.userName : "User"
                color: Colors.textColor
                font.bold: true
                Layout.fillWidth: true
            }
            
            Text {
                text: "Пароль: " + (mainWindowBridge ? mainWindowBridge.passwordDaysLeft : 0) + " дн."
                color: mainWindowBridge && mainWindowBridge.passwordDaysLeft <= 7 ? Colors.warningColor : Colors.textSecondaryColor
            }
            
            Button {
                text: "🌓"
                onClicked: root.themeToggleRequested()
                flat: true
            }
            
            Button {
                text: "🔑"
                onClicked: changePasswordDialog.open()
                flat: true
            }
            
            Button {
                text: "🚪"
                onClicked: {
                    mainWindowBridge.logout()
                    root.logoutRequested()
                }
                flat: true
            }
        }
    }
    
    Rectangle {
        anchors.top: topBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: Colors.bgColor
        
        Text {
            anchors.centerIn: parent
            text: "Добро пожаловать!"
            color: Colors.textColor
        }
    }
    
    Dialogs.ChangePasswordDialog {
        id: changePasswordDialog
    }
}
