#ifndef THREADPOND_H
#define THREADPOND_H
#include <QObject>
#include <QThread>
#include <socket.h>
class threadPond : public QObject
{
    Q_OBJECT
public:
    threadPond();
    ~threadPond();

   Q_INVOKABLE void socket_Init();
   Q_INVOKABLE void socket_Listing();

signals:

    void startInit();
    void startListing();
    void sendSocketState2QML(QString ssMsg);

//Q_SIGNALS:
//    void sendSocketState2QML(QString);

public slots:
    void getSocketState(QString);

public:
   socket_SYS *SK2;
   QThread *socketThread;

};

#endif // THREADPOND_H
