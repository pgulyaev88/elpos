#include "preparecenterform.h"
#include "mainwindow.h"
#include "ui_preparecenterform.h"
#include <QDebug>
#include <QtCore>
#include <QtGui>
#include <QtSql>
#include <QTimer>
#include <QStatusBar>
#include <QDateEdit>

preparecenterform::preparecenterform(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::preparecenterform)
{
    ui->setupUi(this);

    timerPrepare = new QTimer(this);
    connect(timerPrepare, SIGNAL(timeout()),this,SLOT(getData()));
    timerPrepare->setInterval(15000);
//    timerPrepare->setInterval(3000);
    ui->dateEdit->setDisplayFormat("dd.MM.yyyy");
//    connect(showMessageStatusBar(),SIGNAL(),MainWindow,SLOT());
//    showMessageStatusBar("test");
    connect(ui->dateEdit, SIGNAL(dateChanged(QDate)),this,SLOT(getData()));
    connect(ui->buttonNextDay, SIGNAL(clicked(bool)),this,SLOT(nextDay()));
    connect(ui->buttonPreviousDay, SIGNAL(clicked(bool)),this,SLOT(previousDay()));
//    ui->gridLayoutWidget->showMaximized();
    ui->tableViewPrepare->showMaximized();
    ui->dateEdit->calendarWidget()->setFirstDayOfWeek(Qt::DayOfWeek(1));
    getData();
    timerPrepare->start();

    //TODO: Create settings from calendar date
}

void preparecenterform::timerEvent(QTimerEvent *event){
    if(event->timerId() == timerPrepare->timerId()){
        ++step;
        updateData();
    }
    else {
        QObject::timerEvent(event);
    }
}


void preparecenterform::getData(){
    qDebug() << ui->dateEdit->date();
    timerPrepare->stop();
    qDebug() << "Timer Stop";

    QDate curDate = ui->dateEdit->date();

    QSqlDatabase::database();
    QSqlRelationalTableModel *tableModel = new QSqlRelationalTableModel;
    tableModel->setTable("prepares");
    tableModel->setEditStrategy(QSqlTableModel::OnFieldChange);
    tableModel->setJoinMode(QSqlRelationalTableModel::LeftJoin);
    tableModel->setRelation(1, QSqlRelation("restaurant","id","named"));
//    tableModel->setRelation(2, QSqlRelation("dates","dates_id","names"));
    tableModel->setRelation(3, QSqlRelation("times","id","hours"));
    tableModel->select();
//    isodate = curDate.toString(Qt::ISODate);
    dataFilter = QString("%1'%2'").arg("prepares.dates=").arg(curDate.toString(Qt::ISODate));
    qDebug() << dataFilter;
    tableModel->setFilter(dataFilter);
//    tableModel->setFilter("prepares.dates='22.12.2013'");
    qDebug() << tableModel->query().lastQuery();




    tableModel->setHeaderData(1,Qt::Horizontal, QObject::trUtf8("Restaurant"));
    tableModel->setHeaderData(2,Qt::Horizontal, QObject::trUtf8("Date"));
    tableModel->setHeaderData(3,Qt::Horizontal, QObject::trUtf8("Time"));
    tableModel->setHeaderData(4,Qt::Horizontal, QObject::trUtf8("Delivery"));
    tableModel->setHeaderData(5,Qt::Horizontal, QObject::trUtf8("Takeaway"));
    tableModel->sort(0,Qt::AscendingOrder);

    ui->tableViewPrepare->setModel(tableModel);
    ui->tableViewPrepare->verticalHeader()->hide();
    ui->tableViewPrepare->setColumnHidden(0,true);
    timerPrepare->start();
    qDebug() << QObject::trUtf8("Start Prepare Timer");
}

void preparecenterform::updateData(){

}

void preparecenterform::nextDay(){
    QDate currentDate = ui->dateEdit->date();
    qDebug() << currentDate;
    qDebug() << currentDate.toString(Qt::ISODate);
    QDate nextDate = currentDate.addDays(1);
    qDebug() << nextDate;
    qDebug() << nextDate.toString(Qt::ISODate);
    ui->dateEdit->setDate(nextDate);
}

void preparecenterform::previousDay(){
    QDate currentDate = ui->dateEdit->date();
    qDebug() << currentDate;
    qDebug() << currentDate.toString(Qt::ISODate);
    QDate previousDate = currentDate.addDays(-1);
    qDebug() << previousDate;
    qDebug() << previousDate.toString(Qt::ISODate);
    ui->dateEdit->setDate(previousDate);

}

void preparecenterform::showMessageStatusBar(QString){
//    MainWindow::messagesStatusBar(msg);
}

preparecenterform::~preparecenterform()
{
    timerPrepare->stop();
    qDebug() << QObject::trUtf8("Stop Prepare Timer");
    delete ui;
}
