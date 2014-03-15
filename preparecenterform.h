#ifndef PREPARECENTERFROM_H
#define PREPARECENTERFROM_H

#include <QWidget>
#include <QtCore>
#include <QtGui>
#include <QTimer>
#include <QtSql>
#include "mainwindow.h"

namespace Ui {
class preparecenterform;
}

class preparecenterform : public QWidget
{
    Q_OBJECT

public:
    QString dataFilter;
    QString isodate;
    explicit preparecenterform(QWidget *parent = 0);
    ~preparecenterform();

private:
    Ui::preparecenterform *ui;
    QTimer *timerPrepare;
    int step;

public slots:
    void getData();
    void showMessageStatusBar(QString);

private slots:
    void updateData();
    void nextDay();
    void previousDay();

private:
//    QTableView *tableViewPrepare;

protected:
    void timerEvent(QTimerEvent *event);

};

#endif // PREPARECENTERFROM_H
