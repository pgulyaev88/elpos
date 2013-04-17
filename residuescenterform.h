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
    explicit residuesCenterForm(QWidget *parent = 0);
    ~residuesCenterForm();

public slots:

protected:
    void timerEvent(QTimerEvent *event);

private slots:
    void getResiduesList();
    void updateResidues();
    void startUpdate();
    void stopUpdate();
    void dataToTable();

private:
    Ui::residuesCenterForm *ui;
    QTimer *timer;
    int step;
    int usersID;
    int residuesID;
    int menusID;
    QString mname;
    QString uname;
    int residuesCount;
    int residuesCountSP;
//    QString lastUpdate;
    QDateTime lastUpdate;

};

#endif // RESIDUESCENTERFORM_H
