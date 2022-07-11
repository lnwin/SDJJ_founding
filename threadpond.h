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


public:

   socket_SYS *SK2;
   QThread *socketThread;

};

#endif // THREADPOND_H
