#ifndef LOGINVM_H
#define LOGINVM_H

#include <QObject>

class LoginVM : public QObject
{
    Q_OBJECT
public:
    LoginVM();
public slots:
    bool login(QString username, QString password);
};

#endif // LOGINVM_H
