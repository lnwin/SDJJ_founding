#ifndef SOCKET_H
#define SOCKET_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <crc.h>
#include <QThread>
class socket_SYS : public QObject
{
    Q_OBJECT
public:
    explicit socket_SYS(QObject *parent = nullptr);
    QTcpServer *mainServer;
    QTcpSocket *waveClient;
    QTcpSocket *controlClient;
    QTcpSocket *sk;
//    Q_INVOKABLE    void socket_Int();
//    Q_INVOKABLE    bool socket_Listening();
    crc *CRC;
    QThread *socketThread;
signals:

public slots:
    void socket_Int();
    bool socket_Listening();
    void start_listening();
    bool server_New_Connect();
    void wave_socket_Read_Data();
    void wave_socket_Disconnected();
    void control_socket_Read_Data();
    void control_socket_Disconnected();
private:


};

#endif // SOCKET_H
