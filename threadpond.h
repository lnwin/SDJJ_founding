#ifndef THREADPOND_H
#define THREADPOND_H
#include <QObject>
#include <QThread>
#include <socket.h>
#include <mystruct.h>
#include <mysql.h>
class threadPond : public QObject
{
    Q_OBJECT
   // Q_PROPERTY(waveMSG wmsg READ getWmsg WRITE setWmsg)// 暴露了参数和函数
   // Q_PROPERTY(mMSG);
   //  Q_PROPERTY(controlMSG conmsg)
   // Q_PROPERTY(monitoredMSG monmsg)
public:
    threadPond();
    ~threadPond();

   Q_INVOKABLE void socket_Init();
   Q_INVOKABLE void socket_Listing();  
  // Q_INVOKABLE void getcontrolMSGFromSocket(controlMSG val);

    Q_INVOKABLE void tGup(int length);
    Q_INVOKABLE void tGstop();
    Q_INVOKABLE void tGdown(int length);

    Q_INVOKABLE void armrelease();
    Q_INVOKABLE void armstop();
    Q_INVOKABLE void armrecover();

    Q_INVOKABLE void armmoveup(int length);
    Q_INVOKABLE void armmovestop();
    Q_INVOKABLE void armmovedown(int length);

    Q_INVOKABLE void zhendongKG();
    Q_INVOKABLE void shuibengKG();
    Q_INVOKABLE void zuanjinKG();
    Q_INVOKABLE void yeyaKG();
    Q_INVOKABLE void shutDown();

    Q_INVOKABLE void startCircle(int cout,int step);

    Q_INVOKABLE void crctest();
    Q_INVOKABLE QVariantList getControlList();
    Q_INVOKABLE void closeAll();
    Q_INVOKABLE void addMSG2sql(QString MSG,QString date);





signals:

    void startInit();
    void startListing();
    void sendSocketState2QML(QString ssMsg);
    void sendcontrolMSG2QML(QVariantList mMSG);
    void sendWaveControlMsg();
    void readWaveFile();

    void sendTGMSG2Socket(int type,int length);
    void sendArmMSG2Socket(int type);
    void sendArmMoveMSG2sOCKET(int type,int length);

    void sendZhendongKG();
    void sendShuibengKG();
    void sendZuanjinKG();
    void sendYeyaKG();
    void sendShutDown();
    void sendCircle(int cout,int step);

//Q_SIGNALS:
   // void sendSocketState2QML(QString);

public slots:
    void getSocketState(QString);
    void getcontrolMSGFromSocket(QVariantList val);

public:
   socket_SYS *SK2;
   QThread *socketThread;
   waveMSG  wmsg;
   QVariantList conmsg;
   monitoredMSG monmsg;
   crc *jdks;
   mysql* Msql;
//   waveMSG getWmsg()
//   {
//       return wmsg ;
//   };
//   void setWmsg(waveMSG stn)
//   {
//         wmsg = stn  ;
//   };


};

#endif // THREADPOND_H
