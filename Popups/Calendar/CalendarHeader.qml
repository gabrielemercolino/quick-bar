import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs

RowLayout {
    id: root

    required property int month
    required property int year

    signal monthChangeRequested(int month)
    signal yearChangeRequested(int year)

    TextMetrics {
        id: monthMetrics
        font: monthText.font
        text: {
            let longest = "";
            for (let i = 0; i < 12; i++) {
                const name = Settings.locale.monthName(i);
                if (name.length > longest.length)
                    longest = name;
            }
            return longest;
        }
    }

    // Month controls
    Button {
        text: "<"
        flat: true
        implicitWidth: contentItem.implicitWidth + 8
        onClicked: {
            if (root.month === 0) {
                root.monthChangeRequested(11);
                root.yearChangeRequested(root.year - 1);
            } else {
                root.monthChangeRequested(root.month - 1);
            }
        }
    }

    Text {
        id: monthText
        text: Settings.locale.toString(new Date(root.year, root.month), "MMMM")
        horizontalAlignment: Text.AlignHCenter
        Layout.preferredWidth: monthMetrics.boundingRect.width
    }

    Button {
        text: ">"
        flat: true
        implicitWidth: contentItem.implicitWidth + 8
        onClicked: {
            if (root.month === 11) {
                root.monthChangeRequested(0);
                root.yearChangeRequested(root.year + 1);
            } else {
                root.monthChangeRequested(root.month + 1);
            }
        }
    }

    // Year controls
    Button {
        text: "<"
        flat: true
        implicitWidth: contentItem.implicitWidth + 8
        onClicked: root.yearChangeRequested(root.year - 1)
    }

    Text {
        text: Settings.locale.toString(new Date(root.year, root.month), "yyyy")
        horizontalAlignment: Text.AlignHCenter
        Layout.fillWidth: true
    }

    Button {
        text: ">"
        flat: true
        implicitWidth: contentItem.implicitWidth + 8
        onClicked: root.yearChangeRequested(root.year + 1)
    }
}
