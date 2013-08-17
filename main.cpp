#include <QApplication>
#include <QTranslator>
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QTranslator translation;
    translation.load("fcc_ru");
    a.installTranslator(&translation);
    MainWindow w;
    w.show();
    
    return a.exec();
}
