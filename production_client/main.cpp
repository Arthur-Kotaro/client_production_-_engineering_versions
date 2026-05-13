#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QDebug>
#include <memory>

#include "userserviceclient/ApiClient.h"
#include "userserviceclient/AuthService.h"

using namespace UsersService;

class AppBridge : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isLoggedIn READ isLoggedIn NOTIFY loginStatusChanged)
    Q_PROPERTY(QString userName READ userName NOTIFY userDataChanged)
    Q_PROPERTY(QString userPosition READ userPosition NOTIFY userDataChanged)

public:
    AppBridge(QObject* parent = nullptr) : QObject(parent) {
        m_apiClient = std::make_shared<ApiClient>();
        m_apiClient->setServerUrl("localhost", 8000);
        m_authService = std::make_shared<AuthService>(m_apiClient);
        
        connect(m_authService.get(), &AuthService::loginCompleted,
                this, &AppBridge::onLoginCompleted);
    }
    
    bool isLoggedIn() const { return m_isLoggedIn; }
    QString userName() const { return m_userName; }
    QString userPosition() const { return m_userPosition; }
    
    Q_INVOKABLE void login(const QString& email, const QString& password) {
        qDebug() << "Login attempt:" << email;
        m_authService->login(email, password);
    }
    
    Q_INVOKABLE void logout() {
        m_authService->logout();
        m_isLoggedIn = false;
        m_userName.clear();
        m_userPosition.clear();
        emit loginStatusChanged();
        emit userDataChanged();
    }

signals:
    void loginStatusChanged();
    void userDataChanged();
    void loginFailed(const QString& message);

private slots:
    void onLoginCompleted(const AuthResult& result) {
        if (result.success) {
            qDebug() << "Login successful!";
            m_isLoggedIn = true;
            m_userName = result.session.fullName;
            m_userPosition = result.session.position;
            emit loginStatusChanged();
            emit userDataChanged();
        } else {
            qDebug() << "Login failed:" << result.errorMessage;
            emit loginFailed(result.errorMessage);
        }
    }

private:
    std::shared_ptr<ApiClient> m_apiClient;
    std::shared_ptr<AuthService> m_authService;
    bool m_isLoggedIn = false;
    QString m_userName;
    QString m_userPosition;
};

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("CorporateClient");
    
    QQuickStyle::setStyle("Material");
    
    QQmlApplicationEngine engine;
    
    // Регистрируем мост для QML
    AppBridge bridge;
    engine.rootContext()->setContextProperty("appBridge", &bridge);
    
    // Загружаем QML из ресурсов
    engine.load(QUrl("qrc:/qml/main.qml"));
    
    if (engine.rootObjects().isEmpty()) {
        qDebug() << "Failed to load QML";
        return -1;
    }
    
    return app.exec();
}

#include "main.moc"
