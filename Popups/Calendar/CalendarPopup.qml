import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import qs
import qs.Services

PopupWindow {
    id: calPopup
    visible: false

    required property var anchorItem

    anchor.item: anchorItem
    anchor.rect.x: (anchorItem.width - implicitWidth) / 2
    anchor.rect.y: anchorItem.height

    implicitWidth: 300
    implicitHeight: calLayout.implicitHeight + 16

    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: Settings.styles.time.calendar.background
        radius: 16
    }

    ColumnLayout {
        id: calLayout
        anchors {
            fill: parent
            margins: 8
        }
        spacing: 4

        Rectangle {
            radius: 8
            color: Settings.styles.time.calendar.header.background
            Layout.fillWidth: true
            implicitHeight: controls.implicitHeight + 10

            CalendarControls {
                id: controls

                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    leftMargin: 8
                    rightMargin: 8
                }

                month: grid.month
                year: grid.year
                onMonthChangeRequested: month => grid.month = month
                onYearChangeRequested: year => grid.year = year
                onResetRequested: {
                    grid.year = TimeService.now.getFullYear();
                    grid.month = TimeService.now.getMonth();
                }
            }
        }

        DayOfWeekRow {
            id: dayOfWeek

            Layout.fillWidth: true
            locale: Settings.locale
            palette.text: Settings.styles.time.calendar.week.foreground
        }

        MonthView {
            id: grid
        }
    }
}
