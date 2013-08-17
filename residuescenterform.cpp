#include <QtCore>
#include <QtGui>
#include <QtSql>
#include <QTimer>
#include <QStatusBar>
#include "residuescenterform.h"
#include "ui_residuescenterform.h"

residuesCenterForm::residuesCenterForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::residuesCenterForm)
{
    ui->setupUi(this);

    int width = QApplication::desktop()->width();
    int height = QApplication::desktop()->height();

    widthTableCenter = width-20;
    heightTableCenter = height-115;

    qDebug() << "width-main: " << widthTableCenter;
    qDebug() << "height-main: " << heightTableCenter;

    ui->centerTableView->resize(widthTableCenter,heightTableCenter);
    residuesCenterForm::showMaximized();

    timerCenter = new QTimer(this);
    timerCenter->setInterval(3000);
    connect(timerCenter, SIGNAL(timeout()),this,SLOT(update()));
    getResiduesList();
}

void residuesCenterForm::timerEvent(QTimerEvent *event){
    if(event->timerId() == timerCenter->timerId()){
        ++stepCenter;
        updateResiduesCenter();
    } else {
        QObject::timerEvent(event);
    }
}

void residuesCenterForm::startUpdate(){
    timerCenter->start();
    qDebug() << trUtf8("Start Update");
}

void residuesCenterForm::stopUpdate(){
    timerCenter->stop();
    qDebug() << trUtf8("Stop Update");
}

void residuesCenterForm::getResiduesList(){

    QSqlDatabase::database();
    QSqlQueryModel *dataViewCenter = new QSqlQueryModel;
    dataViewCenter->setQuery("SELECT * FROM public.\"getresiduescenter\"()");
    dataViewCenter->setHeaderData(0,Qt::Horizontal, trUtf8("ID"));
    dataViewCenter->setHeaderData(1,Qt::Horizontal, trUtf8("Menu"));
    dataViewCenter->setHeaderData(2,Qt::Horizontal, trUtf8("Filial"));
    dataViewCenter->setHeaderData(3,Qt::Horizontal, trUtf8("Count"));
    dataViewCenter->setHeaderData(4,Qt::Horizontal, trUtf8("Emergency Count"));
//    dataViewCenter->setHeaderData(4,Qt::Horizontal, trUtf8("Expiry Date"));
    dataViewCenter->setHeaderData(5,Qt::Horizontal, trUtf8("Latest Update"));
    ui->centerTableView->setModel(dataViewCenter);
    ui->centerTableView->hideColumn(0);
    ui->centerTableView->verticalHeader()->hide();
}

void residuesCenterForm::updateResiduesCenter(){

}

void residuesCenterForm::dataToTable(){

}

residuesCenterForm::~residuesCenterForm()
{
    delete ui;
}
