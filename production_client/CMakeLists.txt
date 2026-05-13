cmake_minimum_required(VERSION 3.16)
project(ProductionClient)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Network Qml Quick QuickControls2)

# Добавляем ресурсы
set(CMAKE_AUTORCC_SOURCE_FILES resources.qrc)

# Создаём QML модуль
qt_add_qml_module(ProductionClient
    URI ProductionClient
    VERSION 1.0
    QML_FILES
        qml/main.qml
)

# Создаём исполняемый файл
add_executable(ProductionClientApp
    main.cpp
    resources.qrc
)

target_link_libraries(ProductionClientApp
    PRIVATE
        ProductionClient
        UsersServiceClient
        Qt6::Core
        Qt6::Network
        Qt6::Qml
        Qt6::Quick
        Qt6::QuickControls2
)

target_include_directories(ProductionClientApp PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/common/include
)

install(TARGETS ProductionClientApp
    RUNTIME DESTINATION bin
)
