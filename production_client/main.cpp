#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QDebug>
#include <memory>

#include "userserviceclient/ApiClient.h"
#include "userserviceclient/AuthService.h"
#include "src/qml_bridge/AuthBridge.h"
#include "src/qml_bridge/MainWindowBridge.h"

using namespace UsersService;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("CorporateClient");
    
    QQuickStyle::setStyle("Material");
    
    QQmlApplicationEngine engine;
    
    // Создаём API клиент
    auto apiClient = std::make_shared<ApiClient>();
    
    // Настройка подключения к серверу (запущен через uvicorn)
    // Сервер доступен на всех интерфейсах (0.0.0.0), порт 8000
    apiClient->setServerUrl("localhost", 8000);  // Для локального подключения
    // apiClient->setServerUrl("127.0.0.1", 8000);  // Альтернативный вариант
    
    qDebug() << "Connecting to User Service at localhost:8000";
    
    // Создаём Auth сервис
    auto authService = std::make_shared<AuthService>(apiClient);
    
    // Создаём мосты для QML
    AuthBridge authBridge(authService);
    MainWindowBridge mainWindowBridge(authService);
    
    // Регистрируем объекты в QML
    engine.rootContext()->setContextProperty("authBridge", &authBridge);
    engine.rootContext()->setContextProperty("mainWindowBridge", &mainWindowBridge);
    
    // Загружаем QML
    engine.load(QUrl("qrc:/ProductionClient/qml/main.qml"));
    
    if (engine.rootObjects().isEmpty()) {
        qDebug() << "Failed to load QML";
        return -1;
    }
    
    return app.exec();
}
