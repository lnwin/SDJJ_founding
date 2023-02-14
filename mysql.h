#ifndef MYSQL_H
#define MYSQL_H
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QObject>
#include <mystruct.h>
#include <QDateTime>
class mysql: public QObject
{
    Q_OBJECT
public:
    mysql();
     ~mysql();
    QSqlDatabase db;//创建数据库
    void creatDB();
    void addMSG(QString MSG,QString date);
    bool checkList();
    void creatList();
    void closeDB();
signals:
    void sendSqlState2T(QString);
private:
    QDateTime myCurrentTime;
};

#endif // MYSQL_H
