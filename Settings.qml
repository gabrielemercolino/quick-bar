pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property var config: ({}) // will contain settings from the parsed config file

    property var locale: Qt.locale(config?.locale ?? "it_IT")

    property string base00: palette("base00") ?? "#1a1b26"
    property string base01: palette("base01") ?? "#16161e"
    property string base02: palette("base02") ?? "#2f3549"
    property string base03: palette("base03") ?? "#444b6a"
    property string base04: palette("base04") ?? "#787c99"
    property string base05: palette("base05") ?? "#a9b1d6"
    property string base06: palette("base06") ?? "#cbccd1"
    property string base07: palette("base07") ?? "#d5d6db"
    property string base08: palette("base08") ?? "#f7768e"
    property string base09: palette("base09") ?? "#ff9e64"
    property string base0A: palette("base0A") ?? "#e0af68"
    property string base0B: palette("base0B") ?? "#9ece6a"
    property string base0C: palette("base0C") ?? "#73daca"
    property string base0D: palette("base0D") ?? "#7aa2f7"
    property string base0E: palette("base0E") ?? "#bb9af7"
    property string base0F: palette("base0F") ?? "#ff007c"

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
