#include "threadpond.h"

threadPond::threadPond()
{
    SK2 =new socket_SYS();
    socketThread =new QThread;

    connect(this,SIGNAL(startListing()),SK2,SLOT(start_listening()));
    connect(SK2,SIGNAL(sendSocketState2T(QString)),this,SLOT(getSocketState(QString)));
    connect(SK2,SIGNAL(sendcontrolMSG2T(QVariantList)),this,SLOT(getcontrolMSGFromSocket(QVariantList)));
//    connect(this,SIGNAL(sendTGMSG2Socket(double,double)),SK2,SLOT(void ControlTG(double,double));
//    connect(this,SIGNAL(sendArmMSG2Socket(double ),SK2,SLOT(ControlARMST(double));
//    connect(this,SIGNAL(sendArmMoveMSG2sOCKET(double ,double),SK2,SLOT(ControlARMMove(double ,double));
   connect(this,SIGNAL(sendTGMSG2Socket(int,int)),SK2,SLOT(ControlTG(int,int)));
   connect(this,SIGNAL(sendArmMSG2Socket(int)),SK2,SLOT(ControlARMST(int)));
   connect(this,SIGNAL(sendArmMoveMSG2sOCKET(int ,int)),SK2,SLOT(ControlARMMove(int ,int)));



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
QVariantList threadPond::getControlList()
{
    QVariantList sk;
    sk.append(11);
    sk.append(22);
    sk.append(33);
    return sk;

};
void threadPond::getSocketState(QString msg)
{
   emit sendSocketState2QML(msg);//在QML中被调用；
}

void threadPond::getcontrolMSGFromSocket(QVariantList val)
{
    emit sendcontrolMSG2QML(val);
}

void threadPond::tGup(int length)
{
    emit sendTGMSG2Socket(Up,length);
};
void threadPond::tGdown(int length)
{
    emit sendTGMSG2Socket(Down,length);
};
void threadPond::tGstop()
{
    emit sendTGMSG2Socket(Stop,9);
};
void threadPond::armrelease()
{
    emit sendArmMSG2Socket(Release);
};
void threadPond::armstop()
{
    emit sendArmMSG2Socket(Stop);
};
void threadPond::armrecover()
{
    emit sendArmMSG2Socket(Recover);
};


void threadPond::armmoveup(int length)
{
//    void sendTGMSG2Socket(double type,double length);
//    void sendArmMSG2Socket(double type);
//    void sendArmMoveMSG2sOCKET(double type,double length);
};
void threadPond:: armmovestop()
{
//    void sendTGMSG2Socket(double type,double length);
//    void sendArmMSG2Socket(double type);
//    void sendArmMoveMSG2sOCKET(double type,double length);
};
void threadPond::armmovedown(int length)
{
//    void sendTGMSG2Socket(double type,double length);
//    void sendArmMSG2Socket(double type);
//    void sendArmMoveMSG2sOCKET(double type,double length);
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
     dd[0]=0x1f;
     dd[1]=0x1f;

//16进制转换
//     int aal=1000;
//     dd[0]=aal>>8;
//     dd[1]=(aal<<8)>>8;

     qDebug()<<"crctest=="<< dd.toHex().toInt() ;
     //qDebug()<<"crctest=="<<QString::number(skk,16);
     qDebug()<<"crctest=="<<QString::number(dd[2],16) ;
     qDebug()<<"crctest=="<<QString::number(dd[3],16) ;
//16进制转换

}
