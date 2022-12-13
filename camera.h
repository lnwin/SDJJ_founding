#ifndef CAMERA_H
#define CAMERA_H
#include <QWindow>
#include <QObject>
#include <QDateTime>
class camera : public QObject
{
    Q_OBJECT
public:
    explicit camera(QObject *parent = nullptr);

    Q_INVOKABLE bool cameraInit(HWND,HWND);
    Q_INVOKABLE bool realPlayer();
    Q_INVOKABLE bool stopRealPlay();
    Q_INVOKABLE bool longID();
    Q_INVOKABLE bool realPlayer_1();
    Q_INVOKABLE bool longID_1();

    Q_INVOKABLE bool startREC();
    Q_INVOKABLE bool stopREC();
    Q_INVOKABLE bool startCatch();



signals:

};

#endif // CAMERA_H
