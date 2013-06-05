#ifndef RESIDUESCENTERFORM_H
#define RESIDUESCENTERFORM_H

#include <QtGui>
#include <QtSql>
#include <QDialogButtonBox>
#include <QWidget>

namespace Ui {
class residuesCenterForm;
}

class residuesCenterForm : public QWidget
{
    Q_OBJECT
    
public:
    int widthTableCenter;
    int heightTableCenter;

    explicit residuesCenterForm(QWidget *parent = 0);
    ~residuesCenterForm();

public slots:

protected:
    void timerEvent(QTimerEvent *event);

private slots:
    void getResiduesList();
    void updateResiduesCenter();
    void startUpdate();
    void stopUpdate();
    void dataToTable();

private:
    Ui::residuesCenterForm *ui;
    QTimer *timerCenter;
    int stepCenter;
    int usersIdCenter;
    int residuesIdCenter;
    int menusIdCenter;
    QString mnameCenter;
    QString unameCenter;
    int residuesCountCenter;
    int residuesCountCurrentCenter;
//    QString lastUpdate;
    QDateTime lastUpdateCenter;

};

#endif // RESIDUESCENTERFORM_H
