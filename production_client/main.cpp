#include <QGuiApplication>
#include <QQuickView>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    
    // Встроенный QML код (без многострочной строки)
    view.setSource(QUrl("data:text/qml,import QtQuick 6.0; import QtQuick.Controls 6.0; Rectangle { width: 800; height: 600; color: '#2c3e50'; Text { anchors.centerIn: parent; text: 'Corporate Client\\nVersion 1.0.0\\n\\nSuccessfully Started!'; color: 'white'; font.pixelSize: 24; horizontalAlignment: Text.AlignHCenter } Button { anchors.bottom: parent.bottom; anchors.bottomMargin: 20; anchors.horizontalCenter: parent.horizontalCenter; text: 'Exit'; onClicked: Qt.quit() } }"));
    
    view.show();
    
    qDebug() << "Production Client started with inline QML";
    
    return app.exec();
}
