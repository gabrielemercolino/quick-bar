import QtQuick
import Quickshell.Hyprland

WindowBackend {
    id: root

    readonly property var toplevel: Hyprland.activeToplevel
    readonly property var workspace: Hyprland.focusedWorkspace

    appId: toplevel?.lastIpcObject?.class ?? ""
    hasWindow: workspace?.toplevels.values.length !== 0 && title.length > 0

    property string _title: ""
    title: _title

    Component.onCompleted: {
        Hyprland.rawEvent.connect(onRawEvent);
        Hyprland.refreshToplevels();
    }

    function onRawEvent(event) {
        const relevant = ["openlayer", "closelayer", "openwindow", "closewindow", "windowtitle", "windowtitlev2", "urgent", "activewindow", "activewindowv2", "workspace"];

        if (relevant.includes(event.name)) {
            Hyprland.refreshToplevels();
            const initialTitle = root.toplevel?.lastIpcObject?.initialTitle;
            root._title = initialTitle ?? "";
        }
    }
}
