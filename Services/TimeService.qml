pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property date now: clock.date

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
