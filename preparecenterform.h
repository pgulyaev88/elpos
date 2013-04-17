#ifndef PREPARECENTERFORM_H
#define PREPARECENTERFORM_H

#include <QWidget>
#include <QtCore>
#include <QtGui>
#include <QTimer>
#include "mainwindow.h"

namespace Ui {
class prepareCenterForm;
}

class prepareCenterForm : public QWidget
{
    Q_OBJECT
    
protected:
    void timerEvent(QTimerEvent *event);

public:
    explicit prepareCenterForm(QWidget *parent = 0);
    ~prepareCenterForm();
    QWidget tab;
    QWidget tab2;

public slots:
    void createTab();
    void getData();
    void getData2();

private slots:
    void startUpdate();
    void stopUpdate();
    void updatePrepare();
//    void getDate();

//    void laodData(int dateID);

    
private:
    Ui::prepareCenterForm *ui;
    QTimer *timerPrepare;
    QTableView *tableViewPrepare;
    int step;
    int tabID;
    int dateID;
    QString dateName;
    QString tabName;


};

#endif // PREPARECENTERFORM_H
