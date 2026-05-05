import QtQuick
import QtQuick.Layouts
import qs
import qs.Services.Workspaces

Item {
    implicitWidth: row.implicitWidth + 10
    implicitHeight: row.implicitHeight + 10

    Rectangle {
        anchors.fill: parent
        color: Settings.styles.workspaces.background
        radius: 16
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 4

        Repeater {
            model: WorkspacesService.workspaceIds

            delegate: Item {
                id: button

                required property int modelData
                readonly property bool active: WorkspacesService.focusedId === modelData

                property var style: Settings.styles.workspaces.button

                implicitWidth: textLabel.implicitWidth + 22
                implicitHeight: textLabel.implicitHeight + 10

                HoverHandler {
                    id: hoverHandler
                }

                Rectangle {
                    anchors.fill: parent
                    radius: 10
                    color: (parent.active || hoverHandler.hovered) ? button.style.background.active : button.style.background.inactive

                    Behavior on color {
                        ColorAnimation {
                            duration: 100
                        }
                    }
                }

                Text {
                    id: textLabel
                    anchors.centerIn: parent
                    text: parent.modelData
                    color: (parent.active || hoverHandler.hovered) ? button.style.foreground.active : button.style.foreground.inactive
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
