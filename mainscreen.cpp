#include "mainscreen.h"
#include <QDebug>

MainScreen::MainScreen()
{
    m_listKhoa << "Điện - điện tử" << "Cơ khí động lực" << "Cơ khí chế tạo máy điện";
}

void MainScreen::login()
{
}

void MainScreen::signUp()
{
}

QStringList MainScreen::getListNganh(QString khoa)
{
    if (khoa == "Điện - điện tử") {
        return {"Hệ thống nhúng và IoT", "Công nghệ kỹ thuật máy tính"};
    } else if (khoa == "Cơ khí động lực") {
        return {"Công nghệ kỹ thuật ô tô", "Công nghệ kỹ thuật cơ điện tử"};
    } else if (khoa == "Cơ khí chế tạo máy điện") {
        return {"Công nghệ kỹ thuật cơ khí", "Công nghệ Gỗ nội thất"};
    }
    return QStringList();
}

