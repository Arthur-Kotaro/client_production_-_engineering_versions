pragma Singleton
import QtQuick 6.0

QtObject {
    // Основные цвета (тёмная тема с высоким контрастом)
    readonly property color primary: "#0D47A1"        // Тёмно-синий (основной)
    readonly property color primaryDark: "#0A3A8A"    // Ещё темнее для нажатий
    readonly property color primaryLight: "#1565C0"   // Светлее для hover
    readonly property color accent: "#FF5722"         // Ярко-оранжевый акцент
    
    // Фоновые цвета
    readonly property color background: "#121212"     // Тёмный фон
    readonly property color surface: "#1E1E1E"        // Поверхности
    readonly property color surfaceVariant: "#2D2D2D"  // Альтернативная поверхность
    
    // Текст
    readonly property color text: "#FFFFFF"           // Белый текст
    readonly property color textSecondary: "#B0B0B0"  // Светло-серый
    readonly property color textHint: "#757575"       // Подсказки
    
    // Поля ввода
    readonly property color inputBackground: "#2C2C2C"  // Фон полей ввода
    readonly property color inputBorder: "#555555"      // Граница полей ввода
    readonly property color inputBorderFocus: "#2196F3" // Граница при фокусе
    readonly property color inputText: "#FFFFFF"        // Текст в полях ввода
    
    // Кнопки
    readonly property color buttonBackground: "#0D47A1"    // Фон кнопки
    readonly property color buttonText: "#FFFFFF"          // Текст кнопки
    readonly property color buttonHover: "#1565C0"         // При наведении
    readonly property color buttonPressed: "#0A3A8A"       // При нажатии
    readonly property color buttonDisabled: "#424242"      // Неактивная кнопка
    
    // Статусы
    readonly property color error: "#FF5252"          // Ярко-красный для ошибок
    readonly property color warning: "#FFC107"        // Жёлтый для предупреждений
    readonly property color success: "#4CAF50"        // Зелёный для успеха
    readonly property color info: "#2196F3"           // Синий для информации
    
    // Контейнеры для статусов (с повышенной контрастностью)
    readonly property color errorContainer: "#B71C1C"   // Тёмно-красный
    readonly property color warningContainer: "#FF8F00" // Тёмно-оранжевый
    readonly property color successContainer: "#1B5E20" // Тёмно-зелёный
    readonly property color infoContainer: "#0D47A1"    // Тёмно-синий
    
    // Текст на контейнерах статусов
    readonly property color onErrorContainer: "#FFFFFF"
    readonly property color onWarningContainer: "#000000"
    readonly property color onSuccessContainer: "#FFFFFF"
    readonly property color onInfoContainer: "#FFFFFF"
    
    // Разделители и границы
    readonly property color divider: "#404040"
    readonly property color border: "#555555"
    
    // Hover эффекты
    readonly property color hoverOverlay: "#30FFFFFF"
    readonly property color pressedOverlay: "#20FFFFFF"
}
