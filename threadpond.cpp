#include "threadpond.h"

threadPond::threadPond()
{
    SK2 =new socket_SYS();
    socketThread =new QThread;

    connect(this,SIGNAL(startInit()),SK2,SLOT(socket_Int()));
    connect(this,SIGNAL(startListing()),SK2,SLOT(socket_Listening()));
    connect(SK2,SIGNAL(sendSocketState2T(QString)),this,SLOT(getSocketState(QString)));


    SK2->moveToThread(socketThread);
    socketThread->start();



}
threadPond::~threadPond()
{

}

void threadPond::socket_Init()
{
  emit startInit();
}
void threadPond::socket_Listing()
{
  emit startListing();
}

void threadPond::getSocketState(QString msg)
{
   emit sendSocketState2QML(msg);
}
