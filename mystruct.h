#ifndef MYSTRUCT_H
#define MYSTRUCT_H

#include <QObject>
#include <QMetaType>


struct waveMSG
{

    double Max;
    double Min;



};
Q_DECLARE_METATYPE(waveMSG);

class mystruct: public QObject
{
    Q_OBJECT
public:
    mystruct();



};

#endif // MYSTRUCT_H
