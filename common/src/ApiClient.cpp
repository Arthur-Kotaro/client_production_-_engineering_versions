#include "userserviceclient/ApiClient.h"
#include <QDebug>

namespace UsersService {

ApiClient::ApiClient(QObject* parent) 
    : QObject(parent)
    , m_nam(std::make_unique<QNetworkAccessManager>())
{
}

ApiClient::~ApiClient() {}

void ApiClient::setServerUrl(const QString& host, int port) { 
    m_host = host;
    m_port = port;
}

void ApiClient::setAuthToken(const QString& token) { 
    m_authToken = token;
}

void ApiClient::clearAuthToken() {
    m_authToken.clear();
}

void ApiClient::get(const QString& endpoint, ApiCallback callback) { 
    Q_UNUSED(endpoint);
    Q_UNUSED(callback);
}

void ApiClient::post(const QString& endpoint, const QJsonObject& data, ApiCallback callback) { 
    Q_UNUSED(endpoint);
    Q_UNUSED(data);
    Q_UNUSED(callback);
}

void ApiClient::put(const QString& endpoint, const QJsonObject& data, ApiCallback callback) { 
    Q_UNUSED(endpoint);
    Q_UNUSED(data);
    Q_UNUSED(callback);
}

void ApiClient::del(const QString& endpoint, ApiCallback callback) { 
    Q_UNUSED(endpoint);
    Q_UNUSED(callback);
}

} // namespace UsersService
