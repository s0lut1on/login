import QtQuick 2.12
import QtQuick.Controls 2.0

Rectangle {
    anchors.fill: parent

    signal changeScreen(string source)

    Text {
        id: login_title
        anchors.top: parent.top
        anchors.topMargin: parent.height / 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Login"
        font.pixelSize: parent.width / 30
        font.bold: true
        color: "black"
    }

    Text {
        id: login_slogan
        anchors.top: login_title.bottom
        anchors.topMargin: parent.height / 100
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Login to continue."
        font.pixelSize: parent.width / 50
        color: "black"
    }

    Text {
        id: email_title
        anchors.left: email_input.left
        anchors.top: login_slogan.bottom
        anchors.topMargin: parent.height / 30
        text: "EMAIL"
        font.pixelSize: parent.width / 50
        color: "black"
    }

    TextField {
        id: email_input
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: email_title.bottom
        anchors.topMargin: parent.height / 60
        placeholderText: "Input Email"
        placeholderTextColor: "white"
        width: parent.width / 1.3
        font.pixelSize: parent.width / 60
        color: "white"
        maximumLength: 50
        background: Rectangle {
            anchors.fill: parent
            color: "#8F8E8E"
            radius: 20
        }

        onFocusChanged: {
            if (this.focus) {
                this.placeholderText = ""
            } else if (this.text === "") {
                this.placeholderText = "Input Email"
            }
        }
    }

    Text {
        id: password_title
        anchors.left: email_input.left
        anchors.top: email_input.bottom
        anchors.topMargin: parent.height / 60
        text: "PASSWORD"
        font.pixelSize: email_title.font.pixelSize
        color: "black"
    }
    TextField {
        id: password_input
        anchors.left: password_title.left
        anchors.top: password_title.bottom
        anchors.topMargin: parent.height / 60
        placeholderText: "Input Password"
        placeholderTextColor: "white"
        width: email_input.width
        echoMode: TextInput.Password
        font.pixelSize: email_input.font.pixelSize
        color: "white"
        maximumLength: 50
        background: Rectangle {
            anchors.fill: parent
            color: "#8F8E8E"
            radius: 20
        }

        onFocusChanged: {
            if (this.focus) {
                this.placeholderText = ""
            } else if (this.text === "") {
                this.placeholderText = "Input Password"
            }
        }
    }
    Button {
        id: login_btn
        anchors.left: password_input.left
        anchors.top: password_input.bottom
        anchors.topMargin: parent.height / 20
        width: email_input.width / 2
        background: Rectangle {
            anchors.fill: parent
            color: "#4942CE"
        }

        contentItem: Text {
            text: "Login"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: email_title.font.pixelSize
            font.bold: true
            color: "white"
        }

        onClicked: {
            console.log("Email & password: " + email_input.text + "\t" + password_input.text)
        }
    }

//    Button {
//        id: forgot_btn
//        anchors.left: login_btn.right
//        anchors.top: login_btn.top
//        anchors.leftMargin: parent.width / 100
//        width: login_btn.width
//        background: Rectangle {
//            anchors.fill: parent
//            color: "#4942CE"
//        }

//        contentItem: Text {
//            text: "Forgot password"
//            horizontalAlignment: Text.AlignHCenter
//            verticalAlignment: Text.AlignVCenter
//            font.pixelSize: email_title.font.pixelSize
//            font.bold: true
//            color: "white"
//        }

//        onClicked: {
//            console.log("Click to forgot password")
//        }
//    }
}
