pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs
import qs.Services

MonthGrid {
    id: root

    Layout.fillWidth: true
    month: TimeService.now.getMonth()
    year: TimeService.now.getFullYear()
    locale: Settings.locale

    delegate: Item {
        required property var model
        required property int month

        property var style: Settings.styles.time.calendar.day

        implicitWidth: textLabel.implicitWidth
        implicitHeight: textLabel.implicitHeight + 8

        HoverHandler {
            id: hoverHandler
        }

        Rectangle {
            anchors.fill: parent
            radius: 8
            color: parent.model.today ? parent.style.background.current : parent.style.background.normal
            border {
                color: (hoverHandler.hovered && parent.month === root.month) ? parent.style.background.current : "transparent"
                width: 2
            }
        }

        Text {
            id: textLabel

            anchors.centerIn: parent
            text: parent.model.day
            color: parent.model.today ? parent.style.foreground.current : parent.style.foreground.normal
            opacity: parent.month === root.month ? 1 : 0.3
            font.bold: parent.model.today
        }
    }
}
