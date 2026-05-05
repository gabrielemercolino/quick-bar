import QtQuick
import qs
import qs.Services.Window

Item {
    visible: WindowService.hasWindow
    implicitWidth: text.implicitWidth + 20
    implicitHeight: text.implicitHeight + 18

    Rectangle {
        anchors.fill: parent
        color: Settings.styles.windowTitle.background
        radius: 16
    }

    Text {
        id: text
        anchors.centerIn: parent
        text: WindowService.title
        color: Settings.styles.windowTitle.foreground
        font.pixelSize: Settings.styles.windowTitle.fontSize
        font.bold: true
    }
}
