#include "threadpond.h"

threadPond::threadPond()
{
    SK2 =new socket_SYS();
    socketThread =new QThread;

    connect(this,SIGNAL(startListing()),SK2,SLOT(start_listening()));
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
    emit startListing();//直接调用SK2的函数，线程不变，使用信号槽才会改变线程

}

void threadPond::getSocketState(QString msg)
{
   emit sendSocketState2QML(msg);
}

void threadPond::getwaveMSGFromQml(waveMSG sk)
{

}
