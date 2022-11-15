#ifndef MYSTRUCT_H
#define MYSTRUCT_H

#include <QObject>
#include <QMetaType>


typedef  enum MoveModel
{

     Up=0,
     Down=1,
     Start=2,
     Stop=3,
     Release=4,
     Recover=5

}MoveModel;



struct waveMSG
{

    int wave_Channel;
    int wave_Amplitude;
    int wave_Number;
    int wave_SampleNumber;
    int wave_SampleFrequency;
    int wave_Frequency;
    int wave_ReceiveGain;

};
Q_DECLARE_METATYPE(waveMSG);
struct controlMSG
{
    double moveUp_Length;
    double moveDown_Length;
    double pushUp_Length;;
    double pushDown_Length;;
    double autoPushDown_Length;
    double pushDown_step;

};
Q_DECLARE_METATYPE(controlMSG);
struct monitoredMSG
{

    double control_Power;
    double impetus_Power;
    double equipment_Pitch;
    double equipment_Yaw;
    double equipment_Roll;
    double rotate_Angle;
    double water_Depth;
    double transducer_Pressure;
    double cylinder_Pressure;
    double distance2Base;
    double push_Length;
    double move_length;

};
Q_DECLARE_METATYPE(monitoredMSG);

class mystruct: public QObject
{
    Q_OBJECT

public:

    mystruct();
};

#endif // MYSTRUCT_H







