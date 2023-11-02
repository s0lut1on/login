import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Window {
    id: mainScreen
    width: 1280
    height: 720
    visible: true

    Loader {
        id: loader_screen
        anchors.fill: parent
        source: "MainScreen.qml"
    }

    Connections {
        target: loader_screen.item
        function onChangeScreen() {
            if (source && source != "") {
                loader_screen.source = source
                console.log("source change: " + source)
            }
        }
    }
}
