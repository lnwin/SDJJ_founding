#include "threadpond.h"

threadPond::threadPond()
{
    SK2 =new socket_SYS();
    socketThread =new QThread;

    connect(this,SIGNAL(startListing()),SK2,SLOT(start_listening()));
    connect(SK2,SIGNAL(sendSocketState2T(QString)),this,SLOT(getSocketState(QString)));
    connect(SK2,SIGNAL(sendcontrolMSG2T(monitoredMSG)),this,SLOT(getcontrolMSGFromSocket(monitoredMSG)));
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

void threadPond::getcontrolMSGFromSocket(monitoredMSG val)
{
    emit sendcontrolMSG2QML(val);
}

void threadPond::getwaveMSGFromQml(waveMSG sk)
{
    qDebug()<<"skwan="<< sk.wave_Number ;
}


void threadPond::TGup(double length)
{

};
void threadPond::TGdown(double length)
{

};
void threadPond::TGstop()
{

};
void threadPond::Armrelease()
{

};
void threadPond::Armstop()
{

};
void threadPond::Armrecover()
{

};


void threadPond::Armmoveup(double length)
{

};
void threadPond:: Armmovestop()
{

};
void threadPond::Armmovedown(double length)
{

};

















void threadPond::crctest()
{
    // 01 06 01 01 FF FF 46 D8  //打开
     jdks=new crc();
     QByteArray t1;
     t1[0]=0x01;
     t1[1]=0x80;
     t1[2]=0x01;
     t1[3]=0x0A;
     t1[4]=0x13;
     t1[5]=0x0f;
     t1[6]=0x05;
     t1[7]=0x01;
     QByteArray dd;
     dd[0]=0x46;
     dd[1]=0xd8;
//16进制转换
     uint16_t skk=jdks->ModbusCRC16(t1);
     qDebug()<<"crctest=="<<skk;
     qDebug()<<"crctest=="<<QString::number(skk,16);
     qDebug()<<"crctest=="<<dd.toHex().toInt(0,16);
//16进制转换



}
