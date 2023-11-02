import QtQuick 2.12
import QtQuick.Controls.Basic
import com.screenvm 1.0

Rectangle {
    anchors.fill: parent


    LoginVM {
        id: screen_vm
    }

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
        id: user_name_title
        anchors.left: user_name_input.left
        anchors.top: login_slogan.bottom
        anchors.topMargin: parent.height / 30
        text: "USERNAME"
        font.pixelSize: parent.width / 50
        color: "black"
    }

    TextField {
        id: user_name_input
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: user_name_title.bottom
        anchors.topMargin: parent.height / 60
        placeholderText: "Input Username"
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
                this.placeholderText = "Input Username"
            }
        }
    }

    Text {
        id: password_title
        anchors.left: user_name_input.left
        anchors.top: user_name_input.bottom
        anchors.topMargin: parent.height / 60
        text: "PASSWORD"
        font.pixelSize: user_name_title.font.pixelSize
        color: "black"
    }
    TextField {
        id: password_input
        anchors.left: password_title.left
        anchors.top: password_title.bottom
        anchors.topMargin: parent.height / 60
        placeholderText: "Input Password"
        placeholderTextColor: "white"
        width: user_name_input.width
        echoMode: TextInput.Password
        font.pixelSize: user_name_input.font.pixelSize
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
        width: user_name_input.width
        background: Rectangle {
            anchors.fill: parent
            color: "#4942CE"
        }

        contentItem: Text {
            text: "Login"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: user_name_title.font.pixelSize
            font.bold: true
            color: "white"
        }

        onClicked: {
            if (screen_vm.login(user_name_input.text, password_input.text)) {
                changeScreen("MainScreen");
            }
        }
    }

    Popup {
        id: popUp
        width: parent.width / 2
        height: parent.height / 2
        anchors.centerIn: parent
        modal: true
        focus: strue
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        visible: false
        background: Rectangle {
            anchors.fill: parent
            color: "white"
            radius: parent.width / 30
        }

        contentItem: Rectangle {
            anchors.fill: parent
            color: "white"
            radius: parent.width / 30
            Text {
                id: popUpTittle
                text: "Login failed"
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: parent.height / 8
                color: "black"
                font.pixelSize: parent.width / 10
                font.bold: true
            }

            Text {
                id: popUpMessage
                text: "Your username or password is incorrect"
                color: "black"
                anchors.top: popUpTittle.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: parent.width / 20
            }
            Text {
                id: popUpMessage2
                text: "Please try again"
                color: "black"
                anchors.top: popUpMessage.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: parent.width / 20
            }
        }
    }
}
