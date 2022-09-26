#include <QGuiApplication>
#include "qobject1.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine e;

    QObject1 o1;
    o1.init(e);

    const QUrl url("qrc:/QtQml001/main.qml");
    QObject::connect(&e, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    e.load(url);

    return app.exec();
}
