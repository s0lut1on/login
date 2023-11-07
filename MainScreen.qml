import QtQuick 2.12
import QtQuick.Controls 2.0
import com.screenvm 1.0

Rectangle {
    id: root
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
        text: "Tìm kiếm"
        font.pixelSize: parent.width / 20
        color: "black"
    }

    Text {
        id: titleTenSV
        font.pixelSize: 20
        text: "Họ tên: "
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bigTitle.bottom
        anchors.topMargin: parent.height / 20
    }

    TextField {
        id: inputTenSV
        width: parent.width / 8
        anchors.verticalCenter: titleTenSV.verticalCenter
        anchors.left: titleTenSV.right
        anchors.leftMargin: 5
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

    Text {
        id: titleMSV
        font.pixelSize: 20
        text: "MSSV: "
        anchors.left: titleTenSV.left
        anchors.top: titleTenSV.bottom
        anchors.topMargin: 5
    }

    TextField {
        id: inputMSV
        width: parent.width / 8
        anchors.verticalCenter: titleMSV.verticalCenter
        anchors.left: inputTenSV.left
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

    Text {
        id: titleKhoa
        font.pixelSize: 20
        text: "Khoa: "
        anchors.left: inputTenSV.right
        anchors.leftMargin: 20
        anchors.verticalCenter: titleTenSV.verticalCenter
    }

    ComboBox {
        id: selectKhoa
        width: parent.width / 8
        anchors.verticalCenter: titleKhoa.verticalCenter
        anchors.left: titleKhoa.right
        anchors.leftMargin: 20
        font.pixelSize: 15
        model: screenVM.listKhoa
    }

    Text {
        id: titleNganh
        font.pixelSize: 20
        text: "Ngành: "
        anchors.left: titleKhoa.left
        anchors.top: titleKhoa.bottom
        anchors.topMargin: 5
    }

    ComboBox {
        id: selectNganh
        width: parent.width / 7
        anchors.verticalCenter: titleNganh.verticalCenter
        anchors.left: selectKhoa.left
        font.pixelSize: 15
        model: screenVM.getListNganh(selectKhoa.currentText)
    }

    TableView {
        id: tableView
        anchors.top: inputMSV.bottom
        anchors.topMargin: parent.height / 10
        anchors.left: dropDownList.right
        anchors.leftMargin: 20
        width: parent.width / 2
        height: parent.height / 3
        model: TableModel {}
        delegate: Rectangle {
            implicitWidth: {
                if (actualWidth)
                    return actualWidth
                return 100
            }
            implicitHeight: 50
            border.width: 1

            Text {
                text: display
                anchors.centerIn: parent
                font.pixelSize: 13
            }
        }
    }

    Rectangle {
        id: dropDownList
        color: "gray"
        width: parent.width / 2.5
        height: parent.height * 3/4
        anchors.top: parent.top
        anchors.topMargin: parent.height / 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }
}
