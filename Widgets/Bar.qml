import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.Widgets

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root
        required property var modelData
        screen: modelData
        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.margins.top: 4

        implicitHeight: Math.max(leftSection.implicitHeight, rightSection.implicitHeight) + 8

        Item {
            anchors.fill: parent
            anchors.margins: 4

            RowLayout {
                id: leftSection
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                spacing: 8
            }

            RowLayout {
                anchors {
                    centerIn: parent
                }
                spacing: 8
            }

            RowLayout {
                id: rightSection
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                spacing: 8
                ClockWidget {}
            }
        }
    }
}
