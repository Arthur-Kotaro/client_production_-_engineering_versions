import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0

Rectangle {
    id: root
    color: "#121212"
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        
        Text {
            text: "Добро пожаловать!"
            font.pixelSize: 28
            font.bold: true
            color: "white"
            Layout.fillWidth: true
        }
        
        Rectangle {
            Layout.fillWidth: true
            height: 150
            color: "#1E1E1E"
            radius: 8
            
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 8
                
                Text {
                    text: "👤 " + (mainWindowBridge ? mainWindowBridge.userName : "Загрузка...")
                    color: "white"
                    font.pixelSize: 18
                    font.bold: true
                }
                
                Text {
                    text: "📧 " + (mainWindowBridge ? mainWindowBridge.userEmail : "")
                    color: "#B0B0B0"
                    font.pixelSize: 14
                }
                
                Text {
                    text: "💼 " + (mainWindowBridge ? mainWindowBridge.userPosition : "")
                    color: "#B0B0B0"
                    font.pixelSize: 14
                }
                
                Text {
                    text: "⏰ Срок действия пароля: " + (mainWindowBridge ? mainWindowBridge.passwordDaysLeft : "0") + " дней"
                    color: mainWindowBridge && mainWindowBridge.passwordDaysLeft <= 7 ? "#FF5252" : "#4CAF50"
                    font.pixelSize: 14
                    font.bold: mainWindowBridge && mainWindowBridge.passwordDaysLeft <= 7
                }
            }
        }
        
        Button {
            text: "Выйти"
            Layout.alignment: Qt.AlignRight
            onClicked: {
                if (mainWindowBridge) {
                    mainWindowBridge.logout()
                }
                Qt.quit()
            }
        }
    }
}
