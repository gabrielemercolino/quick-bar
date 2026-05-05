import QtQuick
import Quickshell.Hyprland

WorkspacesBackend {
    workspaceIds: {
        const ids = Hyprland.workspaces.values.map(ws => ws.id);

        if (ids.length === 0)
            return [];

        return Array.from({
            length: Math.max(...ids)
        }, (_, i) => i + 1);
    }

    focusedId: Hyprland.focusedWorkspace?.id ?? -1

    function switchTo(id) {
        Hyprland.dispatch(`workspace ${id}`);
    }
}
