pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property WindowBackend backendItem: backend.item as WindowBackend

    readonly property string title: backendItem?.title ?? ""
    readonly property string appId: backendItem?.appId ?? ""
    readonly property bool hasWindow: backendItem?.hasWindow ?? false

    Loader {
        id: backend
        Component.onCompleted: {
            const hyprland = Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE");

            if (hyprland && hyprland.length > 0)
                source = Qt.resolvedUrl("HyprlandBackend.qml");
            else
                console.warn("WindowService: no supported compositor detected");
        }
    }
}
