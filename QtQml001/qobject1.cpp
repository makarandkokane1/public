#include "qobject1.h"

QObject1::QObject1(QObject *parent)
    : QObject{parent}
{
}

void QObject1::init(QQmlApplicationEngine& e)
{
    QQmlContext* c = e.rootContext();
    c->setContextProperty("qobject1", qObjVar(this));
}

void QObject1::setItem(const QString& name, QObject* item)
{
    _namedObjects[name.toStdString()] = item;
    qDebug() << _namedObjects["mainWindow"];
}

void QObject1::emitSignal1()
{
    static int param1 = 20;
    param1++;
    qDebug() << "Emitting signal1.";
    emit signal1(param1);
}
