import QtQuick
import qs.Services.Window

Item {
    id: root

    visible: WindowService.hasWindow
    implicitWidth: visible ? row.implicitWidth + 20 : 0
    implicitHeight: row.implicitHeight + 18

    Rectangle {
        anchors.fill: parent
        color: "white"
        radius: 10
    }

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 6

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: WindowService.title
        }
    }
}
