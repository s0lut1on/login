import QtQuick 2.12
import QtQuick.Controls 2.0

Rectangle {
    anchors.fill: parent

    signal changeScreen(string source)

    Rectangle {
        width: parent.width / 2
        height: this.width
        color: "#4942CE"
        radius: this.width / 2
        x: -this.width / 4
        y: -this.height / 4

        Image {
            id: left_arrow
            source: "image/left_arrow.png"
            anchors.centerIn: parent
            width: parent.width / 5
            height: parent.height / 10
        }
        Text {
            text: "Back"
            color: "white"
            anchors.left: left_arrow.right
            anchors.verticalCenter: left_arrow.verticalCenter
            font.pixelSize: 12
        }

        Text {
            text: "Sign Up"
            color: "white"
            anchors.top: left_arrow.bottom
            anchors.horizontalCenter: left_arrow.right
            font.pixelSize: 24
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                changeScreen("MainScreen.qml")
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: parent.height * 3/4
        radius: 20
        color: "#22263E"

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height / 6
            color: "#22263E"
        }

        Text {
            id: sign_up_title
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 2
            text: "Create new Account"
            font.pixelSize: 30
            font.bold: true
            color: "white"
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: sign_up_slogan
            anchors.top: sign_up_title.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Already Registered? Log in here."
            font.pixelSize: 15
            color: "white"
        }

        Text {
            id: name_title
            anchors.left: name_input.left
            anchors.top: sign_up_slogan.bottom
            anchors.topMargin: 30
            text: "NAME"
            font.pixelSize: 15
            color: "white"
        }
        TextField {
            id: name_input
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: name_title.bottom
            anchors.topMargin: 10
            placeholderText: "Input Name"
            placeholderTextColor: "white"
            width: parent.width / 1.3
            background: Rectangle {
                anchors.fill: parent
                color: "#8F8E8E"
                radius: 20
            }

            onFocusChanged: {
                if (this.focus) {
                    this.placeholderText = ""
                } else if (this.text === "") {
                    this.placeholderText = "Input Name"
                }
            }
        }

        Text {
            id: email_title
            anchors.left: name_input.left
            anchors.top: name_input.bottom
            anchors.topMargin: 10
            text: "EMAIL"
            font.pixelSize: 15
            color: "white"
        }
        TextField {
            id: email_input
            anchors.left: email_title.left
            anchors.top: email_title.bottom
            anchors.topMargin: 10
            placeholderText: "Input Email"
            placeholderTextColor: "white"
            width: parent.width / 1.3
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
            anchors.topMargin: 10
            text: "PASSWORD"
            font.pixelSize: 15
            color: "white"
        }
        TextField {
            id: password_input
            anchors.left: password_title.left
            anchors.top: password_title.bottom
            anchors.topMargin: 10
            placeholderText: "Input Password"
            placeholderTextColor: "white"
            width: parent.width / 1.3
            echoMode: TextInput.Password
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
            id: sign_up_btn
            anchors.left: password_input.left
            anchors.top: password_input.bottom
            anchors.topMargin: 10
            width: email_input.width
            background: Rectangle {
                anchors.fill: parent
                color: "#4942CE"
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
                console.log("Email & password: " + email_input.text + "\t" + password_input.text + "\t" + name_input.text)
            }
        }

        Text {
            id: forgot_password
            anchors.top: sign_up_btn.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: sign_up_btn.horizontalCenter
            text: "Already Have Account?"
            color: "white"
            font.pixelSize: 15

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    changeScreen("Login.qml")
                }
            }
        }

        Text {
            id: sign_up
            anchors.top: forgot_password.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: forgot_password.horizontalCenter
            text: "Login!"
            color: "white"
            font.pixelSize: 15

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    changeScreen("Login.qml")
                }
            }
        }
    }
}
