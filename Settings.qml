pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property var config: ({}) // will contain settings from the parsed config file

    property var locale: Qt.locale(config?.locale ?? "it_IT")

    property string base00: palette("base00") ?? "#1a141f"
    property string base01: palette("base01") ?? "#2a1e3b"
    property string base02: palette("base02") ?? "#3d2a52"
    property string base03: palette("base03") ?? "#544167"
    property string base04: palette("base04") ?? "#75658b"
    property string base05: palette("base05") ?? "#cfc0d9"
    property string base06: palette("base06") ?? "#e5dced"
    property string base07: palette("base07") ?? "#f4f0f7"
    property string base08: palette("base08") ?? "#ea6d9c"
    property string base09: palette("base09") ?? "#e89368"
    property string base0A: palette("base0A") ?? "#d4ac76"
    property string base0B: palette("base0B") ?? "#7abf9e"
    property string base0C: palette("base0C") ?? "#70b8d4"
    property string base0D: palette("base0D") ?? "#7b93db"
    property string base0E: palette("base0E") ?? "#b88cce"
    property string base0F: palette("base0F") ?? "#e87d9a"

    property var styles: QtObject {
        property var windowTitle: QtObject {
            property var background: root.widgetConfig("windowTitle", "background") ?? root.base01
            property var foreground: root.widgetConfig("windowTitle", "foreground") ?? root.base05
            property var fontSize: root.widgetConfig("windowTitle", "fontSize") ?? 14
        }

        property var workspaces: QtObject {
            property var background: root.widgetConfig("workspaces", "background") ?? root.base01
            property var button: QtObject {
                property var background: QtObject {
                    property var active: root.widgetConfig("workspaces", "button.background.active") ?? root.base05
                    property var inactive: root.widgetConfig("workspaces", "button.background.inactive") ?? "transparent"
                }
                property var foreground: QtObject {
                    property var active: root.widgetConfig("workspaces", "button.foreground.active") ?? root.base01
                    property var inactive: root.widgetConfig("workspaces", "button.foreground.inactive") ?? root.base05
                }
            }
        }

        property var time: QtObject {
            property var background: root.widgetConfig("time", "background") ?? root.base01
            property var date: QtObject {
                property var foreground: QtObject {
                    property var normal: root.widgetConfig("time", "date.foreground.normal") ?? root.base0E
                    property var hover: root.widgetConfig("time", "date.foreground.hover") ?? root.base08
                }
            }
            property var clock: QtObject {
                property var foreground: QtObject {
                    property var normal: root.widgetConfig("time", "clock.foreground.normal") ?? root.base0E
                    property var hover: root.widgetConfig("time", "clock.foreground.hover") ?? root.base08
                }
            }
            property var calendar: QtObject {
                property var background: root.widgetConfig("time", "calendar.background") ?? root.base01
                property var header: QtObject {
                    property var foreground: root.widgetConfig("time", "calendar.header.foreground") ?? root.base0E
                    property var background: root.widgetConfig("time", "calendar.header.background") ?? root.base00
                    property var button: QtObject {
                        property var foreground: QtObject {
                            property var normal: root.widgetConfig("time", "calendar.header.foreground.normal") ?? root.base0E
                            property var hover: root.widgetConfig("time", "calendar.header.foreground.hover") ?? root.base08
                        }
                    }
                }
                property var week: QtObject {
                    property var foreground: root.widgetConfig("time", "calendar.header.foreground") ?? root.base05
                }
                property var day: QtObject {
                    property var background: QtObject {
                        property var normal: root.widgetConfig("time", "calendar.day.background.normal") ?? "transparent"
                        property var current: root.widgetConfig("time", "calendar.day.background.current") ?? root.base0E
                    }
                    property var foreground: QtObject {
                        property var normal: root.widgetConfig("time", "calendar.day.foreground.normal") ?? root.base05
                        property var current: root.widgetConfig("time", "calendar.day.foreground.current") ?? root.base01
                    }
                }
            }
        }
    }

    function widgetConfig(widgetName, path) {
        var parts = path.split(".");
        var obj = config?.widgets?.[widgetName];
        for (var i = 0; i < parts.length; i++) {
            if (!obj)
                return undefined;
            obj = obj[parts[i]];
        }
        return obj;
    }

    function palette(color) {
        return config?.palette?.[color];
    }

    Component.onCompleted: {
        // TODO: actually load from file
    }
}
