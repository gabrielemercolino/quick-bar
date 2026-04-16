pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property var locale: Qt.locale("it_IT") // TODO: make it configurable externally
}
