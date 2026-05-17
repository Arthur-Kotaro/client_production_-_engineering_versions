cmake_minimum_required(VERSION 3.16)
project(UsersServiceClientLib VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package(Qt6 REQUIRED COMPONENTS Core Network)

# Заголовки для MOC (должны быть перечислены)
set(HEADERS
    include/userserviceclient/ApiClient.h
    include/userserviceclient/AuthService.h
    include/userserviceclient/TokenManager.h
    include/userserviceclient/UserDataModels.h
    include/userserviceclient/UsersServiceClient_global.h
)

# Создаём статическую библиотеку
add_library(UsersServiceClient STATIC ${HEADERS})

target_sources(UsersServiceClient PRIVATE
    src/UserProfile.cpp
    src/ApiClient.cpp
    src/AuthService.cpp
    src/TokenManager.cpp
    src/UserDataModels.cpp
)

target_include_directories(UsersServiceClient
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)

target_link_libraries(UsersServiceClient
    PUBLIC
        Qt6::Core
        Qt6::Network
    PRIVATE
        Threads::Threads
)

if(WIN32)
    target_compile_definitions(UsersServiceClient PRIVATE USERSERVICECLIENT_LIBRARY)
endif()

if(UNIX AND NOT APPLE)
    find_package(OpenSSL QUIET)
    if(OPENSSL_FOUND)
        target_link_libraries(UsersServiceClient PRIVATE ${OPENSSL_LIBRARIES})
    endif()
endif()
target_sources(UsersServiceClient PRIVATE
    src/UserProfile.cpp
    moc_AuthService.cpp
    moc_ApiClient.cpp
)

# Add manually generated moc files
target_sources(UsersServiceClient PRIVATE
    src/UserProfile.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/moc_AuthService.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/moc_ApiClient.cpp
)

# Add manually generated moc files for Qt6
target_sources(UsersServiceClient PRIVATE
    src/UserProfile.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/moc_AuthService.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/moc_ApiClient.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/moc_TokenManager.cpp
)
