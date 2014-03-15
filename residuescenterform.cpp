#include <QtCore>
#include <QtGui>
#include <QtSql>
#include <QTimer>
#include <QStatusBar>
#include "mainwindow.h"
#include "residuescenterform.h"
#include "ui_residuescenterform.h"

residuesCenterForm::residuesCenterForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::residuesCenterForm)
{
    ui->setupUi(this);

    residuesCenterForm::showMaximized();

    timerCenter = new QTimer(this);
    timerCenter->setInterval(3000);
    connect(timerCenter, SIGNAL(timeout()),this,SLOT(updateResiduesCenter()));
    connect(ui->pushButtonUpdate,SIGNAL(clicked()),this,SLOT(updateResiduesCenter()));

    getResiduesList();
    startUpdate();

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
    qDebug() << QObject::trUtf8("Residues Center Update Start");
}

void residuesCenterForm::stopUpdate(){
    timerCenter->stop();
    qDebug() << QObject::trUtf8("Residues Center Update Stop");
}

void residuesCenterForm::getResiduesList(){

    QSqlDatabase::database();
    QSqlQueryModel *dataViewCenter = new QSqlQueryModel;
    dataViewCenter->setQuery("SELECT * FROM public.dishcenterview");
    dataViewCenter->setHeaderData(0,Qt::Horizontal, QObject::trUtf8("ID"));
    dataViewCenter->setHeaderData(1,Qt::Horizontal, QObject::trUtf8("Filial"));
    dataViewCenter->setHeaderData(2,Qt::Horizontal, QObject::trUtf8("Menu"));
    dataViewCenter->setHeaderData(3,Qt::Horizontal, QObject::trUtf8("Count"));
    dataViewCenter->setHeaderData(4,Qt::Horizontal, QObject::trUtf8("Emergency Count"));
    dataViewCenter->setHeaderData(5,Qt::Horizontal, QObject::trUtf8("Latest Update"));
    dataViewCenter->setHeaderData(6,Qt::Horizontal, QObject::trUtf8("Expiry Date"));
    ui->centerTableView->setModel(dataViewCenter);
    ui->centerTableView->hideColumn(0);
    ui->centerTableView->verticalHeader()->hide();

}

void residuesCenterForm::updateResiduesCenter(){
    QString messageUpdate;
    messageUpdate = QObject::trUtf8("%1 %2").arg("Residues Center Update In:").arg(QDateTime::currentDateTime().toString());
    qDebug() << messageUpdate;
    getResiduesList();
}

void residuesCenterForm::dataToTable(){

}

residuesCenterForm::~residuesCenterForm()
{
    stopUpdate();
    delete ui;
}
