#include <QtCore>
#include <QtGui>
#include <QtSql>
#include <QTimer>
#include <QStatusBar>
#include "residuesfilialform.h"
#include "ui_residuesfilialform.h"

residuesFilialForm::residuesFilialForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::residuesFilialForm)
{
    ui->setupUi(this);

    residuesFilialForm::showMaximized();

    timerFilial = new QTimer(this);
    timerFilial->setInterval(3000);
    connect(timerFilial, SIGNAL(timeout()),this,SLOT(updateResiduesFilial()));

//    connect(ui->pushButton,SIGNAL(clicked()),this,SLOT(dataToTable()));
    connect(ui->pushButtonSell,SIGNAL(clicked()),this,SLOT(sellDish()));

    ui->filialTableView->resize(widthTableFilial,heightTableFilial);

    getResiduesListFilial();
}

void residuesFilialForm::timerEvent(QTimerEvent *event){
    if(event->timerId() == timerFilial->timerId()){
        ++stepFilial;
        updateResiduesFilial();
    } else {
        QObject::timerEvent(event);
    }
}

void residuesFilialForm::startUpdateFilial(){
    timerFilial->start();
    qDebug() << QObject::trUtf8("Residues Filial Update Start");
}

void residuesFilialForm::stopUpdateFilial(){
    timerFilial->stop();
    qDebug() << QObject::trUtf8("Residues Filial Update Stop");
}

void residuesFilialForm::getResiduesListFilial(){

    //TODO: Create settings from column width


    QSqlDatabase::database();

    QSqlQueryModel *dataViewFilial = new QSqlQueryModel;

    QString queryPrepare ;//= new QString;

    queryPrepare = QString("%1 %2 %3").arg("SELECT d.id, "
            "m.name, "
            "d.counts, "
            "d.countsp, "
            "d.orders, "
            "d.lastupdates, "
            "d.timeleft "
           "FROM ((dish d "
           "LEFT JOIN menu m ON ((m.id = d.menu))) "
           "LEFT JOIN users u ON ((u.id = d.users))) "
          "WHERE (((d.deleted = false) AND (m.deleted = false)) AND (u.deleted = false))").arg("AND d.users=").arg("1");

    dataViewFilial->setQuery(queryPrepare);
    dataViewFilial->setHeaderData(0,Qt::Horizontal, QObject::trUtf8("ID"));
    dataViewFilial->setHeaderData(1,Qt::Horizontal, QObject::trUtf8("Menu"));
    dataViewFilial->setHeaderData(2,Qt::Horizontal, QObject::trUtf8("Count"));
    dataViewFilial->setHeaderData(3,Qt::Horizontal, QObject::trUtf8("Emergency Count"));
    dataViewFilial->setHeaderData(4,Qt::Horizontal, QObject::trUtf8("Orders"));
    dataViewFilial->setHeaderData(5,Qt::Horizontal, QObject::trUtf8("Latest Update"));
    dataViewFilial->setHeaderData(6,Qt::Horizontal, QObject::trUtf8("Expiry Date"));
//    dataViewFilial->setFilter("users=1");
    qDebug() << dataViewFilial->query().lastQuery();

    ui->filialTableView->setModel(dataViewFilial);
    ui->filialTableView->hideColumn(0);
    ui->filialTableView->setColumnWidth(1,350);
    ui->filialTableView->setColumnWidth(2,100);
    ui->filialTableView->setColumnWidth(3,110);
    ui->filialTableView->setColumnWidth(5,100);
    ui->filialTableView->setColumnWidth(6,100);
    ui->filialTableView->verticalHeader()->hide();

}

void residuesFilialForm::updateResiduesFilial(){
    getResiduesListFilial();

}



void residuesFilialForm::dataToTable(){
    qDebug() << QObject::trUtf8("Push");
}

void residuesFilialForm::sellDish(){
    int dish;
    int dishsp;
    int dish_res;
    QSqlDatabase::database();
    QString queryPrepareDishSp ;//= new QString;

    queryPrepareDishSp = QString("%1 %2 %3").arg("SELECT countsp "
            "FROM ((dish d "
            "LEFT JOIN menu m ON ((m.id = d.menu))) "
            "LEFT JOIN users u ON ((u.id = d.users))) "
            "WHERE (((d.deleted = false) AND (m.deleted = false)) "
            "AND (u.deleted = false))").arg("AND d.users=").arg("1");
    qDebug() << queryPrepareDishSp;

    QSqlQuery getdishspquery(queryPrepareDishSp);
    if(getdishspquery.next()){
        dishsp = getdishspquery.value(0).toInt();
        qDebug() << dishsp;
    } else {
        qDebug() << QObject::trUtf8("Do not select Dish");
    }

    QString queryPrepareDishS ;//= new QString;

    queryPrepareDishS = QString("%1 %2 %3").arg("SELECT counts "
            "FROM ((dish d "
            "LEFT JOIN menu m ON ((m.id = d.menu))) "
            "LEFT JOIN users u ON ((u.id = d.users))) "
            "WHERE (((d.deleted = false) AND (m.deleted = false)) "
            "AND (u.deleted = false))").arg("AND d.users=").arg("1");
    qDebug() << queryPrepareDishS;

    QSqlQuery getdishsquery(queryPrepareDishS);
    if(getdishsquery.next()){
        dish = getdishsquery.value(0).toInt();
        qDebug() << dish;
    } else {
        qDebug() << QObject::trUtf8("Do not select Dish");
    }
    if(dishsp != 0){
        dish_res = dishsp - 1;
        setCountDish("countsp",dish_res);
    } else if(dish != 0){
        dish_res = dish - 1;
        setCountDish("counts",dish_res);
    } else {
        qDebug() << QObject::trUtf8("You can't sell this item. Item QNT=0");
    }



}

void residuesFilialForm::setCountDish(QString tableName,int d){
//    int c;
//    QString tableName;
//    tableName = "countsp";
    QSqlDatabase::database();

    QString updateDishQuery;
    updateDishQuery = QString("%1 %2 %3 %4 %5").arg("UPDATE dish SET ").arg(tableName).arg(" = ").arg(d).arg("WHERE users=1 AND id=1");
    qDebug() << updateDishQuery;

    QSqlQuery *updateDish = new QSqlQuery;
    updateDish->prepare(updateDishQuery);
    updateDish->exec();
    if(updateDish->lastError().isValid()){
        qDebug() << updateDish->lastError();
        qDebug() << updateDish->executedQuery();
        qDebug() << updateDish->lastQuery();
    } else {
        qDebug() << updateDish->executedQuery();
        qDebug() << "Sell Complited. " << tableName << " = " << d ;
    }

    updateResiduesFilial();
}

residuesFilialForm::~residuesFilialForm()
{
    stopUpdateFilial();
    delete ui;
}
