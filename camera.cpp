﻿#include <HCNetSDK.h>
#include "camera.h"
#include <iostream>
HWND CameraWidget_0,CameraWidget_1;
LONG lUserID_0,lUserID_1;
LONG lRealPlayHandle_0,lRealPlayHandle_1;
using namespace std;
void CALLBACK g_ExceptionCallBack(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser);
camera::camera(QObject *parent) : QObject(parent)
{

}
bool camera::cameraInit(HWND CM_0,HWND CM_1)
{

    CameraWidget_0=CM_0;
    CameraWidget_1=CM_1;
    //---------------------------------------
    //初始化
    if(  NET_DVR_Init())
    {
        NET_DVR_SetConnectTime(2000, 1);
        NET_DVR_SetReconnect(10000, true);
        //设置异常消息回调函数
        NET_DVR_SetExceptionCallBack_V30(0, NULL,g_ExceptionCallBack, NULL);
         //设置连接时间与重连时间
         return true;
    }
       else
    {
        return false;
    }




};
bool camera::longID()
{
    //---------------------------------------
    // 注册设备==0
    NET_DVR_USER_LOGIN_INFO struLoginInfo_0 = {0};
    NET_DVR_DEVICEINFO_V40 struDeviceInfo_0 = {0};
    strcpy((char *)struLoginInfo_0.sDeviceAddress,"192.168.1.64"); //设备 IP 地址
    strcpy((char *)struLoginInfo_0.sUserName,"admin"); //设备登录用户名
    strcpy((char *)struLoginInfo_0.sPassword,"cmr12345"); //设备登录密码
    struLoginInfo_0.wPort = 8000;
    struLoginInfo_0.bUseAsynLogin = 0; //同步登录，登录接口返回成功即登录成功
    lUserID_0 = NET_DVR_Login_V40(&struLoginInfo_0, &struDeviceInfo_0);
    if(lUserID_0 < 0)
    {
 //        QMessageBox msgBox;
//        msgBox.setText("Camera long false");
//        msgBox.exec();
        return false;

    }
    else
    {
//        QMessageBox msgBox;
//        msgBox.setText("Camera long success");
//        msgBox.exec();
        return  true;
    }


}
bool camera::longID_1()
{
    //---------------------------------------
    // 注册设备==0
    NET_DVR_USER_LOGIN_INFO struLoginInfo_1 = {0};
    NET_DVR_DEVICEINFO_V40 struDeviceInfo_1 = {0};
    strcpy((char *)struLoginInfo_1.sDeviceAddress,"192.168.1.65"); //设备 IP 地址
    strcpy((char *)struLoginInfo_1.sUserName,"admin"); //设备登录用户名
    strcpy((char *)struLoginInfo_1.sPassword,"cmr12345"); //设备登录密码
    struLoginInfo_1.wPort = 8000;
    struLoginInfo_1.bUseAsynLogin = 0; //同步登录，登录接口返回成功即登录成功
    lUserID_1 = NET_DVR_Login_V40(&struLoginInfo_1, &struDeviceInfo_1);
    if(lUserID_1 < 0)
    {
 //        QMessageBox msgBox;
//        msgBox.setText("Camera long false");
//        msgBox.exec();
        return false;

    }
    else
    {
//        QMessageBox msgBox;
//        msgBox.setText("Camera long success");
//        msgBox.exec();
        return  true;
    }
}
bool camera::realPlayer()
{
    //---------------------------------------
    //启动预览

    NET_DVR_PREVIEWINFO struPlayInfo_0 = {0};
    struPlayInfo_0.hPlayWnd = CameraWidget_0; //需要 SDK 解码时句柄设为有效值，仅取流不解码时可设为空
    struPlayInfo_0.lChannel = 1; //预览通道号
    struPlayInfo_0.dwStreamType = 0; //0-主码流， 1-子码流， 2-码流 3， 3-码流 4，以此类推
    struPlayInfo_0.dwLinkMode = 0; //0- TCP 方式， 1- UDP 方式， 2- 多播方式， 3- RTP 方式， 4-RTP/RTSP， 5-RSTP/HTTP
    struPlayInfo_0.bBlocked = 1; //0- 非阻塞取流， 1- 阻塞取流
    lRealPlayHandle_0 = NET_DVR_RealPlay_V40(lUserID_0, &struPlayInfo_0, NULL, NULL);
    if (lRealPlayHandle_0 < 0)
    {
      printf("NET_DVR_RealPlay_V40 failed, error code: %d\n", NET_DVR_GetLastError());
      NET_DVR_Logout(lUserID_0);
      NET_DVR_Cleanup();
      return false;
    }
    else
    {
       return true;
    }
    //---------------------------------------

};
bool camera::realPlayer_1()
{
    //启动预览

    NET_DVR_PREVIEWINFO struPlayInfo_1 = {0};
    struPlayInfo_1.hPlayWnd = CameraWidget_1; //需要 SDK 解码时句柄设为有效值，仅取流不解码时可设为空
    struPlayInfo_1.lChannel = 1; //预览通道号
    struPlayInfo_1.dwStreamType = 0; //0-主码流， 1-子码流， 2-码流 3， 3-码流 4，以此类推
    struPlayInfo_1.dwLinkMode = 0; //0- TCP 方式， 1- UDP 方式， 2- 多播方式， 3- RTP 方式， 4-RTP/RTSP， 5-RSTP/HTTP
    struPlayInfo_1.bBlocked = 1; //0- 非阻塞取流， 1- 阻塞取流
    lRealPlayHandle_1 = NET_DVR_RealPlay_V40(lUserID_1, &struPlayInfo_1, NULL, NULL);
    if (lRealPlayHandle_1 < 0)
    {
      printf("NET_DVR_RealPlay_V40 failed, error code: %d\n", NET_DVR_GetLastError());
      NET_DVR_Logout(lUserID_1);
      NET_DVR_Cleanup();
      return false;
    }
    else
    {
       return true;
    }
}
bool camera::stopRealPlay()
{
    //---------------------------------------
    //关闭预览
    NET_DVR_StopRealPlay(lRealPlayHandle_0);
    //注销用户
  //  NET_DVR_Logout(lUserID);
    //释放 SDK 资源
   // NET_DVR_Cleanup();
    //---------------------------------------
    //关闭预览
    NET_DVR_StopRealPlay(lRealPlayHandle_1);
    //注销用户
  //  NET_DVR_Logout(lUserID);
    //释放 SDK 资源
   // NET_DVR_Cleanup();
    return true;
};
void CALLBACK g_ExceptionCallBack(DWORD dwType, LONG lUserID, LONG lHandle, void *pUser)
{
char tempbuf[256] = {0};
switch(dwType)
{
case EXCEPTION_RECONNECT: //预览时重连
printf("----------reconnect--------%d\n", time(NULL));
break;
default:
break;
}
}
