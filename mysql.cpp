#include "mysql.h"
#include <QApplication>
#include <QMessageBox>
mysql::mysql()
{



}
 mysql::~mysql()
 {
    db.close();
 };
void mysql::creatDB()
{
           db = QSqlDatabase::addDatabase("QSQLITE");//设置驱动，设置数据库类型,
           db.setDatabaseName("C:/Users/Administrator/Desktop/test//Mydat.db");//设置数据库名
           if(db.open())
               {
                  emit sendSqlState2T(QStringLiteral("连接数据库成功！\n"));
               if(checkList())
               {
                   emit sendSqlState2T(QStringLiteral("操作记录已存在！\n"));
               }
               else
               {
                   emit sendSqlState2T(QStringLiteral("操作记录不存在！\n"));
                   creatList();

               }

               }
           else
           {
                  emit sendSqlState2T(QStringLiteral("连接数据库失败！请检查数据库连接地址。\n"));
           }



 };
bool mysql::checkList()
{
    QSqlQuery query(db);
    QString selectsql;
     selectsql ="select * from sqlite_master where type = 'table' and name = 'myRecord'" ;//是否已经存在表myRecord
     query.exec(selectsql);

     if(query.next())
     {

         return true;

     }
     else
     {

         return false;
     }



};
void mysql::addMSG(QString MSG,QString date)
{
     QString MT=myCurrentTime.currentDateTime().toString("yyyy.MM.dd_hh:mm:ss");
     QString order=QString("INSERT INTO myRecord (time,action,data)VALUES ('%1','%2','%3')").arg(MT).arg(MSG).arg(date);
     QSqlQuery query;//执行SQL的语法
     query.exec(order);
     if(query.next())
     {
        emit sendSqlState2T(QStringLiteral("添加操作记录成功！\n"));
     }
}
void mysql::creatList()
{
           QSqlQuery query;
           //创建表
           bool success = query.exec("CREATE TABLE myRecord ("
                                    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                                    "time VARCHAR(40) NOT NULL, "
                                    "action VARCHAR(40) NOT NULL, "
                                    "data VARCHAR(40) NOT NULL)");
           if(success)
           {
               emit sendSqlState2T(QStringLiteral("创建新的操作记录成功！\n"));
               //addMSG("do something","");
           }
           else
           {
               emit sendSqlState2T(QStringLiteral("创建新的操作记录失败！\n"));
           }


}
void mysql::closeDB()
{
    db.close();
};
