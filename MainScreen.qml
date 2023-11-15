import QtQuick 2.12
import QtQuick.Controls 2.0
//import QtQuick.Controls.Basic
import com.screenvm 1.0

Rectangle {
    id: root
    anchors.fill: parent

    property bool newScreen: false

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
        visible: !newScreen
    }

    ComboBox {
        id: selectKhoa
        width: parent.width / 7
        anchors.verticalCenter: titleKhoa.verticalCenter
        anchors.left: titleKhoa.right
        anchors.leftMargin: 20
        font.pixelSize: 15
        model: ["All", ...screenVM.listKhoa]
        visible: !newScreen
    }

    Text {
        id: titleNganh
        font.pixelSize: 20
        text: "Ngành: "
        anchors.left: titleKhoa.left
        anchors.top: titleKhoa.bottom
        anchors.topMargin: 5
        visible: !newScreen
    }

    ComboBox {
        id: selectNganh
        width: parent.width / 7
        anchors.verticalCenter: titleNganh.verticalCenter
        anchors.left: selectKhoa.left
        font.pixelSize: 15
        model: {
            if (selectKhoa.currentText == "All") {
                return []
            } else {
                return ["All", ...screenVM.getListNganh(selectKhoa.currentText)]
            }
        }
        visible: !newScreen
    }

    Button {
        id: buttonSelect
        width: parent.width / 10
        anchors.left: selectKhoa.right
        anchors.leftMargin: 20
        anchors.top: selectKhoa.top
        background: Rectangle {
            anchors.fill: parent
            border.width: 1
            border.color: "black"
            radius: width / 20
        }

        contentItem: Text {
            text: "Tìm kiếm"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
            color: "black"
        }
    }

    TableView {
        id: tableView
        visible: false
        anchors.top: inputMSV.bottom
        anchors.topMargin: parent.height / 10
        anchors.left: dropDownList.right
        anchors.leftMargin: 20
        width: parent.width / 2
        height: parent.height / 3
        model: TableModel {}
        delegate: Rectangle {
            implicitWidth: 100
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
        property var khoaObj: []
        id: dropDownList
        color: "transparent"
        width: parent.width * 0.3
        height: parent.height * 2/3
        anchors.top: parent.top
        anchors.topMargin: parent.height / 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        Component.onCompleted: {
            for (var index=0; index < screenVM.listKhoa.length; index++) {
                var khoaItem = khoaDropdown.createObject(dropDownList)
                khoaItem._index = index;
                khoaItem.x = 10
                khoaItem.y = index * 50
                khoaItem._text = screenVM.listKhoa[index]
                khoaItem.width = dropDownList.width
                khoaItem.height = 50
                khoaObj.push(khoaItem)
            }
        }
    }

    Button {
        id: buttonEdit
        width: dropDownList.width
        height: 40
        anchors.left: dropDownList.left
        anchors.top: dropDownList.bottom
        anchors.topMargin: 10
        background: Rectangle {
            anchors.fill: parent
            border.width: 1
            border.color: "black"
        }

        contentItem: Text {
            text: "Chỉnh sửa"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
            color: "black"
        }
    }

    Button {
        id: buttonAdd
        width: buttonEdit.width
        height: 40
        anchors.left: buttonEdit.left
        anchors.top: buttonEdit.bottom
        anchors.topMargin: 5
        visible: !newScreen
        background: Rectangle {
            anchors.fill: parent
            border.width: 1
            border.color: "black"
        }

        contentItem: Text {
            text: "Thêm"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
            color: "black"
        }
    }

    Button {
        id: buttonRemove
        width: buttonAdd.width
        height: 40
        anchors.left: buttonAdd.left
        anchors.top: buttonAdd.bottom
        anchors.topMargin: 5
        visible: !newScreen
        background: Rectangle {
            anchors.fill: parent
            border.width: 1
            border.color: "black"
        }

        contentItem: Text {
            text: "Xóa"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            font.bold: true
            color: "black"
        }
    }

    Component {
        id: khoaDropdown
        Item {
            property string _text: ""
            property int _index: 0
            Text {
                text: _text
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                color: "black"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        this.enabled = false
                        var listNganh = screenVM.getListNganh(_text)
                        for (var index=_index + 1; index<screenVM.listKhoa.length; index++) {
                            dropDownList.khoaObj[index].y += 50 * listNganh.length
                        }

                        for (var index=0; index<listNganh.length; index++) {
                            var nganhItem = nganhDropdown.createObject(dropDownList)
                            nganhItem.x = 20
                            nganhItem.y = parent.parent.y + 50 + index * 50
                            nganhItem._text = listNganh[index]
                            nganhItem.width = dropDownList.width
                            nganhItem.height = 50
                        }
                    }
                }
            }
        }
    }

    Component {
        id: nganhDropdown
        Item {
            property string _text: ""
            Text {
                text: _text
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                color: "black"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        tableView.visible = !tableView.visible
                        newScreen = !newScreen
                    }
                }
            }
        }
    }
}
