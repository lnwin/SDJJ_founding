#ifndef THREADPOND_H
#define THREADPOND_H
#include <QObject>
#include <QThread>

class threadPond : public QObject
{
    Q_OBJECT
public:
    threadPond();
};

#endif // THREADPOND_H
