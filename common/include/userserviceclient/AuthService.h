#ifndef AUTHSERVICE_H
#define AUTHSERVICE_H

#include "UsersServiceClient_global.h"
#include <QObject>
#include <QJsonObject>
#include <QDateTime>
#include <memory>

namespace UsersService {

class ApiClient;

struct USERSERVICECLIENT_EXPORT UserSession {
    bool isValid = false;
    QString accessToken;
    QString refreshToken;
    QJsonObject userPayload;
    QString userId;
    QString email;
    QString fullName;
    QString position;
    QDateTime passwordExpiresAt;
    QList<QJsonObject> projects;
};

struct USERSERVICECLIENT_EXPORT AuthResult {
    bool success = false;
    QString errorType;
    QString errorMessage;
    UserSession session;
};

class USERSERVICECLIENT_EXPORT AuthService : public QObject
{
    Q_OBJECT

public:
    explicit AuthService(std::shared_ptr<ApiClient> apiClient, QObject *parent = nullptr);
    
    void login(const QString& email, const QString& password);
    void refreshToken(const QString& refreshToken);
    void logout();
    void changePassword(const QString& currentPassword, const QString& newPassword);
    void resetPassword(const QString& email);
    void checkPasswordExpiry();
    
    UserSession currentSession() const;
    void restoreSession(const QString& accessToken, const QString& refreshToken);
    bool isSessionValid() const;
    
signals:
    void loginCompleted(const AuthResult& result);
    void tokenRefreshed(const QString& newAccessToken, const QString& newRefreshToken);
    void passwordChanged(bool success, const QString& message);
    void passwordReset(bool success, const QString& message);
    void passwordExpiryInfo(int daysRemaining, bool isExpired, const QString& expiresAt);
    void sessionExpired();

private:
    std::shared_ptr<ApiClient> m_apiClient;
    UserSession m_currentSession;
};

} // namespace UsersService

#endif // AUTHSERVICE_H
