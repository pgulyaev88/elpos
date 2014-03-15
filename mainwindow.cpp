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
#include "settings.h"
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
    mdiArea->setViewMode(QMdiArea::TabbedView);
    mdiArea->setTabsClosable("true");
    mdiArea->setTabsMovable("true");
    setCentralWidget(mdiArea);

    loadDatabaseConnection();

    connect(ui->actionResiduesCenter,SIGNAL(triggered(bool)),this,SLOT(openResiduesCenter()));
    connect(ui->actionResiduesFilial,SIGNAL(triggered(bool)),this,SLOT(openResiduesFilial()));
    connect(ui->actionPrepare,SIGNAL(triggered(bool)),this,SLOT(openPrepareCenter()));

    QTranslator mytranslation ;
    mytranslation.load("fcc_ru.ts");

    MainWindow::showMaximized();

//    settings::getSettings();
//    openPrepareCenter();
    //TODO: Create timer for check connection database.
    //TODO: Reconnect if connection lost.

}

//void MainWindow::getSettings(){
//    QString fileName = "./param.ini";
//    QSettings *settings = new QSettings(fileName,QSettings::IniFormat);
//    if(settings->value("restaurant/id").isNull()){
//       settings->setValue("restaurant/id",1);
//    } else {
//        idRest = settings->value("restaurant/id").toInt();
//    }
//        qDebug() << trUtf8("Restaurant ID:") << idRest;

//    if(settings->value("restaurant/restname").isNull()){
//        settings->setValue("restaurant/restname","Rest");
//    } else {
//        restName = settings->value("restaurant/restname").toString();
//    }
//        qDebug() << trUtf8("Restaurant Name:") << restName;

//        //TODO: Settings for database.
//}

void MainWindow::loadDatabaseConnection(){
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setDatabaseName("elpos");
    db.setUserName("elpos");
    db.setPassword("elpos");
    if (!db.open()){
        qDebug() << QObject::trUtf8("Database error connect") << db.lastError().text();
        QMessageBox messbox;
        messbox.setText(QString::fromUtf8("Error connect to database. Please restart programm."));
        messbox.setStandardButtons(QMessageBox::Ok);
        messbox.exec();
    } else {
        qDebug() << QObject::trUtf8("Database connect");
        ui->statusBar->showMessage(QObject::trUtf8("Database connect"));
    }
}

void MainWindow::openPrepareCenter(){
    preparecenterform *widget = new preparecenterform;
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

void MainWindow::showMessageStatusBar(QString messageBar){
    ui->statusBar->showMessage(messageBar);
}

MainWindow::~MainWindow()
{
    delete ui;
}
