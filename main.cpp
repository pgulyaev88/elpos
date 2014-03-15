#include <QApplication>
#include <QTranslator>
#include <QDebug>
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QTranslator translation;
    translation.load("fcc_ru.ts");
    if(translation.isEmpty()){
        qDebug() << QObject::trUtf8("Do not find translation file");
    }
    a.installTranslator(&translation);
    MainWindow w;
    w.show();
    
    return a.exec();
}
