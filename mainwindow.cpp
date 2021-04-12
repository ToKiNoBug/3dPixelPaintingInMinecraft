//#pragma once
#include "mainwindow.h"
#include "ui_mainwindow.h"


#include "Collecter.cpp"
#include "Pages.cpp"
//#include "mcmap.h"
#include "mcmap.cpp"
#include "Page0.cpp"
#include "Page1.cpp"
#include "Page2.cpp"
#include "Page3.cpp"
#include "Page4.cpp"
#include "Page5.cpp"
#include "Page6.cpp"
#include "Page7.cpp"
#include "Page8.cpp"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    qDebug("成功setupUi");
    Collected=false;
    Data.step=0;
    connect(ui->menuStart,SIGNAL(triggered(QAction*)),this,SLOT(turnToPage0()));
    connect(ui->menuImPic,SIGNAL(triggered(QAction*)),this,SLOT(turnToPage1()));
    connect(ui->menuType,SIGNAL(triggered(QAction*)),this,SLOT(turnToPage2()));
    connect(ui->menuBL,SIGNAL(triggered(QAction*)),this,SLOT(turnToPage3()));
    connect(ui->menuAdjPic,SIGNAL(triggered(QAction*)),this,SLOT(turnToPage4()));
    connect(ui->menuExLite,SIGNAL(triggered(QAction*)),this,SLOT(turnToPage5()));
    connect(ui->menuMcF,SIGNAL(triggered(QAction*)),this,SLOT(turnToPage6()));
    qDebug("成功connect所有的菜单");

    connect(ui->NextPage,SIGNAL(clicked()),this,SLOT(turnToPage2()));
    connect(ui->NextPage2,SIGNAL(clicked()),this,SLOT(turnToPage3()));
    connect(ui->NextPage3,SIGNAL(clicked()),this,SLOT(turnToPage4()));
    connect(ui->ExLite,SIGNAL(clicked()),this,SLOT(turnToPage5()));
    connect(ui->ExMcF,SIGNAL(clicked()),this,SLOT(turnToPage6()));
    connect(ui->ExData,SIGNAL(clicked()),this,SLOT(turnToPage7()));
    qDebug("成功connect所有的翻页按钮");
    turnToPage(0);
}

MainWindow::~MainWindow()
{
    delete ui;
}


