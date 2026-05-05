import QtQuick
import QtQuick.Controls
import qs

Button {
    id: control

    property var style: Settings.styles.time.calendar.header
    property string foreground: style.button.foreground.normal
    property string hover: style.button.foreground.hover

    flat: true
    implicitWidth: contentItem.implicitWidth + 8

    contentItem: Text {
        anchors.centerIn: control
        text: control.text
        color: hoverHandler.hovered ? control.hover : control.foreground

        HoverHandler {
            id: hoverHandler
        }
    }

    background.opacity: 0
}
