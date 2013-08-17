#include <QtCore>
#include <QtGui>
#include <QtSql>
#include <QTimer>
#include <QStatusBar>
#include "preparecenterform.h"
#include "ui_preparecenterform.h"

prepareCenterForm::prepareCenterForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::prepareCenterForm)
{
    ui->setupUi(this);

    int widthtmpx = QApplication::desktop()->width();
    int heighttmpx = QApplication::desktop()->height();

    int widthx = widthtmpx-5;
    int heightx = heighttmpx-80;

    qDebug() << "width-prepare: " << widthx;
    qDebug() << "height-prepare: " << heightx;

//    prepareCenterForm::showMaximized();
    timerPrepare = new QTimer(this);
    connect(timerPrepare, SIGNAL(timeout()),this,SLOT(updatePrepare()));
    timerPrepare->setInterval(15000);
//    getDate();
    createTab();
    getData2();
    timerPrepare->start();

}

void prepareCenterForm::timerEvent(QTimerEvent *event){
    if(event->timerId() == timerPrepare->timerId()){
        ++step;
        updatePrepare();
    }
    else {
        QObject::timerEvent(event);
    }
}

void prepareCenterForm::startUpdate(){
    timerPrepare->start();
    qDebug() << trUtf8("Start Timer");
}

void prepareCenterForm::stopUpdate(){
    timerPrepare->stop();
    qDebug() << trUtf8("Stop Timer");
}

void prepareCenterForm::updatePrepare(){
//    ui->tabWidget->removeTab(ui->tabWidget->indexOf(0));
//    qDebug() << trUtf8("Индекс таба2") << ui->tabWidget->indexOf(&tab);
//    qDebug() << trUtf8("Индекс таба2") << ui->tabWidget->indexOf(&tab2);
//    createTab();
//    getData2();
    qDebug() << trUtf8("Update!");

    QSqlDatabase::database();
    QSqlRelationalTableModel *tableModel = new QSqlRelationalTableModel;
    tableModel->setTable("prepare");
    tableModel->setEditStrategy(QSqlTableModel::OnFieldChange);
    tableModel->setRelation(1, QSqlRelation("users","users_id","name"));
    tableModel->setRelation(2, QSqlRelation("dates","dates_id","name"));
    tableModel->setRelation(3, QSqlRelation("times","times_id","name"));
    tableModel->select();
    tableModel->setHeaderData(1,Qt::Horizontal, QObject::trUtf8("Точка"));
    tableModel->setHeaderData(2,Qt::Horizontal, QObject::trUtf8("Дата"));
    tableModel->setHeaderData(3,Qt::Horizontal, QObject::trUtf8("Время"));
    tableModel->setHeaderData(4,Qt::Horizontal, QObject::trUtf8("Доставка"));
    tableModel->setHeaderData(5,Qt::Horizontal, QObject::trUtf8("Вынос"));
    tableModel->sort(0,Qt::AscendingOrder);
//    tableModel->sort(2,Qt::AscendingOrder);
//    tableViewPrepare->resize(widthx2,heightx2);

    tableViewPrepare->setModel(tableModel);
    tableViewPrepare->verticalHeader()->hide();
    tableViewPrepare->setColumnHidden(0,true);
//    tableViewPrepare->setColumnHidden(0,true);

//    qDebug() << trUtf8("Индекс таба") << ui->tabWidget->indexOf(tab);

    QSqlDatabase::database();
    QSqlRelationalTableModel *tableModel2 = new QSqlRelationalTableModel;
    tableModel2->setTable("prepare2");
    tableModel2->setEditStrategy(QSqlTableModel::OnFieldChange);
    tableModel2->setRelation(1, QSqlRelation("users","users_id","name"));
    tableModel2->setRelation(2, QSqlRelation("dates","dates_id","name"));
    tableModel2->setRelation(3, QSqlRelation("times","times_id","name"));
    tableModel2->select();
    tableModel2->setHeaderData(1,Qt::Horizontal, QObject::trUtf8("Точка"));
    tableModel2->setHeaderData(2,Qt::Horizontal, QObject::trUtf8("Дата"));
    tableModel2->setHeaderData(3,Qt::Horizontal, QObject::trUtf8("Время"));
    tableModel2->setHeaderData(4,Qt::Horizontal, QObject::trUtf8("Доставка"));
    tableModel2->setHeaderData(5,Qt::Horizontal, QObject::trUtf8("Вынос"));
    tableModel2->sort(0,Qt::AscendingOrder);
//    tableViewPrepare->resize(widthx2,heightx2);

//    qDebug() << "width-prepare3: " << widthx;
//    /qDebug() << "height-prepare3: " << heightx;

    tableViewPrepare->setModel(tableModel2);
    tableViewPrepare->verticalHeader()->hide();
    tableViewPrepare->setColumnHidden(0,true);

//    tableViewPrepare->setColumnHidden(0,true);
//    qDebug() << trUtf8("Индекс таба2") << ui->tabWidget->indexOf(tab2);

}

void prepareCenterForm::createTab(){
    int widthtmpx = QApplication::desktop()->width();
    int heighttmpx = QApplication::desktop()->height();

    int widthx = widthtmpx-5;
    int heightx = heighttmpx-90;

//    qDebug() << "width-prepare: " << widthx;
//    qDebug() << "height-prepare: " << heightx;


    QWidget *tab = new QWidget;
    tableViewPrepare = new QTableView(tab);
    ui->tabWidget->addTab(tab,"07");
    ui->tabWidget->setCurrentIndex(0);
    ui->tabWidget->setMouseTracking(true);
    ui->tabWidget->resize(widthx,heightx);


    int widthx2 = widthtmpx-10;
    int heightx2 = heighttmpx-135;

//    qDebug() << "width-prepare2: " << widthx2;
//    qDebug() << "height-prepare2: " << heightx2;

    QSqlDatabase::database();
    QSqlRelationalTableModel *tableModel = new QSqlRelationalTableModel;
    tableModel->setTable("prepare");
    tableModel->setEditStrategy(QSqlTableModel::OnFieldChange);
    tableModel->setRelation(1, QSqlRelation("users","users_id","name"));
    tableModel->setRelation(2, QSqlRelation("dates","dates_id","name"));
    tableModel->setRelation(3, QSqlRelation("times","times_id","name"));
    tableModel->select();
    tableModel->setHeaderData(1,Qt::Horizontal, QObject::trUtf8("Точка"));
    tableModel->setHeaderData(2,Qt::Horizontal, QObject::trUtf8("Дата"));
    tableModel->setHeaderData(3,Qt::Horizontal, QObject::trUtf8("Время"));
    tableModel->setHeaderData(4,Qt::Horizontal, QObject::trUtf8("Доставка"));
    tableModel->setHeaderData(5,Qt::Horizontal, QObject::trUtf8("Вынос"));
    tableModel->sort(0,Qt::AscendingOrder);
//    tableModel->sort(2,Qt::AscendingOrder);
    tableViewPrepare->resize(widthx2,heightx2);

    qDebug() << "width-prepare3: " << widthx;
    qDebug() << "height-prepare3: " << heightx;

    tableViewPrepare->setModel(tableModel);
    tableViewPrepare->verticalHeader()->hide();
    tableViewPrepare->setColumnHidden(0,true);
//    tableViewPrepare->setColumnHidden(0,true);

    qDebug() << trUtf8("Tab Index") << ui->tabWidget->indexOf(tab);


}

void prepareCenterForm::getData(){

}

void prepareCenterForm::getData2(){
    int widthtmpx = QApplication::desktop()->width();
    int heighttmpx = QApplication::desktop()->height();

    int widthx = widthtmpx-5;
    int heightx = heighttmpx-110;

//    qDebug() << "width-prepare: " << widthx;
//    qDebug() << "height-prepare: " << heightx;


    QWidget *tab2 = new QWidget;
    tableViewPrepare = new QTableView(tab2);
    ui->tabWidget->addTab(tab2,"08");
//    ui->tabWidget->setCurrentIndex(1);
    ui->tabWidget->setMouseTracking(true);
    ui->tabWidget->resize(widthx,heightx);


    int widthx2 = widthtmpx-10;
    int heightx2 = heighttmpx-135;

    qDebug() << "width-prepare2: " << widthx2;
    qDebug() << "height-prepare2: " << heightx2;

    QSqlDatabase::database();
    QSqlRelationalTableModel *tableModel = new QSqlRelationalTableModel;
    tableModel->setTable("prepare2");
    tableModel->setEditStrategy(QSqlTableModel::OnFieldChange);
    tableModel->setRelation(1, QSqlRelation("users","users_id","name"));
    tableModel->setRelation(2, QSqlRelation("dates","dates_id","name"));
    tableModel->setRelation(3, QSqlRelation("times","times_id","name"));
    tableModel->select();
    tableModel->setHeaderData(1,Qt::Horizontal, QObject::trUtf8("Точка"));
    tableModel->setHeaderData(2,Qt::Horizontal, QObject::trUtf8("Дата"));
    tableModel->setHeaderData(3,Qt::Horizontal, QObject::trUtf8("Время"));
    tableModel->setHeaderData(4,Qt::Horizontal, QObject::trUtf8("Доставка"));
    tableModel->setHeaderData(5,Qt::Horizontal, QObject::trUtf8("Вынос"));
    tableModel->sort(0,Qt::AscendingOrder);
    tableViewPrepare->resize(widthx2,heightx2);

    qDebug() << "width-prepare3: " << widthx;
    qDebug() << "height-prepare3: " << heightx;

    tableViewPrepare->setModel(tableModel);
    tableViewPrepare->verticalHeader()->hide();
    tableViewPrepare->setColumnHidden(0,true);

//    tableViewPrepare->setColumnHidden(0,true);
    qDebug() << trUtf8("Индекс таба2") << ui->tabWidget->indexOf(tab2);

}

prepareCenterForm::~prepareCenterForm()
{
    delete ui;
}
