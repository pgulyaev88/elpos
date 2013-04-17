#-------------------------------------------------
#
# Project created by QtCreator 2013-02-20T08:42:49
#
#-------------------------------------------------

QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = fcc
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    residuescenterform.cpp \
    residuesfilialform.cpp \
    preparecenterform.cpp

HEADERS  += mainwindow.h \
    residuescenterform.h \
    residuesfilialform.h \
    preparecenterform.h

FORMS    += mainwindow.ui \
    residuescenterform.ui \
    residuesfilialform.ui \
    preparecenterform.ui
