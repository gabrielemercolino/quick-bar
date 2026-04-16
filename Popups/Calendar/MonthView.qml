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

    delegate: Text {
        required property var model
        required property int month

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: model.day
        opacity: month === root.month ? 1 : 0.3
        font.bold: model.today
    }
}
