cmake_minimum_required(VERSION 3.16)
project(ProductionClient)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED 
    COMPONENTS 
        Core 
        Network 
        Qml 
        Quick 
        QuickControls2
)

# НЕ ДОБАВЛЯЕМ common здесь - он уже добавлен в корневом CMakeLists.txt

# Устанавливаем политики Qt
qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

# Регистрируем QML модуль
qt_add_qml_module(ProductionClient
    URI ProductionClient
    VERSION 1.0
    QML_FILES
        qml/main.qml
        qml/windows/AuthWindow.qml
        qml/windows/MainWindow.qml
        qml/windows/SplashScreen.qml
        qml/components/UserInfoPanel.qml
        qml/components/ProjectRolesList.qml
        qml/components/MastergraphStatusCard.qml
        qml/components/OfflineIndicator.qml
        qml/components/PasswordExpiryWarning.qml
        qml/components/ToastNotification.qml
        qml/components/LoadingSpinner.qml
        qml/dialogs/UpdateNotification.qml
        qml/dialogs/ChangePasswordDialog.qml
        qml/dialogs/ConfirmDialog.qml
        qml/dialogs/ErrorDialog.qml
        qml/styles/AppStyle.qml
        qml/styles/Colors.qml
        qml/styles/Typography.qml
        qml/styles/Button.qml
        qml/views/DashboardView.qml
        qml/views/ProjectsView.qml
        qml/views/MastergraphView.qml
        qml/views/SettingsView.qml
        qml/delegates/ProjectDelegate.qml
        qml/delegates/RoleDelegate.qml
        qml/delegates/MastergraphDelegate.qml
        qml/utils/DateUtils.qml
        qml/utils/StringUtils.qml
        qml/utils/Validators.qml
)

# Создаём ИСПОЛНЯЕМЫЙ файл с явным указанием main.cpp
add_executable(ProductionClientExec
    main.cpp
)

# Добавляем остальные исходники
target_sources(ProductionClientExec PRIVATE
    src/core/AppCore.cpp
    src/core/ConfigManager.cpp
    src/core/CacheManager.cpp
    src/qml_bridge/AuthBridge.cpp
    src/qml_bridge/MainWindowBridge.cpp
    src/qml_bridge/NotificationBridge.cpp
)

# Линкуем
target_link_libraries(ProductionClientExec
    PRIVATE
        ProductionClient
        UsersServiceClient
        Qt6::Core
        Qt6::Network
        Qt6::Qml
        Qt6::Quick
        Qt6::QuickControls2
)

# Добавляем include директории
target_include_directories(ProductionClientExec PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/src
    ${CMAKE_SOURCE_DIR}/common/include
)

# Устанавливаем свойства
set_target_properties(ProductionClientExec PROPERTIES
    OUTPUT_NAME ProductionClient
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE
)

# Копируем QML файлы
add_custom_command(TARGET ProductionClientExec POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_CURRENT_SOURCE_DIR}/qml
        ${CMAKE_CURRENT_BINARY_DIR}/qml
    COMMENT "Copying QML files to build directory"
)

install(TARGETS ProductionClientExec
    RUNTIME DESTINATION bin
    BUNDLE DESTINATION .
)
