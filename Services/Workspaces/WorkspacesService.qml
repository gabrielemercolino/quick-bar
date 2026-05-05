pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property WorkspacesBackend backendItem: backend.item as WorkspacesBackend

    readonly property var workspaceIds: backendItem?.workspaceIds ?? []
    readonly property int focusedId: backendItem?.focusedId ?? -1

    function switchTo(id) {
        backendItem?.switchTo(id);
    }

    Loader {
        id: backend
        Component.onCompleted: {
            const hyprland = Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE");
            if (hyprland && hyprland.length > 0)
                source = Qt.resolvedUrl("HyprlandBackend.qml");
            else
                console.warn("WorkspacesService: no supported compositor detected");
        }
    }
}
