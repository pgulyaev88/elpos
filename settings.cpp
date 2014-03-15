#include <QSettings>
#include <QtCore>
#include "settings.h"

settings::settings(QObject *parent) :
    QObject(parent)
{
}

void settings::getSettings()
{
    QString fileName = "./param.ini";
    QSettings *settings = new QSettings(fileName,QSettings::IniFormat);
    if(settings->value("restaurant/id").isNull()){
       settings->setValue("restaurant/id",1);
    } else {
        idRest = settings->value("restaurant/id").toInt();
    }
        qDebug() << trUtf8("Restaurant ID:") << idRest;

    if(settings->value("restaurant/restname").isNull()){
        settings->setValue("restaurant/restname","Rest");
    } else {
        restName = settings->value("restaurant/restname").toString();
    }
    qDebug() << trUtf8("Restaurant Name:") << restName;

    //TODO: Settings for database.
}
