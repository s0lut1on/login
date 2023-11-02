import QtQuick 2.12
import QtQuick.Controls 2.0
import com.screenvm 1.0

Rectangle {
    anchors.fill: parent

    signal changeScreen(string source)

    MainScreenVM {
        id: screenVM
        onListKhoaChanged: {
            selectKhoa.model = screenVM.listKhoa
        }
    }

    Text {
        id: bigTitle
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height / 10
        text: "Danh sách sinh viên"
        font.pixelSize: parent.width / 20
        color: "black"
    }

    TextField {
        id: inputMSV
        width: parent.width / 8
        anchors.right: parent.horizontalCenter
        anchors.top: bigTitle.bottom
        anchors.topMargin: parent.height / 20
        font.pixelSize: 15
        placeholderText: "Mã SV"
        maximumLength: 50
        onFocusChanged: {
            if (this.focus) {
                this.placeholderText = ""
            } else if (this.text === "") {
                this.placeholderText = "Mã SV"
            }
        }
    }

    TextField {
        id: inputTenSV
        width: parent.width / 8
        anchors.left: inputMSV.right
        anchors.leftMargin: parent.width / 50
        anchors.top: inputMSV.top
        font.pixelSize: 15
        placeholderText: "Tên SV"
        maximumLength: 50
        onFocusChanged: {
            if (this.focus) {
                this.placeholderText = ""
            } else if (this.text === "") {
                this.placeholderText = "Tên SV"
            }
        }
    }

    ComboBox {
        id: selectKhoa
        width: parent.width / 8
        anchors.left: inputTenSV.right
        anchors.leftMargin: parent.width / 50
        anchors.top: inputTenSV.top
        font.pixelSize: 15
        model: screenVM.listKhoa
//        model: {
//            console.log(screenVM.listKhoa)
//            return [1, 2, 3, 4]
//        }
    }

    ComboBox {
        id: selectNganh
        width: parent.width / 7
        anchors.left: selectKhoa.right
        anchors.leftMargin: parent.width / 50
        anchors.top: selectKhoa.top
        font.pixelSize: 15
        model: screenVM.getListNganh(selectKhoa.currentText)
    }
}
