import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs
import qs.Services
import qs.Popups.Calendar

Item {
    implicitWidth: dateArea.implicitWidth
    implicitHeight: dateArea.implicitHeight

    Rectangle {
        anchors.fill: parent
        color: "white"
        radius: 10
    }

    MouseArea {
        id: dateArea
        anchors.centerIn: parent
        implicitWidth: dateRow.implicitWidth + 20
        implicitHeight: dateRow.implicitHeight + 18
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            calPopup.visible = !calPopup.visible;
            focusGrab.active = calPopup.visible;
        }

        RowLayout {
            id: dateRow
            anchors.centerIn: parent
            spacing: 6

            Text {
                text: "󰸘"
            }
            Text {
                text: Settings.locale.toString(TimeService.now, "ddd d MMM")
            }
            Text {
                text: ""
            }
            Text {
                text: Settings.locale.toString(TimeService.now, "hh:mm")
                font.bold: true
            }
        }
    }

    CalendarPopup {
        id: calPopup
        anchorItem: dateArea
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
