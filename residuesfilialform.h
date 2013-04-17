#ifndef RESIDUESFILIALFORM_H
#define RESIDUESFILIALFORM_H

#include <QtGui>
#include <QtSql>
#include <QDialogButtonBox>
#include <QWidget>

namespace Ui {
class residuesFilialForm;
}

class residuesFilialForm : public QWidget
{
    Q_OBJECT
    
public:
    explicit residuesFilialForm(QWidget *parent = 0);
    ~residuesFilialForm();
    
protected:
    void timerEvent(QTimerEvent *event);

private slots:
    void getResiduesListFilial();
    void updateResidues();
    void startUpdate();
    void stopUpdate();
    void dataToTable();
    void getMenuId();
    void saveMenu();

private:
    Ui::residuesFilialForm *ui;
    QTimer *timerFilial;
    int stepFilial;
    int usersIdFilial;
    int residuesIdFilial;
    int menusIdFilial;
    QString mnameFilial;
    QString unameFilial;
    int residuesCountFilial;
    int residuesCountSPFilial;
//    QString lastUpdate;
    QDateTime lastUpdateFilial;
};

#endif // RESIDUESFILIALFORM_H
