/****************************************************************************
** Meta object code from reading C++ file 'MainWindowBridge.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.11.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../production_client/src/qml_bridge/MainWindowBridge.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'MainWindowBridge.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN16MainWindowBridgeE_t {};
} // unnamed namespace

template <> constexpr inline auto MainWindowBridge::qt_create_metaobjectdata<qt_meta_tag_ZN16MainWindowBridgeE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "MainWindowBridge",
        "userDataChanged",
        "",
        "passwordExpiryChanged",
        "passwordChangeCompleted",
        "success",
        "message",
        "logoutCompleted",
        "onProfileFetched",
        "UsersService::UserProfile",
        "profile",
        "onPasswordExpiryInfo",
        "daysRemaining",
        "isExpired",
        "expiresAt",
        "onPasswordChanged",
        "onSessionExpired",
        "changePassword",
        "currentPassword",
        "newPassword",
        "logout",
        "checkPasswordExpiry",
        "userName",
        "userEmail",
        "userPosition",
        "userRole",
        "passwordDaysLeft",
        "passwordExpired",
        "projects",
        "QVariantList",
        "widgetsPath"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'userDataChanged'
        QtMocHelpers::SignalData<void()>(1, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'passwordExpiryChanged'
        QtMocHelpers::SignalData<void()>(3, 2, QMC::AccessPublic, QMetaType::Void),
        // Signal 'passwordChangeCompleted'
        QtMocHelpers::SignalData<void(bool, const QString &)>(4, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 5 }, { QMetaType::QString, 6 },
        }}),
        // Signal 'logoutCompleted'
        QtMocHelpers::SignalData<void()>(7, 2, QMC::AccessPublic, QMetaType::Void),
        // Slot 'onProfileFetched'
        QtMocHelpers::SlotData<void(const UsersService::UserProfile &)>(8, 2, QMC::AccessPrivate, QMetaType::Void, {{
            { 0x80000000 | 9, 10 },
        }}),
        // Slot 'onPasswordExpiryInfo'
        QtMocHelpers::SlotData<void(int, bool, const QString &)>(11, 2, QMC::AccessPrivate, QMetaType::Void, {{
            { QMetaType::Int, 12 }, { QMetaType::Bool, 13 }, { QMetaType::QString, 14 },
        }}),
        // Slot 'onPasswordChanged'
        QtMocHelpers::SlotData<void(bool, const QString &)>(15, 2, QMC::AccessPrivate, QMetaType::Void, {{
            { QMetaType::Bool, 5 }, { QMetaType::QString, 6 },
        }}),
        // Slot 'onSessionExpired'
        QtMocHelpers::SlotData<void()>(16, 2, QMC::AccessPrivate, QMetaType::Void),
        // Method 'changePassword'
        QtMocHelpers::MethodData<void(const QString &, const QString &)>(17, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 18 }, { QMetaType::QString, 19 },
        }}),
        // Method 'logout'
        QtMocHelpers::MethodData<void()>(20, 2, QMC::AccessPublic, QMetaType::Void),
        // Method 'checkPasswordExpiry'
        QtMocHelpers::MethodData<void()>(21, 2, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'userName'
        QtMocHelpers::PropertyData<QString>(22, QMetaType::QString, QMC::DefaultPropertyFlags, 0),
        // property 'userEmail'
        QtMocHelpers::PropertyData<QString>(23, QMetaType::QString, QMC::DefaultPropertyFlags, 0),
        // property 'userPosition'
        QtMocHelpers::PropertyData<QString>(24, QMetaType::QString, QMC::DefaultPropertyFlags, 0),
        // property 'userRole'
        QtMocHelpers::PropertyData<QString>(25, QMetaType::QString, QMC::DefaultPropertyFlags, 0),
        // property 'passwordDaysLeft'
        QtMocHelpers::PropertyData<int>(26, QMetaType::Int, QMC::DefaultPropertyFlags, 1),
        // property 'passwordExpired'
        QtMocHelpers::PropertyData<bool>(27, QMetaType::Bool, QMC::DefaultPropertyFlags, 1),
        // property 'projects'
        QtMocHelpers::PropertyData<QVariantList>(28, 0x80000000 | 29, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 0),
        // property 'widgetsPath'
        QtMocHelpers::PropertyData<QString>(30, QMetaType::QString, QMC::DefaultPropertyFlags, 0),
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<MainWindowBridge, qt_meta_tag_ZN16MainWindowBridgeE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject MainWindowBridge::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN16MainWindowBridgeE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN16MainWindowBridgeE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN16MainWindowBridgeE_t>.metaTypes,
    nullptr
} };

void MainWindowBridge::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<MainWindowBridge *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->userDataChanged(); break;
        case 1: _t->passwordExpiryChanged(); break;
        case 2: _t->passwordChangeCompleted((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QString>>(_a[2]))); break;
        case 3: _t->logoutCompleted(); break;
        case 4: _t->onProfileFetched((*reinterpret_cast<std::add_pointer_t<UsersService::UserProfile>>(_a[1]))); break;
        case 5: _t->onPasswordExpiryInfo((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<QString>>(_a[3]))); break;
        case 6: _t->onPasswordChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QString>>(_a[2]))); break;
        case 7: _t->onSessionExpired(); break;
        case 8: _t->changePassword((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QString>>(_a[2]))); break;
        case 9: _t->logout(); break;
        case 10: _t->checkPasswordExpiry(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (MainWindowBridge::*)()>(_a, &MainWindowBridge::userDataChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (MainWindowBridge::*)()>(_a, &MainWindowBridge::passwordExpiryChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (MainWindowBridge::*)(bool , const QString & )>(_a, &MainWindowBridge::passwordChangeCompleted, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (MainWindowBridge::*)()>(_a, &MainWindowBridge::logoutCompleted, 3))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QString*>(_v) = _t->userName(); break;
        case 1: *reinterpret_cast<QString*>(_v) = _t->userEmail(); break;
        case 2: *reinterpret_cast<QString*>(_v) = _t->userPosition(); break;
        case 3: *reinterpret_cast<QString*>(_v) = _t->userRole(); break;
        case 4: *reinterpret_cast<int*>(_v) = _t->passwordDaysLeft(); break;
        case 5: *reinterpret_cast<bool*>(_v) = _t->passwordExpired(); break;
        case 6: *reinterpret_cast<QVariantList*>(_v) = _t->projects(); break;
        case 7: *reinterpret_cast<QString*>(_v) = _t->widgetsPath(); break;
        default: break;
        }
    }
}

const QMetaObject *MainWindowBridge::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainWindowBridge::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN16MainWindowBridgeE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MainWindowBridge::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 11;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}

// SIGNAL 0
void MainWindowBridge::userDataChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void MainWindowBridge::passwordExpiryChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void MainWindowBridge::passwordChangeCompleted(bool _t1, const QString & _t2)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 2, nullptr, _t1, _t2);
}

// SIGNAL 3
void MainWindowBridge::logoutCompleted()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
