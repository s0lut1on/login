import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

Window {
    id: mainScreen
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true

    Loader {
        id: loader_screen
        anchors.fill: parent
        source: "MainScreen.qml"
    }

    Connections {
        target: loader_screen.item
        onChangeScreen: {
            if (source && source != "") {
                loader_screen.source = source
                console.log("source change: " + source)
            }
        }
    }
}
