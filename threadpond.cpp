#include "threadpond.h"
#include <QDateTime>
threadPond::threadPond()
{
    SK2 =new socket_SYS();
    socketThread =new QThread;
    Msql=new mysql();
    connect(this,SIGNAL(startListing()),SK2,SLOT(start_listening()));
    connect(SK2,SIGNAL(sendSocketState2T(QString)),this,SLOT(getSocketState(QString)));
    connect(Msql,SIGNAL(sendSqlState2T(QString)),this,SLOT(getSocketState(QString)));
    connect(SK2,SIGNAL(sendcontrolMSG2T(QVariantList)),this,SLOT(getcontrolMSGFromSocket(QVariantList)));
    connect(this,SIGNAL(sendTGMSG2Socket(int,int)),SK2,SLOT(ControlTG(int,int)));
    connect(this,SIGNAL(sendArmMSG2Socket(int,int)),SK2,SLOT(ControlARMST(int,int)));
    connect(this,SIGNAL(sendArmMoveMSG2sOCKET(int ,int)),SK2,SLOT(ControlARMMove(int ,int)));

    connect(this,SIGNAL(sendZhendongKG()),SK2,SLOT(zhendongKZ()));
    connect(this,SIGNAL(sendShuibengKG()),SK2,SLOT(shuibengKZ()));
    connect(this,SIGNAL(sendZuanjinKG()),SK2,SLOT(zhuanjinKZ()));
    connect(this,SIGNAL(sendGongzuoKG()),SK2,SLOT(gongzuoKZ()));
    connect(this,SIGNAL(senddongliKG()),SK2,SLOT(dongliKZ()));

    connect(this,SIGNAL(sendYeyaKG()),SK2,SLOT(yeyaKZ()));
    connect(this,SIGNAL(sendCircle(int,int)),SK2,SLOT(getCircle(int,int)));

    connect(this,SIGNAL(sendShutDown()),SK2,SLOT(getShutDown()));

    connect(this,SIGNAL(sendCameraPower(bool)),SK2,SLOT(getCameraPower(bool)));
    connect(this,SIGNAL(sendLightPower(bool)),SK2,SLOT(getLightPower(bool)));

    connect(this,SIGNAL(setSpeed(int,int)),SK2,SLOT(setMSpeed(int,int)));


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
    Msql->creatDB();
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
void threadPond::armrelease(int degree)
{
    emit sendArmMSG2Socket(Release,degree);
};
void threadPond::armstop()
{
    emit sendArmMSG2Socket(Stop,0);
};
void threadPond::armrecover(int degree)
{
    emit sendArmMSG2Socket(Recover,degree);
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
void threadPond:: gongzuoKG()
{
   emit sendGongzuoKG();
}
void threadPond:: dongliKG()
{
    emit senddongliKG();
}
void threadPond::yeyaKG()
{
  emit sendYeyaKG();
}
void threadPond::armmoveup(int length)
{

    emit sendArmMoveMSG2sOCKET(Up,length);
}
void threadPond:: armmovestop()
{

    emit sendArmMoveMSG2sOCKET(Stop,10);
}
void threadPond::armmovedown(int length)
{

    emit sendArmMoveMSG2sOCKET(Down,length);
}
void threadPond::startCircle(int cout,int step)
{
    emit sendCircle(cout,step);
}

void threadPond::shutDown()
{
    emit sendShutDown();
}

void threadPond::cameraPowerUp()
{
    emit sendCameraPower(true);
}
void threadPond::cameraPowerDown()
{
   emit sendCameraPower(false);
};
void threadPond::lightPowerUp()
{
   emit sendLightPower(true);
};
void threadPond::lightPowerDown()
{
   emit sendLightPower(false);
};
void threadPond:: zhuansupeizhi(int shuibengspeed,int zuanjinspeed)
{
   emit setSpeed(shuibengspeed, zuanjinspeed);
};

void threadPond::closeAll()
{
     Msql->closeDB();
}

void threadPond::crctest()
{
    QDateTime time =QDateTime::currentDateTime();

    qDebug()<<time.toString("yyyy_MM_dd_hh_mm_ss");

}
void threadPond::addMSG2sql(QString MSG,QString date)
{
   Msql->addMSG(MSG,date);
}
