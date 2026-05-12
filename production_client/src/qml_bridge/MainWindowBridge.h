#ifndef MAINWINDOWBRIDGE_H
#define MAINWINDOWBRIDGE_H

#include <QObject>

class MainWindowBridge : public QObject {
    Q_OBJECT
public:
    explicit MainWindowBridge(QObject* parent = nullptr);
};

#endif // MAINWINDOWBRIDGE_H
