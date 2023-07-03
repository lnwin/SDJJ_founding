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
   // qDebug()<< "Socket init thread"<<QThread::currentThread();
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
               socketIsConnected=true;
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
   // QByteArray waveData = waveClient->readAll();
   // QByteArray waveDataC1;
   // waveDataC1[0]= waveData.at(6);
   // waveDataC1[1]= waveData.at(7);
    //int C1=waveDataC1.toHex().toInt(0,16);
   // QByteArray waveDataforcheck=waveData.remove(6,2);
   // uint16_t C2=CRC->ModbusCRC16(waveDataforcheck);


    qDebug()<<"waveData";
}
void socket_SYS::wave_socket_Disconnected()
{
     emit sendSocketState2T(QStringLiteral("声学网络已断开！\n"));
}
void socket_SYS::control_socket_Read_Data()
{

    QByteArray controlData = controlClient->readAll();


   // qDebug()<<controlData.toHex();
    QByteArray controlDataC1;
    controlDataC1=controlData.mid(39,2);
    int C1=controlDataC1.toHex().toInt(0,16);
    QByteArray controlDataforcheck=controlData.mid(0,39);
    uint16_t C2=CRC->ModbusCRC16(controlDataforcheck);
    QVariantList val;

    if(C1==C2)
    {

         float RollAngle=(float(controlData.mid(2,2).toHex().toInt(0,16)*180)/32768);
         val.append(RollAngle);

         float PitchAngle=(float(controlData.mid(4,2).toHex().toInt(0,16))*180)/32768;
         val.append(PitchAngle);
         float YawAngle=(float(controlData.mid(6,2).toHex().toInt(0,16))*180)/32768;
         val.append(YawAngle);
         float Depth =controlData.mid(8,2).toHex().toInt(0,16)*1000;//单位毫米
               Depth +=controlData.mid(10,2).toHex().toInt(0,16);
               Depth=Depth/1000;
               val.append(Depth);
             //  qDebug()<<"Depth========="<<Depth;
         float Tofloor =controlData.mid(12,2).toHex().toInt(0,16)*1000;//单位毫米
               Tofloor+=controlData.mid(13,1).toHex().toInt(0,16);//单位毫米
               val.append(Tofloor);
           //    qDebug()<<"Tofloor========="<<Tofloor;
         float ArmAngle= controlData.mid(15,2).toHex().toInt(0,16)*0.01-88;//单位毫米
         val.append(ArmAngle);
        // qDebug()<<"ArmAngle========="<<ArmAngle;
        // float TGMoveLength =float(float(controlData.mid(17,2).toHex().toInt(0,16))-819)*3100/(4095-819);//单位毫米
         float TGMoveLength =float(float(controlData.mid(17,2).toHex().toInt(0,16)));//单位毫米
         val.append(TGMoveLength);
        //  qDebug()<<"TGMoveLength= ORIGIN========"<<controlData.mid(17,2).toHex().toInt(0,16);
        // qDebug()<<"TGMoveLength========="<<TGMoveLength;
         float ArmMoveLength =float(float(controlData.mid(19,2).toHex().toInt(0,16))-819)*210/(4095-819);//单位毫米
         val.append(ArmMoveLength);

        // qDebug()<<"ArmMoveLength========="<<ArmMoveLength;
         float ArmPress =float(float(controlData.mid(21,2).toHex().toInt(0,16))-819)*250/(4095-819)*0.1;//单位bar
         val.append(ArmPress);
        // qDebug()<<"ArmPress========="<<ArmPress;
         float YYPress =float(float(controlData.mid(23,2).toHex().toInt(0,16))-819)*250/(4095-819)*0.1;//单位bar
         val.append(YYPress);
       // qDebug()<<"YYPress========="<<YYPress;

         float battery_0 =float(float(controlData.mid(25,2).toHex().toInt(0,16))-819)*50/(4095-819);//控制电池1
         val.append(battery_0);
         float battery_1 =float(float(controlData.mid(27,2).toHex().toInt(0,16))-819)*50/(4095-819);//声学电池2
         val.append(battery_1);
         float battery_2 =float(float(controlData.mid(29,2).toHex().toInt(0,16))-819)*100/(4095-819);//动力电池3
         val.append(battery_2);

         int zdState =int(controlData.mid(31,1).toHex().toInt(0,16));//单位bar
         if(zdState==0)
         {
             zhendongOPEN=false;
         }
         else
         {
              zhendongOPEN=true;
         }

         val.append(zdState);
         int yyState =int(controlData.mid(32,1).toHex().toInt(0,16));//单位bar
         if(yyState==0)
         {
             yeyaOPEN=false;
         }
         else
         {
              yeyaOPEN=true;
         }
         val.append(yyState);
         int sbState =int(controlData.mid(33,1).toHex().toInt(0,16));//单位bar
         if(sbState==0)
         {
             shuibengOPEN=false;
         }
         else
         {
              shuibengOPEN=true;
         }
         val.append(sbState);
         int zjState =int(controlData.mid(34,1).toHex().toInt(0,16));//单位bar
         if(zjState==0)
         {
              zuanjinOPEN=false;
         }
         else
         {
              zuanjinOPEN=true;
         }
         val.append(zjState);
         int xjState =int(controlData.mid(35,1).toHex().toInt(0,16));//单位bar
         val.append(xjState);
         int zmState =int(controlData.mid(36,1).toHex().toInt(0,16));//单位bar
         val.append(zmState);
         int gzmoshi= int(controlData.mid(37,1).toHex().toInt(0,16));
         if(gzmoshi==0)
         {
              modCYcle=0;
         }
         else if(gzmoshi==1)
         {
              modCYcle=1;
         }
         else
         {
               modCYcle=2;
         }

         val.append(gzmoshi);
         int donglistate= int(controlData.mid(38,1).toHex().toInt(0,16));
         if(donglistate==0)
         {
              donglidianOPEN=false;
         }
         else
         {
              donglidianOPEN=true;
         }
         val.append(donglistate);


         emit sendcontrolMSG2T(val);
         qDebug()<<"gongzuomoshi_iszuanjin==="<<gongzuomoshi_iszuanjin;
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
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
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
         MSG[3]=0x02;
         if(length==0)
         {
             MSG[4]=0xff;
             MSG[5]=0xff;
         }
         else
         {
             MSG[4]=length>>8;
             MSG[5]=(length<<8)>>8;
         }



     }
     else if(type==Down)
     {
          MSG[3]=0x01;
          if(length==0)
          {
              MSG[4]=0xff;
              MSG[5]=0xff;
          }
          else
          {
              MSG[4]=length>>8;
              MSG[5]=(length<<8)>>8;
          }

     }
     else
     {
         MSG[3]=0x00;
         MSG[4]=0xff;
         MSG[5]=0xff;


     }
     uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
     MSG[6]=C2>>8;
     MSG[7]=(C2<<8)>>8;
     controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }



};
void socket_SYS::ControlARMST(int type)
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x04;
        if(type==Release)
        {

            MSG[3]=0x01;
            MSG[4]=0xff;
            MSG[5]=0xff;
        }
        else if(type==Stop)
        {
            MSG[3]=0x00;
            MSG[4]=0xff;
            MSG[5]=0xff;
        }

        else if (type==Recover)
        {
            MSG[3]=0x02;
            MSG[4]=0xff;
            MSG[5]=0xff;

        }

        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }


}
void socket_SYS::ControlARMMove(int type,int length)
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x04;
        if(type==Up)
        {

            MSG[3]=0x03;
            if(length==0)
            {
                MSG[4]=0xff;
                MSG[5]=0xff;
            }
            else
            {
                MSG[4]=length>>8;
                MSG[5]=(length<<8)>>8;
            }
        }
        else if(type==Down)
        {
            MSG[3]=0x04;
            if(length==0)
            {
                MSG[4]=0xff;
                MSG[5]=0xff;
            }
            else
            {
                MSG[4]=length>>8;
                MSG[5]=(length<<8)>>8;
            }
        }

        else if (type==Stop)
        {
            MSG[3]=0x05;
            MSG[4]=0xff;
            MSG[5]=0xff;

        }

        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }

};


void socket_SYS:: zhendongKZ()
{


   // qDebug()<<"zhendongOPEN===="<<zhendongOPEN;
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x06;
        if(!zhendongOPEN)
        {

            MSG[3]=0x01;
           // zhendongOPEN=true;

        }
        else
        {
            MSG[3]=0x00;
           // zhendongOPEN=false;
        }
        MSG[4]=0x00;
        MSG[5]=0x00;
        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);

       // qDebug()<<"zhendongOPEN ===="<<MSG;
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }


}
void socket_SYS:: shuibengKZ()
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x07;
        if(!shuibengOPEN)
        {

            MSG[3]=0x01;
           // shuibengOPEN=true;

        }
        else
        {
            MSG[3]=0x00;
           // shuibengOPEN=false;
        }
        MSG[4]=0x00;
        MSG[5]=0x00;
        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }

}
void socket_SYS:: zhuanjinKZ()
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x08;
        if(!zuanjinOPEN)
        {

            MSG[3]=0x01;
            //zuanjinOPEN=true;

        }
        else
        {
            MSG[3]=0x00;
           //zuanjinOPEN=false;
        }
        MSG[4]=0x00;
        MSG[5]=0x00;
        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }

}

void socket_SYS::gongzuoKZ()
{


    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x0a;
       if(modCYcle==0)
       {

           MSG[3]=0x01;
           //zuanjinOPEN=true;
         // modCYcle+=1;

       }

       else if(modCYcle==1)
       {

           MSG[3]=0x02;
          // zuanjinOPEN=false;
         //  modCYcle+=1;

       }

       else if (modCYcle==2)
       {

           MSG[3]=0x00;
          // modCYcle=0;

       }


      // ui->amplingLength->setText("");


       MSG[4]=0x00;
       MSG[5]=0x00;
       uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
       MSG[6]=C2>>8;
       MSG[7]=(C2<<8)>>8;
       controlClient->write(MSG);
        qDebug()<<"moshiqiehuan========="<<MSG;
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }



};
void socket_SYS::dongliKZ()
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x0b;
       if(!donglidianOPEN)
       {

           MSG[3]=0x01;
           //zuanjinOPEN=true;

       }
       else
       {
           MSG[3]=0x00;
          // zuanjinOPEN=false;
       }
       MSG[4]=0x00;
       MSG[5]=0x00;
       uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
       MSG[6]=C2>>8;
       MSG[7]=(C2<<8)>>8;
       controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }

};

void socket_SYS::yeyaKZ()
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x05;
        if(!yeyaOPEN)
        {

            MSG[3]=0x01;
            //yeyaOPEN=true;

        }
        else
        {
            MSG[3]=0x00;
           // yeyaOPEN=false;
        }
        MSG[4]=0x00;
        MSG[5]=0x00;
        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }


}

void socket_SYS::getShutDown()
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x10;
        MSG[3]=0x01;
        MSG[4]=0x00;
        MSG[5]=0x00;
        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }

}
void socket_SYS::getCircle(int cout,int step)
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x09;
        MSG[3]=cout;
        MSG[4]=step>>8;
        MSG[5]=(step<<8)>>8;
        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }

}
void socket_SYS::getCameraPower(bool BB)
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x01;
        if(BB)
        {
            MSG[3]=0x01;
        }
        else
        {
            MSG[3]=0x00;
        }

        MSG[4]=0x00;
        MSG[5]=0x00;
        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }


};
void socket_SYS::getLightPower(bool BB)
{
    if(socketIsConnected)
    {
        QByteArray MSG;
        MSG.resize(8);
        MSG[0]=0x01;
        MSG[1]=0x06;
        MSG[2]=0x02;
        if(BB)
        {
            MSG[3]=0x01;
        }
        else
        {
            MSG[3]=0x00;
        }

        MSG[4]=0x00;
        MSG[5]=0x00;
        uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
        MSG[6]=C2>>8;
        MSG[7]=(C2<<8)>>8;
        controlClient->write(MSG);
    }
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }




};
void socket_SYS::setMSpeed(int shuibengspeed,int zuanjinspeed)
{
    if(socketIsConnected)
    {
    QByteArray MSG;
    MSG.resize(8);
    MSG[0]=0x01;
    MSG[1]=0x06;
    MSG[2]=0x0c;
    MSG[3]=0x00;
    if(shuibengspeed==0)
    {
        MSG[4]=0xff;
        MSG[5]=0xff;
    }
    else
    {
        MSG[4]=shuibengspeed>>8;
        MSG[5]=(shuibengspeed<<8)>>8;
    }
    uint16_t C2=CRC->ModbusCRC16(MSG.mid(0,6));
    MSG[6]=C2>>8;
    MSG[7]=(C2<<8)>>8;
    controlClient->write(MSG);



    MSG.resize(8);
    MSG[0]=0x01;
    MSG[1]=0x06;
    MSG[2]=0x0d;
    MSG[3]=0x00;
    if(zuanjinspeed==0)
    {
        MSG[4]=0xff;
        MSG[5]=0xff;
    }
    else
    {
        MSG[4]=zuanjinspeed>>8;
        MSG[5]=(zuanjinspeed<<8)>>8;
    }
    uint16_t C3=CRC->ModbusCRC16(MSG.mid(0,6));
    MSG[6]=C3>>8;
    MSG[7]=(C3<<8)>>8;
    controlClient->write(MSG);
}
    else
    {
         emit sendSocketState2T(QStringLiteral("网络未连接！\n"));
    }



}
