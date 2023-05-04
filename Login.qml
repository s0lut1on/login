import QtQuick 2.15
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
            text: "Login"
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
            id: login_title
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Login"
            font.pixelSize: 30
            font.bold: true
            color: "white"
        }

        Text {
            id: login_slogan
            anchors.top: login_title.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Sign in to continue."
            font.pixelSize: 15
            color: "white"
        }

        Text {
            id: email_title
            anchors.left: email_input.left
            anchors.top: login_slogan.bottom
            anchors.topMargin: 30
            text: "EMAIL"
            font.pixelSize: 15
            color: "white"
        }

        TextField {
            id: email_input
            anchors.horizontalCenter: parent.horizontalCenter
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
            width: email_input.width
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
            id: login_btn
            anchors.left: password_input.left
            anchors.top: password_input.bottom
            anchors.topMargin: 30
            width: email_input.width
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
                console.log("Email & password: " + email_input.text + "\t" + password_input.text)
            }
        }

        Text {
            id: forgot_password
            anchors.top: login_btn.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: login_btn.horizontalCenter
            text: "Forgot Password?"
            color: "white"
            font.pixelSize: 15

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Change to forgot password screen")
                }
            }
        }

        Text {
            id: sign_up
            anchors.top: forgot_password.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: forgot_password.horizontalCenter
            text: "Signup!"
            color: "white"
            font.pixelSize: 15

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    changeScreen("SignUp.qml")
                }
            }
        }
    }
}
