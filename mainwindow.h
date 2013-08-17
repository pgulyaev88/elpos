#ifndef MAINWINDOW_H
#define MAINWINDOW_H

//#include <QtCore>
//#include <QtGui>
//#include <QtSql>
//#include <QResizeEvent>
#include <QMdiArea>
#include <QTranslator>
#include <QMainWindow>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
    
protected:

public:
    int idRest;
    QString restName;

    int width;
    int height;
    QTranslator mytranslation;

    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

public slots:
    void loadDatabaseConnection();
    void openResiduesCenter();
    void openResiduesFilial();
    void openPrepareCenter();
    void getSettings();
    
private:
    Ui::MainWindow *ui;
    QMdiArea *mdiArea;
};

#endif // MAINWINDOW_H
