import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs
import qs.Services
import qs.Popups.Calendar

Item {
    id: root

    property var style: Settings.styles.time

    implicitWidth: timeArea.implicitWidth
    implicitHeight: timeArea.implicitHeight

    Rectangle {
        anchors.fill: parent
        color: root.style.background
        radius: 16
    }

    MouseArea {
        id: timeArea

        anchors.centerIn: parent
        implicitWidth: timeRow.implicitWidth + 26
        implicitHeight: timeRow.implicitHeight + 14

        cursorShape: Qt.PointingHandCursor
        onClicked: {
            calPopup.visible = !calPopup.visible;
            focusGrab.active = calPopup.visible;
        }

        HoverHandler {
            id: hoverHandler
        }

        RowLayout {
            id: timeRow

            property var dateFg: hoverHandler.hovered ? root.style.date.foreground.hover : root.style.date.foreground.normal
            property var clockFg: hoverHandler.hovered ? root.style.clock.foreground.hover : root.style.clock.foreground.normal

            anchors.centerIn: parent
            spacing: 6

            Text {
                color: parent.dateFg
                text: "󰸘"
            }
            Text {
                color: parent.dateFg
                text: Settings.locale.toString(TimeService.now, "ddd d MMM")
            }
            Text {
                color: parent.clockFg
                text: ""
            }
            Text {
                color: parent.clockFg
                text: Settings.locale.toString(TimeService.now, "hh:mm")
                font.bold: true
            }
        }
    }

    CalendarPopup {
        id: calPopup
        anchorItem: timeArea
    }

    HyprlandFocusGrab {
        id: focusGrab
        windows: [calPopup]
        onCleared: {
            calPopup.visible = false;
            focusGrab.active = false;
        }
    }
}
