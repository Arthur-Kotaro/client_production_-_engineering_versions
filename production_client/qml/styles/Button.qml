import QtQuick 6.0
import QtQuick.Controls 6.0

Button {
    id: control
    
    // Увеличенный размер для лучшей кликабельности
    implicitHeight: 44
    implicitWidth: Math.max(100, implicitContentWidth + 40)
    
    // Текст кнопки
    text: control.text
    font.pixelSize: Typography.button
    font.weight: Typography.medium
    
    // Цвета с высоким контрастом
    property color normalColor: Colors.buttonBackground
    property color hoverColor: Colors.buttonHover
    property color pressedColor: Colors.buttonPressed
    property color disabledColor: Colors.buttonDisabled
    
    background: Rectangle {
        color: control.enabled ?
               (control.down ? pressedColor :
                control.hovered ? hoverColor : normalColor) :
               disabledColor
        radius: AppStyle.radiusMedium
        border.width: 0
        
        // Лёгкая тень для объёма
        layer.enabled: control.enabled && !control.down
        layer.effect: DropShadow {
            horizontalOffset: 0
            verticalOffset: 1
            radius: 2
            color: "#40000000"
        }
    }
    
    contentItem: Text {
        text: control.text
        color: control.enabled ? Colors.buttonText : Colors.textHint
        font: control.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
