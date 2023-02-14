#include "threadpond.h"
#include <QDateTime>
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

   connect(this,SIGNAL(sendZhendongKG()),SK2,SLOT(zhendongKZ()));
   connect(this,SIGNAL(sendShuibengKG()),SK2,SLOT(shuibengKZ()));
   connect(this,SIGNAL(sendZuanjinKG()),SK2,SLOT(zhuanjinKZ()));
   connect(this,SIGNAL(sendYeyaKG()),SK2,SLOT(yeyaKZ()));
   connect(this,SIGNAL(sendCircle(int,int)),SK2,SLOT(getCircle(int,int)));

   connect(this,SIGNAL(sendShutDown()),SK2,SLOT(getShutDown()));

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

void threadPond:: zhendongKG()
{
  emit sendZhendongKG();
}
void threadPond:: shuibengKG()
{
   emit sendShuibengKG();
}
void threadPond:: zuanjinKG()
{
   emit sendZuanjinKG();
}

void threadPond::yeyaKG()
{
  emit sendYeyaKG();
}
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
void threadPond::startCircle(int cout,int step)
{
    emit sendCircle(cout,step);
};

void threadPond::shutDown()
{
    emit sendShutDown();
}



void threadPond::crctest()
{
    QDateTime time =QDateTime::currentDateTime();

    qDebug()<<time.toString("yyyy_MM_dd_hh_mm_ss");

}
