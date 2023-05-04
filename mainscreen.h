
#ifndef MAINSCREEN_H
#define MAINSCREEN_H


#include <QObject>


class MainScreen : public QObject
{
    Q_OBJECT
public:
    MainScreen();

public slots:
    void login();
    void signUp();

};

#endif // MAINSCREEN_H
