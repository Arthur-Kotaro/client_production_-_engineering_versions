import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Layouts 6.0

Dialog {
    id: root
    title: "Смена пароля"
    modal: true
    width: 450
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    
    signal passwordChanged()
    
    property string errorMessage: ""
    property bool isSubmitting: false
    
    ColumnLayout {
        width: parent.width
        spacing: 15
        
        Text {
            text: "Введите текущий и новый пароль"
            font.pixelSize: Typography.body2
            color: Colors.textSecondary
            Layout.fillWidth: true
        }
        
        TextField {
            id: currentPasswordField
            Layout.fillWidth: true
            placeholderText: "Текущий пароль"
            echoMode: TextField.Password
        }
        
        TextField {
            id: newPasswordField
            Layout.fillWidth: true
            placeholderText: "Новый пароль"
            echoMode: TextField.Password
            onTextChanged: validatePassword()
        }
        
        TextField {
            id: confirmPasswordField
            Layout.fillWidth: true
            placeholderText: "Подтвердите новый пароль"
            echoMode: TextField.Password
            onTextChanged: validatePassword()
        }
        
        // Индикатор сложности пароля
        Rectangle {
            Layout.fillWidth: true
            height: passwordStrength === "" ? 0 : 30
            visible: passwordStrength !== ""
            color: strengthColor
            radius: 4
            
            Text {
                anchors.centerIn: parent
                text: passwordStrength
                font.pixelSize: Typography.caption
                color: "white"
            }
        }
        
        Text {
            visible: root.errorMessage !== ""
            text: root.errorMessage
            color: Colors.error
            font.pixelSize: Typography.caption
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
        
        RowLayout {
            Layout.fillWidth: true
            spacing: 10
            
            Button {
                text: "Отмена"
                Layout.fillWidth: true
                onClicked: root.close()
            }
            
            Button {
                text: "Сменить пароль"
                Layout.fillWidth: true
                enabled: isValid && !root.isSubmitting
                onClicked: changePassword()
            }
        }
    }
    
    property string passwordStrength: {
        var pwd = newPasswordField.text
        if (pwd.length === 0) return ""
        if (pwd.length < 6) return "Слишком короткий"
        if (pwd.match(/[a-z]/) && pwd.match(/[A-Z]/) && pwd.match(/[0-9]/))
            return "Надёжный пароль"
        if (pwd.match(/[a-z]/) && pwd.match(/[0-9]/))
            return "Средний пароль"
        return "Слабый пароль"
    }
    
    property color strengthColor: {
        switch(passwordStrength) {
            case "Надёжный пароль": return Colors.success
            case "Средний пароль": return Colors.warning
            case "Слабый пароль": return Colors.error
            default: return Colors.disabled
        }
    }
    
    property bool isValid: {
        if (newPasswordField.text.length < 6) return false
        if (newPasswordField.text !== confirmPasswordField.text) return false
        if (currentPasswordField.text.length === 0) return false
        return true
    }
    
    function validatePassword() {
        if (newPasswordField.text !== confirmPasswordField.text && confirmPasswordField.text !== "") {
            errorMessage = "Пароли не совпадают"
        } else {
            errorMessage = ""
        }
    }
    
    function changePassword() {
        root.isSubmitting = true
        mainWindowBridge.changePassword(currentPasswordField.text, newPasswordField.text)
    }
    
    Connections {
        target: mainWindowBridge
        function onPasswordChangeCompleted(success, message) {
            root.isSubmitting = false
            if (success) {
                root.passwordChanged()
                root.close()
            } else {
                root.errorMessage = message
            }
        }
    }
}
