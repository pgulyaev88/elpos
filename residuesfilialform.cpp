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

    int width = QApplication::desktop()->width();
    int height = QApplication::desktop()->height();

    widthTableFilial = width-20;
    heightTableFilial = height-115;

    qDebug() << "width-main: " << widthTableFilial;
    qDebug() << "height-main: " << heightTableFilial;

//    residuesFilialForm::resize(width,height);
    residuesFilialForm::showMaximized();

    timerFilial = new QTimer(this);
    timerFilial->setInterval(3000);
    connect(timerFilial, SIGNAL(timeout()),this,SLOT(update()));
    connect(ui->pushButton,SIGNAL(clicked()),this,SLOT(dataToTable()));
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
    qDebug() << trUtf8("Start Update");
}

void residuesFilialForm::stopUpdateFilial(){
    timerFilial->stop();
    qDebug() << trUtf8("Stop Update");
}

void residuesFilialForm::getResiduesListFilial(){

    QSqlDatabase::database();
    QSqlQueryModel *dataViewFilial = new QSqlQueryModel;
    dataViewFilial->setQuery("SELECT * FROM public.\"getresiduesfilial\"(1)");
    dataViewFilial->setHeaderData(0,Qt::Horizontal,trUtf8("ID"));
    dataViewFilial->setHeaderData(1,Qt::Horizontal, trUtf8("Menu"));
    dataViewFilial->setHeaderData(2,Qt::Horizontal, trUtf8("Count"));
    dataViewFilial->setHeaderData(3,Qt::Horizontal, trUtf8("Emergency Count"));
//    dataViewFilial->setHeaderData(4,Qt::Horizontal, trUtf8("Expiry Date"));
    dataViewFilial->setHeaderData(4,Qt::Horizontal, trUtf8("Latest Update"));
    ui->filialTableView->setModel(dataViewFilial);
    ui->filialTableView->hideColumn(0);
    ui->filialTableView->verticalHeader()->hide();
}

void residuesFilialForm::updateResiduesFilial(){

}

void residuesFilialForm::dataToTable(){
    qDebug() << "Push";
}

residuesFilialForm::~residuesFilialForm()
{
    delete ui;
}
