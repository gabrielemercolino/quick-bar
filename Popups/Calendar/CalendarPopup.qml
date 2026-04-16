import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import qs

PopupWindow {
    id: calPopup
    visible: false

    required property var anchorItem

    anchor.item: anchorItem
    anchor.rect.x: (anchorItem.width - implicitWidth) / 2
    anchor.rect.y: anchorItem.height

    implicitWidth: 280
    implicitHeight: calLayout.implicitHeight + 16

    ColumnLayout {
        id: calLayout
        anchors {
            fill: parent
            margins: 8
        }
        spacing: 4

        CalendarHeader {
            month: grid.month
            year: grid.year
            onMonthChangeRequested: month => grid.month = month
            onYearChangeRequested: year => grid.year = year
        }

        DayOfWeekRow {
            Layout.fillWidth: true
            locale: Settings.locale
        }

        MonthView {
            id: grid
        }
    }
}
