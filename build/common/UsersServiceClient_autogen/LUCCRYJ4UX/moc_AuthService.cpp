/****************************************************************************
** Meta object code from reading C++ file 'AuthService.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.11.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../common/include/userserviceclient/AuthService.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'AuthService.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.11.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN12UsersService11AuthServiceE_t {};
} // unnamed namespace

template <> constexpr inline auto UsersService::AuthService::qt_create_metaobjectdata<qt_meta_tag_ZN12UsersService11AuthServiceE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "UsersService::AuthService",
        "loginCompleted",
        "",
        "AuthResult",
        "result",
        "tokenRefreshed",
        "newAccessToken",
        "newRefreshToken",
        "passwordChanged",
        "success",
        "message",
        "passwordReset",
        "passwordExpiryInfo",
        "daysRemaining",
        "isExpired",
        "expiresAt",
        "profileFetched",
        "UserProfile",
        "profile",
        "statusFetched",
        "QJsonObject",
        "status",
        "sessionExpired"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'loginCompleted'
        QtMocHelpers::SignalData<void(const AuthResult &)>(1, 2, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 3, 4 },
        }}),
        // Signal 'tokenRefreshed'
        QtMocHelpers::SignalData<void(const QString &, const QString &)>(5, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 6 }, { QMetaType::QString, 7 },
        }}),
        // Signal 'passwordChanged'
        QtMocHelpers::SignalData<void(bool, const QString &)>(8, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 9 }, { QMetaType::QString, 10 },
        }}),
        // Signal 'passwordReset'
        QtMocHelpers::SignalData<void(bool, const QString &)>(11, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 9 }, { QMetaType::QString, 10 },
        }}),
        // Signal 'passwordExpiryInfo'
        QtMocHelpers::SignalData<void(int, bool, const QString &)>(12, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 13 }, { QMetaType::Bool, 14 }, { QMetaType::QString, 15 },
        }}),
        // Signal 'profileFetched'
        QtMocHelpers::SignalData<void(const UserProfile &)>(16, 2, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 17, 18 },
        }}),
        // Signal 'statusFetched'
        QtMocHelpers::SignalData<void(const QJsonObject &)>(19, 2, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 20, 21 },
        }}),
        // Signal 'sessionExpired'
        QtMocHelpers::SignalData<void()>(22, 2, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<AuthService, qt_meta_tag_ZN12UsersService11AuthServiceE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject UsersService::AuthService::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12UsersService11AuthServiceE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12UsersService11AuthServiceE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN12UsersService11AuthServiceE_t>.metaTypes,
    nullptr
} };

void UsersService::AuthService::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<AuthService *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->loginCompleted((*reinterpret_cast<std::add_pointer_t<AuthResult>>(_a[1]))); break;
        case 1: _t->tokenRefreshed((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QString>>(_a[2]))); break;
        case 2: _t->passwordChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QString>>(_a[2]))); break;
        case 3: _t->passwordReset((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QString>>(_a[2]))); break;
        case 4: _t->passwordExpiryInfo((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<QString>>(_a[3]))); break;
        case 5: _t->profileFetched((*reinterpret_cast<std::add_pointer_t<UserProfile>>(_a[1]))); break;
        case 6: _t->statusFetched((*reinterpret_cast<std::add_pointer_t<QJsonObject>>(_a[1]))); break;
        case 7: _t->sessionExpired(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (AuthService::*)(const AuthResult & )>(_a, &AuthService::loginCompleted, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (AuthService::*)(const QString & , const QString & )>(_a, &AuthService::tokenRefreshed, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (AuthService::*)(bool , const QString & )>(_a, &AuthService::passwordChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (AuthService::*)(bool , const QString & )>(_a, &AuthService::passwordReset, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (AuthService::*)(int , bool , const QString & )>(_a, &AuthService::passwordExpiryInfo, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (AuthService::*)(const UserProfile & )>(_a, &AuthService::profileFetched, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (AuthService::*)(const QJsonObject & )>(_a, &AuthService::statusFetched, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (AuthService::*)()>(_a, &AuthService::sessionExpired, 7))
            return;
    }
}

const QMetaObject *UsersService::AuthService::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *UsersService::AuthService::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12UsersService11AuthServiceE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int UsersService::AuthService::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 8;
    }
    return _id;
}

// SIGNAL 0
void UsersService::AuthService::loginCompleted(const AuthResult & _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 0, nullptr, _t1);
}

// SIGNAL 1
void UsersService::AuthService::tokenRefreshed(const QString & _t1, const QString & _t2)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 1, nullptr, _t1, _t2);
}

// SIGNAL 2
void UsersService::AuthService::passwordChanged(bool _t1, const QString & _t2)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 2, nullptr, _t1, _t2);
}

// SIGNAL 3
void UsersService::AuthService::passwordReset(bool _t1, const QString & _t2)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 3, nullptr, _t1, _t2);
}

// SIGNAL 4
void UsersService::AuthService::passwordExpiryInfo(int _t1, bool _t2, const QString & _t3)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 4, nullptr, _t1, _t2, _t3);
}

// SIGNAL 5
void UsersService::AuthService::profileFetched(const UserProfile & _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 5, nullptr, _t1);
}

// SIGNAL 6
void UsersService::AuthService::statusFetched(const QJsonObject & _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 6, nullptr, _t1);
}

// SIGNAL 7
void UsersService::AuthService::sessionExpired()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}
QT_WARNING_POP
