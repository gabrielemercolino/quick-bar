import QtQuick
import QtQuick.Layouts
import qs.Services.Workspaces

Item {
    implicitWidth: row.implicitWidth + 8
    implicitHeight: row.implicitHeight + 6

    Rectangle {
        anchors.fill: parent
        color: "white"
        radius: 10
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 4

        Repeater {
            model: WorkspacesService.workspaceIds

            delegate: Item {
                required property int modelData
                readonly property bool active: WorkspacesService.focusedId === modelData

                implicitWidth: textLabel.implicitWidth + 28
                implicitHeight: textLabel.implicitHeight + 16

                HoverHandler {
                    id: hoverHandler
                }

                Rectangle {
                    anchors.fill: parent
                    radius: 10
                    color: (parent.active || hoverHandler.hovered) ? "#333" : "transparent"
                    Behavior on color {
                        ColorAnimation {
                            duration: 150
                        }
                    }
                }

                Text {
                    id: textLabel
                    anchors.centerIn: parent
                    text: parent.modelData
                    color: (parent.active || hoverHandler.hovered) ? "white" : "#666"
                    font.pixelSize: 14
                    font.weight: Font.DemiBold
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: WorkspacesService.switchTo(parent.modelData)
                }
            }
        }
    }
}
