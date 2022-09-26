#ifndef QOBJECT1_H
#define QOBJECT1_H

#include <QObject>
#include <QQuickItem>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <unordered_map>

#define qObjVar(smt) QVariant::fromValue<QObject *>(smt)

class QObject1 : public QObject
{
    Q_OBJECT

public:

    explicit QObject1(QObject* parent = nullptr);
    void init(QQmlApplicationEngine& e);
    Q_INVOKABLE void setItem(const QString& name, QObject* item);
    Q_INVOKABLE void emitSignal1();

signals:

    void signal1(int param1);

private:

    std::unordered_map<std::string, QObject*> _namedObjects;
};

#endif // QOBJECT1_H
