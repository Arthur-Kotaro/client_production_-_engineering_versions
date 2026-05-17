import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Window 6.0
import "windows" as Windows

ApplicationWindow {
    id: root
    width: 450
    height: 580
    visible: true
    title: "Engineering :re"
    
    minimumWidth: 400
    minimumHeight: 500
    
    flags: Qt.Window | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: authWindowComponent
    }
    
    Component {
        id: authWindowComponent
        Windows.AuthWindow {
            onLoginSuccess: {
                root.width = 1024
                root.height = 768
                root.minimumWidth = 800
                root.minimumHeight = 600
                stackView.replace(mainWindowComponent)
            }
        }
    }
    
    Component {
        id: mainWindowComponent
        Windows.MainWindow {}
    }
}
