#ifndef THREADPOND_H
#define THREADPOND_H
#include <QObject>
#include <QThread>
#include <socket.h>
#include <mystruct.h>
class threadPond : public QObject
{
    Q_OBJECT
   // Q_PROPERTY(waveMSG wmsg READ getWmsg WRITE setWmsg)// 暴露了参数和函数
    Q_PROPERTY(waveMSG wmsg)
    Q_PROPERTY(controlMSG conmsg)
    Q_PROPERTY(monitoredMSG monmsg)
public:
    threadPond();
    ~threadPond();

   Q_INVOKABLE void socket_Init();
   Q_INVOKABLE void socket_Listing();
   Q_INVOKABLE void getwaveMSGFromQml(waveMSG val);
  // Q_INVOKABLE void getcontrolMSGFromSocket(controlMSG val);
   Q_INVOKABLE void crctest();


signals:

    void startInit();
    void startListing();
    void sendSocketState2QML(QString ssMsg);
    void sendcontrolMSG2QML(monitoredMSG mMSG);
    void sendWaveControlMsg();
    void readWaveFile();

//Q_SIGNALS:
//    void sendSocketState2QML(QString);

public slots:
    void getSocketState(QString);
    void getcontrolMSGFromSocket(monitoredMSG val);

public:
   socket_SYS *SK2;
   QThread *socketThread;
   waveMSG  wmsg;
   controlMSG conmsg;
   monitoredMSG monmsg;
   crc *jdks;

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
