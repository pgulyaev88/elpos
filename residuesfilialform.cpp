#include "residuesfilialform.h"
#include "ui_residuesfilialform.h"

residuesFilialForm::residuesFilialForm(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::residuesFilialForm)
{
    timerFilial = new QTimer(this);
    connect(timerFilial, SIGNAL(timeout()),this,SLOT(update()));
    getResiduesListFilial();

    ui->setupUi(this);
}


void residuesFilialForm::timerEvent(QTimerEvent *event){
    if(event->timerId() == timerFilial->timerId()){
        ++stepFilial;
        updateResidues();
    }
    else {
        QObject::timerEvent(event);
    }
}

void residuesFilialForm::startUpdate(){
    timerFilial->start();
    qDebug() << "Start Update";
}

void residuesFilialForm::stopUpdate(){
    timerFilial->stop();
    qDebug() << "Stop Update";
}

void residuesFilialForm::updateResidues(){

}

void residuesFilialForm::getResiduesListFilial(){

    QSqlDatabase::database();
    QSqlQueryModel *dataViewFilial = new QSqlQueryModel;
    dataViewFilial->setQuery("SELECT * FROM public.\"getResidues\"(1)");
    dataViewFilial->setHeaderData(0,Qt::Horizontal, trUtf8("ID"));
    dataViewFilial->setHeaderData(1,Qt::Horizontal, trUtf8("Меню"));
    dataViewFilial->setHeaderData(2,Qt::Horizontal, trUtf8("Точка"));
    dataViewFilial->setHeaderData(3,Qt::Horizontal, trUtf8("Кол-во"));
    dataViewFilial->setHeaderData(4,Qt::Horizontal, trUtf8("Срочное кол-во"));
    dataViewFilial->setHeaderData(5,Qt::Horizontal, trUtf8("Последнее обновлние"));
    ui->filialTableView->setModel(dataViewFilial);
    ui->filialTableView->hideColumn(0);
    ui->filialTableView->verticalHeader()->hide();
}

void residuesFilialForm::dataToTable(){

}

void residuesFilialForm::saveMenu(){

}

void residuesFilialForm::getMenuId(){

}

residuesFilialForm::~residuesFilialForm()
{
    delete ui;
}
