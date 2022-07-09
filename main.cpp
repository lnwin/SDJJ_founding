#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <socket.h>
#include <camera.h>
#include <crc.h>
#include <qwidget.h>
#include <QApplication>
#include <qwindow.h>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
//    const QUrl url(QStringLiteral("qrc:/main.qml"));
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);

 //   QQmlApplicationEngine engine;
     engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    double camera_0_startX;
    double camera_0_startY;
    double camera_0_width;
    double camera_0_height;

    double camera_1_startX;
    double camera_1_startY;
    double camera_1_width;
    double camera_1_height;

    QObject *QmlObj=engine.rootObjects().first();//获取QMl的源对象
    QWindow *QmlWindow=qobject_cast<QWindow *>(QmlObj);//获取qml在的源窗口
    QmlWindow->setTitle("CENTER");//设置一个窗口标签，确认自己拿到的窗口句柄就是自己想要的
    WId parent_HWND = QmlWindow->winId();  //Qml窗口的句柄
    QWidget camera_0; //新建一个Widget
    camera_0.setGeometry(QmlWindow->width()*0.012,QmlWindow->height()*0.02,QmlWindow->width()/2*0.5,QmlWindow->height()/2*0.7);//设置widget的大小
    camera_0.setStyleSheet("background-color: #00112b; color: naviy;");//设置风格，方便辨识
    camera_0.setProperty("_q_embedded_native_parent_handle",QVariant(parent_HWND));//给widget父对象句柄赋值
    HWND CM_0 =(HWND)camera_0.winId();//必须调用，才能为widget创建句柄，否则将会失败
    camera_0.windowHandle()->setParent(QmlWindow);//同样是设置父窗口
    camera_0.show();
    QWidget camera_1; //新建一个Widget
    camera_1.setGeometry(QmlWindow->width()*0.012,QmlWindow->height()*0.025+QmlWindow->height()/2*0.7,QmlWindow->width()/2*0.5,QmlWindow->height()/2*0.7);//设置widget的大小
    camera_1.setStyleSheet("background-color: #00112b; color: naviy;");//设置风格，方便辨识
    camera_1.setProperty("_q_embedded_native_parent_handle",QVariant(parent_HWND));//给widget父对象句柄赋值
    HWND CM_1 =(HWND)camera_1.winId();//必须调用，才能为widget创建句柄，否则将会失败
    camera_1.windowHandle()->setParent(QmlWindow);//同样是设置父窗口
    camera_1.show();

    QmlWindow->showMaximized();
    QmlWindow->setFlags(Qt::FramelessWindowHint|Qt::WindowSystemMenuHint|Qt::WindowMinimizeButtonHint|Qt::Window);//这样设置任务栏不会消失
   // QmlWindow->showMaximized();
///创建相机窗口句柄
   camera *CAM;
   CAM =new camera();
   if(CAM->cameraInt(CM_0,CM_1))
   {
     qDebug()<<"SDK Int success!";
   }





    return app.exec();
}
