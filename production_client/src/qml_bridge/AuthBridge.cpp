#include "AuthBridge.h"

AuthBridge::AuthBridge(QObject* parent) : QObject(parent) {}

void AuthBridge::attemptLogin(const QString& email, const QString& password) {
    Q_UNUSED(email);
    Q_UNUSED(password);
}

void AuthBridge::logout() {}
