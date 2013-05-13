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
    residuesCenterForm::showMaximized();

    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()),this,SLOT(update()));
    getResiduesList();
}

void residuesCenterForm::timerEvent(QTimerEvent *event){
    if(event->timerId() == timer->timerId()){
        ++step;
        updateResidues();
    }
    else {
        QObject::timerEvent(event);
    }
}

void residuesCenterForm::startUpdate(){
    timer->start();
    qDebug() << "Start Update";
}

void residuesCenterForm::stopUpdate(){
    timer->stop();
    qDebug() << "Stop Update";
}

void residuesCenterForm::getResiduesList(){

    QSqlDatabase::database();
    QSqlQueryModel *dataView = new QSqlQueryModel;
    dataView->setQuery("SELECT * FROM public.\"getResidues\"(1)");
    dataView->setHeaderData(0,Qt::Horizontal, trUtf8("ID"));
    dataView->setHeaderData(1,Qt::Horizontal, trUtf8("Меню"));
    dataView->setHeaderData(2,Qt::Horizontal, trUtf8("Точка"));
    dataView->setHeaderData(3,Qt::Horizontal, trUtf8("Кол-во"));
    dataView->setHeaderData(4,Qt::Horizontal, trUtf8("Срочное кол-во"));
    dataView->setHeaderData(5,Qt::Horizontal, trUtf8("Последнее обновлние"));
    ui->tableView->setModel(dataView);
    ui->tableView->hideColumn(0);
    ui->tableView->verticalHeader()->hide();
}

void residuesCenterForm::updateResidues(){

}

void residuesCenterForm::dataToTable(){

}

residuesCenterForm::~residuesCenterForm()
{
    delete ui;
}
