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
    int widthTableFilial;
    int heightTableFilial;

    explicit residuesFilialForm(QWidget *parent = 0);
    ~residuesFilialForm();
    
protected:
    void timerEvent(QTimerEvent *event);


private slots:
    void getResiduesListFilial();
    void updateResiduesFilial();
    void startUpdateFilial();
    void stopUpdateFilial();
    void dataToTable();
    void sellDish();
    void setCountDish(QString tableName, int d);

private:
    QTimer *timerFilial;
    int stepFilial;
    int usersIdFilial;
    int residuesIdFilial;
    int menusIdFilial;
    QString mnameFilial;
    QString unameFilial;
    int residuesCountFilial;
    int residuesCountCurrentFilial;
    QDateTime lastUpdateFilial;

    Ui::residuesFilialForm *ui;

};

#endif // RESIDUESFILIALFORM_H
