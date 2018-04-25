#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtNetwork>
#include <QString>
#include <QStandardPaths>
#include <QFont>

//Standard-C-Datei für QML, keine eigenen Erweiterungen
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    //QFont newFont("Helvetica", 8, QFont::Bold, true);
    //app.setFont(newFont);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
