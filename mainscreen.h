
#ifndef MAINSCREEN_H
#define MAINSCREEN_H


#include <QObject>

class MainScreen : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList listKhoa MEMBER m_listKhoa NOTIFY listKhoaChanged)

public:
    MainScreen();

public slots:
    void login();
    void signUp();
    QStringList getListNganh(QString khoa);

signals:
    void listKhoaChanged(QStringList);

private:
    QStringList m_listKhoa;


};

#endif // MAINSCREEN_H
