#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath("qrc:/qml");

    engine.loadFromModule("demo", "main");

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
