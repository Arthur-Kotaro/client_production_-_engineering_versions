#include "userserviceclient/AuthService.h"
#include "userserviceclient/ApiClient.h"
#include <QDebug>

namespace UsersService {

AuthService::AuthService(std::shared_ptr<ApiClient> apiClient, QObject* parent) 
    : QObject(parent)
    , m_apiClient(apiClient)
{
}

void AuthService::login(const QString& email, const QString& password) { 
    Q_UNUSED(email);
    Q_UNUSED(password);
    
    AuthResult result;
    result.success = true;
    result.errorType = "test";
    result.errorMessage = "Test login (use --server for real API)";
    result.session.isValid = true;
    result.session.email = email;
    result.session.fullName = "Test User";
    result.session.position = "Engineer";
    
    emit loginCompleted(result);
}

void AuthService::refreshToken(const QString& refreshToken) { 
    Q_UNUSED(refreshToken);
    emit tokenRefreshed("new_access_token", "new_refresh_token");
}

void AuthService::logout() {
    m_currentSession = UserSession();
}

void AuthService::changePassword(const QString& currentPassword, const QString& newPassword) { 
    Q_UNUSED(currentPassword);
    Q_UNUSED(newPassword);
    emit passwordChanged(true, "Password changed successfully");
}

void AuthService::resetPassword(const QString& email) { 
    Q_UNUSED(email);
    emit passwordReset(true, "Reset email sent");
}

void AuthService::checkPasswordExpiry() {
    emit passwordExpiryInfo(30, false, "2025-12-31T23:59:59Z");
}

UserSession AuthService::currentSession() const { 
    return m_currentSession;
}

void AuthService::restoreSession(const QString& accessToken, const QString& refreshToken) { 
    m_currentSession.accessToken = accessToken;
    m_currentSession.refreshToken = refreshToken;
    m_currentSession.isValid = true;
}

bool AuthService::isSessionValid() const { 
    return m_currentSession.isValid && !m_currentSession.accessToken.isEmpty();
}

} // namespace UsersService
