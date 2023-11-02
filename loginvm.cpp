#include "loginvm.h"
#include <QDebug>

LoginVM::LoginVM()
{

}

bool LoginVM::login(QString username, QString password) {
    qDebug() << "username: " << username;
    qDebug() << "password: " << password;
    if (username == "hungdm" && password == "123456") {
        return true;
    }
    return false;
}
