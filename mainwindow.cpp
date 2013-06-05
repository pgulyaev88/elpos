#include <QtCore>
#include <QtGui>
#include <QWidget>
#include <QApplication>
#include <QMessageBox>
#include <QSettings>
#include <QSqlDatabase>
#include <QSqlQueryModel>
#include <QSqlError>
#include <QTableView>
#include <QDebug>
#include <QMdiSubWindow>
#include "preparecenterform.h"
#include "residuescenterform.h"
#include "residuesfilialform.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    mdiArea = new QMdiArea;
    mdiArea->setHorizontalScrollBarPolicy(Qt::ScrollBarAsNeeded);
    mdiArea->setVerticalScrollBarPolicy(Qt::ScrollBarAsNeeded);
    setCentralWidget(mdiArea);
    loadDatabaseConnection();
    connect(ui->actionResiduesCenter,SIGNAL(triggered(bool)),this,SLOT(openResiduesCenter()));
    connect(ui->actionResiduesFilial,SIGNAL(triggered(bool)),this,SLOT(openResiduesFilial()));
    connect(ui->actionPrepare,SIGNAL(triggered(bool)),this,SLOT(openPrepareCenter()));
    int width = QApplication::desktop()->width();
    int height = QApplication::desktop()->height();

    int widthtmp = width-5;
    int heighttmp = height-80;

    qDebug() << "width-main: " << width;
    qDebug() << "height-main: " << height;

    qDebug() << "widthtmp-main: " << widthtmp;
    qDebug() << "heighttmp-main: " << heighttmp;

    MainWindow::resize(widthtmp,heighttmp);
    MainWindow::showMaximized();
    getSettings();
//    openPrepareCenter();

}

void MainWindow::getSettings(){
    QString fileName = "./param.ini";
    QSettings *settings = new QSettings(fileName,QSettings::IniFormat);
    if(settings->value("restaurant/id").isNull()){
       settings->setValue("restaurant/id",1);
    } else {
        idRest = settings->value("restaurant/id").toInt();
    }
        qDebug() << "Restaurant ID:" << idRest;

    if(settings->value("restaurant/restname").isNull()){
        settings->setValue("restaurant/restname","Rest");
    } else {
        restName = settings->value("restaurant/restname").toString();
    }
        qDebug() << "Restaurant Name:" << restName;
}

void MainWindow::loadDatabaseConnection(){
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("127.0.0.1");
    db.setDatabaseName("fcc");
    db.setUserName("fcc");
    db.setPassword("fcc");
    if (!db.open()){
        qDebug() << QObject::trUtf8("Database error connect") << db.lastError().text();
        QMessageBox messbox;
        messbox.setText(QString::fromUtf8("Error connect to database. Please restart programm."));
        messbox.setStandardButtons(QMessageBox::Ok);
        messbox.exec();
    }
    qDebug() << QObject::trUtf8("Database connect");
    ui->statusBar->showMessage(tr("Database connect"));
}

void MainWindow::openPrepareCenter(){
    prepareCenterForm *widget = new prepareCenterForm;
    QMdiSubWindow *subWindow3 = new QMdiSubWindow;
    subWindow3->setWidget(widget);
    subWindow3->setAttribute(Qt::WA_DeleteOnClose);
    mdiArea->addSubWindow(subWindow3);
    subWindow3->showMaximized();
    subWindow3->show();
}

void MainWindow::openResiduesCenter(){
    residuesCenterForm *widget = new residuesCenterForm;
    QMdiSubWindow *subWindow1 = new QMdiSubWindow;
    subWindow1->setWidget(widget);
    subWindow1->setAttribute(Qt::WA_DeleteOnClose);
    mdiArea->addSubWindow(subWindow1);
    subWindow1->showMaximized();
    subWindow1->show();
}

void MainWindow::openResiduesFilial(){
    residuesFilialForm *widget = new residuesFilialForm;
    QMdiSubWindow *subWindow2 = new QMdiSubWindow;
    subWindow2->setWidget(widget);
    subWindow2->setAttribute(Qt::WA_DeleteOnClose);
    mdiArea->addSubWindow(subWindow2);
    subWindow2->showMaximized();
    subWindow2->show();
}

MainWindow::~MainWindow()
{
    delete ui;
}
