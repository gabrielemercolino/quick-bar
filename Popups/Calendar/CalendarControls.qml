import QtQuick
import QtQuick.Layouts
import qs

RowLayout {
    id: root

    required property int month
    required property int year

    signal monthChangeRequested(int month)
    signal yearChangeRequested(int year)
    signal resetRequested

    property var style: Settings.styles.time.calendar.header

    Text {
        text: Settings.locale.toString(new Date(root.year, root.month), "MMM yyyy").toUpperCase()
        color: root.style.foreground
    }

    Item {
        Layout.fillWidth: true
    }

    RowLayout {
        ControlButton {
            text: ""
            onClicked: root.yearChangeRequested(root.year - 1)
        }

        ControlButton {
            text: ""
            onClicked: {
                if (root.month === 0) {
                    root.monthChangeRequested(11);
                    root.yearChangeRequested(root.year - 1);
                } else {
                    root.monthChangeRequested(root.month - 1);
                }
            }
        }

        ControlButton {
            text: ""
            onClicked: root.resetRequested()
        }

        ControlButton {
            text: ""
            onClicked: {
                if (root.month === 11) {
                    root.monthChangeRequested(0);
                    root.yearChangeRequested(root.year + 1);
                } else {
                    root.monthChangeRequested(root.month + 1);
                }
            }
        }

        ControlButton {
            text: ""
            onClicked: root.yearChangeRequested(root.year + 1)
        }
    }
}
