#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>

class settings : public QObject
{
    Q_OBJECT
public:
    int idRest;
    QString restName;
    explicit settings(QObject *parent = 0);

signals:

public slots:
    void getSettings();


};

#endif // SETTINGS_H
