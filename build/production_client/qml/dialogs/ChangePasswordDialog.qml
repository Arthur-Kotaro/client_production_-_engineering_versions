import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0
import "../styles"

Dialog {
    id: root
    title: "Смена пароля"
    modal: true
    width: 400
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    
    standardButtons: Dialog.NoButton
    
    background: Rectangle {
        color: Colors.surfaceColor
        radius: 8
    }
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 10
        
        TextField {
            id: currentPwd
            Layout.fillWidth: true
            placeholderText: "Текущий пароль"
            echoMode: TextField.Password
            color: Colors.textColor
        }
        
        TextField {
            id: newPwd
            Layout.fillWidth: true
            placeholderText: "Новый пароль"
            echoMode: TextField.Password
            color: Colors.textColor
        }
        
        TextField {
            id: confirmPwd
            Layout.fillWidth: true
            placeholderText: "Подтверждение"
            echoMode: TextField.Password
            color: Colors.textColor
        }
        
        RowLayout {
            Layout.fillWidth: true
            Button {
                text: "Отмена"
                onClicked: root.close()
            }
            Button {
                text: "Сменить"
                onClicked: mainWindowBridge.changePassword(currentPwd.text, newPwd.text)
            }
        }
    }
}
