import QtQuick 2.12
import QtQuick.Controls 2.0
//import com.mainScreen 1.0

Rectangle {
    anchors.fill: parent

    signal changeScreen(string source)

//    MainScreenVM {
//        id: screen_vm
//    }

    Image {
        id: logo
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height / 5
        source: "image/logo.png"
    }

    Text {
        id: slogan
        text: "Get better yourself"
        anchors.horizontalCenter: logo.horizontalCenter
        y: logo.y + logo.height + 10
    }

    Rectangle {
        id: black_box
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height / 3
        radius: 20
        color: "#22263E"

        Rectangle {
            id: cover_box
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height / 6
            color: "#22263E"
        }

        Button {
            id: btn_login
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height / 4
            width: parent.width * 2/3
            height: parent.height / 4
            background: Rectangle {
                anchors.fill: parent
                color: "#4942CE"
                radius: 20
            }

            contentItem: Text {
                text: "Login"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 20
                font.bold: true
                color: "white"
            }

            onClicked: {
                changeScreen("Login.qml")
            }
        }

        Button {
            id: btn_sign_up
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: btn_login.bottom
            anchors.topMargin: 10
            width: parent.width * 2/3
            height: parent.height / 4
            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: "#4942CE"
                border.width: 2
                radius: 20
            }

            contentItem: Text {
                text: "Sign Up"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 20
                font.bold: true
                color: "white"
            }

            onClicked: {
                changeScreen("SignUp.qml")
            }
        }
    }
}
