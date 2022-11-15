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
   // qDebug()<< "Socket int ok";
   // qDebug()<<"Socket init thread"<<QThread::currentThread();
}
bool socket_SYS::socket_Listening()
{
    int port = 8087;

    if(!mainServer->isListening())
    {
       if(mainServer->listen(QHostAddress("192.168.1.100"), port))
      // if(mainServer->listen(QHostAddress::AnyIPv4, port))
        {
         // ui->textEdit->append("TCP_Sever is listeing");
         // ui->PortButton->setText("Stop Listen");
         // ui->Net_light->setStyleSheet("border-image: url(:/new/icon/picture/yellow.png);");
            connect(mainServer, SIGNAL(newConnection()), this, SLOT(server_New_Connect()));
         // connect(mainServer, SIGNAL(close()),this, SLOT(socket_SoptListening()));
         // qDebug()<<"mainServer listening ok";
            emit sendSocketState2T(QStringLiteral("监听成功！\n"));
            return  true;

         }
       else
       {
          // ui->textEdit->append("Listening failed, Plesas change TCP_Sever IP to >>192.168.1.65<<!");
          // qDebug()<<"TCP_Sever listen failed, Plesas change TCP_Sever IP to >>192.168.1.65<<!";
           //qDebug()<<"Socket isListening thread"<<QThread::currentThread();
            emit sendSocketState2T(QStringLiteral("监听失败, 请尝试将IP改为 >>192.168.1.100<<!\n"));
            return  false;

       }


     }

    else
    {
          mainServer->close();
          emit sendSocketState2T(QStringLiteral("监听已关闭！\n"));
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
                emit sendSocketState2T(QStringLiteral("声学网络连接失败！\n"));
               // qDebug()<<waveClient;
               return false;
           }
           else
           {
               emit sendSocketState2T(QStringLiteral("声学网络连接成功！\n"));
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
               emit sendSocketState2T(QStringLiteral("控制网络连接失败！\n"));
              // qDebug()<<waveClient;
               return false;
           }
           else
           {
               emit sendSocketState2T(QStringLiteral("控制网络连接成功！\n"));
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

    if(!severStatus)
    {
        socket_Int();
        severStatus=true;
    }
    socket_Listening();

}
void socket_SYS::wave_socket_Read_Data()
{
    QByteArray waveData = waveClient->readAll();
    QByteArray waveDataC1;
    waveDataC1[0]= waveData.at(6);
    waveDataC1[1]= waveData.at(7);
    int C1=waveDataC1.toHex().toInt(0,16);
    QByteArray waveDataforcheck=waveData.remove(6,2);
    uint16_t C2=CRC->ModbusCRC16(waveDataforcheck);



    qDebug()<<"waveData";
}
void socket_SYS::wave_socket_Disconnected()
{
     emit sendSocketState2T(QStringLiteral("声学网络已断开！\n"));
}
void socket_SYS::control_socket_Read_Data()
{
    QByteArray controlData = controlClient->readAll();
    QByteArray controlDataC1;
    controlDataC1[0]= controlData.at(31);
    controlDataC1[1]= controlData.at(32);
    int C1=controlDataC1.toHex().toInt(0,16);
    qDebug()<<"Received nO =="<<controlData.size();
    qDebug()<<"Received crc =="<<controlDataC1.toHex();
    QByteArray controlDataforcheck=controlData.mid(0,30);
    uint16_t C2=CRC->ModbusCRC16(controlDataforcheck);
    QVariantList val;
    qDebug()<<"controlDataforcheck =="<<controlDataforcheck.toHex();
    qDebug()<<"controlData =="<<controlData.toHex();
    qDebug()<<"c1=="<<C1;
    qDebug()<<"c2=="<<C2;
    if(C1==C2)
    {

         float RollAngle=float((controlData.mid(2,2).toHex().toInt(0,16)/32768)*180);
         val.append(RollAngle);
          qDebug()<<"RollAngle========="<<RollAngle;
         float PitchAngle=(float(controlData.mid(4,2).toHex().toInt(0,16))/32768)*180;
         val.append(PitchAngle);
         float YawAngle=(float(controlData.mid(6,2).toHex().toInt(0,16))/32768)*180;
         val.append(YawAngle);
         float Depth =controlData.mid(8,2).toHex().toInt(0,16)*1000;//单位毫米
               Depth +=controlData.mid(10,2).toHex().toInt(0,16);
               val.append(Depth);
         float Tofloor =controlData.mid(12,2).toHex().toInt(0,16)*1000;//单位毫米
               Tofloor+=controlData.mid(13,1).toHex().toInt(0,16);//单位毫米
               val.append(Tofloor);
         float ArmAngle= controlData.mid(15,2).toHex().toInt(0,16)*0.01;//单位毫米
         val.append(ArmAngle);
         float TGMoveLength =((controlData.mid(17,2).toHex().toInt(0,16))-819)/((4095-819)*500);//单位毫米
         val.append(TGMoveLength);
         float ArmMoveLength =((controlData.mid(19,2).toHex().toInt(0,16))-819)/((4095-819)*500);//单位毫米
         val.append(ArmMoveLength);
         float ArmPress =((controlData.mid(21,2).toHex().toInt(0,16))-819)/((4095-819)*500);//单位bar
         val.append(ArmPress);
         float YYPress =((controlData.mid(23,2).toHex().toInt(0,16))-819)/((4095-819)*500);//单位bar
         val.append(YYPress);
         emit sendcontrolMSG2T(val);
    }

    else
   {

      // qDebug()<<"CRC faile";
       emit sendSocketState2T(QStringLiteral("CRC校验失败！\n"));

   }


}
void socket_SYS::control_socket_Disconnected()
{
    emit sendSocketState2T(QStringLiteral("控制网络已断开！\n"));
}
void socket_SYS::ControlTG(int type,int length)
{

       QByteArray MSG;
       MSG[0]=0x01;
       MSG[1]=0x06;
       MSG[2]=0x03;
       MSG[3]=0x01;
       MSG[4]=length>>8;
       MSG[5]=(length<<8)>>8;
    // int C1=waveDataC1.toHex().toInt(0,16);
    // QByteArray waveDataforcheck=waveData.remove(6,2);

    if(type==Up)
    {
         MSG[3]=0x01;
         uint16_t C2=CRC->ModbusCRC16(MSG);
         MSG[6]=C2>>8;
         MSG[7]=(C2<<8)>>8;
         controlClient->write(MSG);
    }
    else if(type==Down)
    {
         MSG[3]=0x00;
         uint16_t C2=CRC->ModbusCRC16(MSG);
         MSG[6]=C2>>8;
         MSG[7]=(C2<<8)>>8;
         controlClient->write(MSG);
    }
    else
    {
        MSG[3]=0x00;
        MSG[4]=0xff;
        MSG[5]=0xff;
        uint16_t C2=CRC->ModbusCRC16(MSG);
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);

    }

};
void socket_SYS::ControlARMST(int type)
{};
void socket_SYS::ControlARMMove(int type,int length)
{};
