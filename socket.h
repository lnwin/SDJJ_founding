#ifndef SOCKET_H
#define SOCKET_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <crc.h>
#include <QThread>
#include <mystruct.h>
#include <QMessageBox>
class socket_SYS : public QObject
{
    Q_OBJECT
public:
    explicit socket_SYS(QObject *parent = nullptr);
    QTcpServer *mainServer;
    QTcpSocket *waveClient;
    QTcpSocket *controlClient;
    QTcpSocket *sk;
     int modCYcle=0;
//    Q_INVOKABLE    void socket_Int();
//    Q_INVOKABLE    bool socket_Listening();
    crc *CRC;
    QThread *socketThread;
signals:
  void sendSocketState2T(QString);
  void sendcontrolMSG2T(QVariantList val);
public slots:
    void socket_Int();
    bool socket_Listening();
    void start_listening();
    bool server_New_Connect();
    void wave_socket_Read_Data();
    void wave_socket_Disconnected();
    void control_socket_Read_Data();
    void control_socket_Disconnected();
    void ControlTG(int type,int length);
    void ControlARMST(int type);
    void ControlARMMove(int type,int length);

    void zhendongKZ();
    void shuibengKZ();
    void zhuanjinKZ();
    void gongzuoKZ();
    void dongliKZ();
    void yeyaKZ();
    void getShutDown();
    void getCircle(int cout,int step);

    void getCameraPower(bool);
    void getLightPower(bool);

private:
    bool zhendongOPEN=false;
    bool shuibengOPEN=false;
    bool zuanjinOPEN=false;
    bool gongzuomoshi_iszuanjin=false;
    bool gongzuomoshi_zhendong=false;
    bool gongzuomoshi_tiaoshi=false;
    bool donglidianOPEN=false;
    bool yeyaOPEN=false;

    bool socketIsConnected=false;



};

#endif // SOCKET_H
