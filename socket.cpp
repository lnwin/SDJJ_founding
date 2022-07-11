#include "socket.h"

bool severStatus=false;
bool ISconnected_0=false;
bool ISconnected_1=false;
socket_SYS::socket_SYS(QObject *parent) : QObject(parent)
{
    qDebug()<<"socket_SYS thread"<<QThread::currentThread();
}

void socket_SYS::socket_Int()
{
    mainServer = new QTcpServer();
    waveClient = new QTcpSocket();
    controlClient=new QTcpSocket();
    CRC =new crc();
    qDebug()<< "Socket int ok";
    qDebug()<<"Socket init thread"<<QThread::currentThread();
}
bool socket_SYS::socket_Listening()
{
    int port = 500;

    if(!mainServer->isListening())
    {
       if(mainServer->listen(QHostAddress("192.168.1.65"), port))
      // if(mainServer->listen(QHostAddress::AnyIPv4, port))
        {
         // ui->textEdit->append("TCP_Sever is listeing");
         // ui->PortButton->setText("Stop Listen");
         // ui->Net_light->setStyleSheet("border-image: url(:/new/icon/picture/yellow.png);");
            connect(mainServer, SIGNAL(newConnection()), this, SLOT(server_New_Connect()));
            qDebug()<<"mainServer listening ok";

            return  true;

         }
       else
       {
          // ui->textEdit->append("TCP_Sever listen failed, Plesas change TCP_Sever IP to >>192.168.6.516<<!");
           qDebug()<<"TCP_Sever listen failed, Plesas change TCP_Sever IP to >>192.168.1.65<<!";
           qDebug()<<"Socket isListening thread"<<QThread::currentThread();
            return  false;

       }

   }
    else
    {
         mainServer->close();
        // ui->textEdit->append("TCP_Sever listening closed");
        // ui->PortButton->setText("Start Listen");
       //  ui->Net_light->setStyleSheet("border-image: url(:/new/icon/picture/gray.png);");
    }


}
bool socket_SYS::server_New_Connect()
{
    sk=mainServer->nextPendingConnection();//can not use twice;
    //获取客户端连接
       if(sk->peerAddress().toString()=="192.168.3.3")
       {
           waveClient = sk;
           if(!waveClient)
           {
                qDebug()<<"TCP_Connect false";
                qDebug()<<waveClient;
               return false;
           }
           else
           {
               qDebug()<<"TCP_Connect success";
               qDebug()<<waveClient->peerAddress();
               qDebug()<<waveClient->peerPort();
               connect(waveClient, SIGNAL(readyRead()), this, SLOT(wave_socket_Read_Data()));
               connect(waveClient, SIGNAL(disconnected()), this, SLOT(wave_socket_Disconnected()));
               return true;

           }
       }
       else
       {
           controlClient = sk;
           if(!controlClient)
           {
               return false;
           }
           else
           {
               qDebug()<<"TCP_Connect success";
               qDebug()<<controlClient->peerAddress();
               qDebug()<<controlClient->peerPort();
               connect(controlClient, SIGNAL(readyRead()), this, SLOT(control_socket_Read_Data()));
               connect(controlClient, SIGNAL(disconnected()), this, SLOT(control_socket_Disconnected()));
               return true;

           }
       }





}
void socket_SYS::start_listening()
{
//    if(!severStatus)
//    {
//        socket_Int();
//        severStatus=true;
//    }

//    socket_Listening();

}
void socket_SYS::wave_socket_Read_Data()
{
    QByteArray wavedata =  waveClient->readAll();
    qDebug()<<"dasdasd";
}
void socket_SYS::wave_socket_Disconnected()
{

}
void socket_SYS::control_socket_Read_Data()
{

}
void socket_SYS::control_socket_Disconnected()
{

}
