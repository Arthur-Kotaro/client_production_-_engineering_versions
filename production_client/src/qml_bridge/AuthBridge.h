#ifndef AUTHBRIDGE_H
#define AUTHBRIDGE_H

#include <QObject>

class AuthBridge : public QObject {
    Q_OBJECT
public:
    explicit AuthBridge(QObject* parent = nullptr);
    Q_INVOKABLE void attemptLogin(const QString& email, const QString& password);
    Q_INVOKABLE void logout();
};

#endif // AUTHBRIDGE_H
