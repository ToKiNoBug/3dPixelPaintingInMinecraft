#ifndef Page0_H
#define Page0_H

#include "mainwindow.h"
#include "ui_mainwindow.h"

#include  <QFile>
#include <QFileDialog>
#include <QMessageBox>
#include <QDebug>

void MainWindow::on_StartWithSlope_clicked()
{
    if(!Collected)
    {
        Collect();
        qDebug("Collected");

        Collected=true;
        qDebug("StartWithSlope中的初始化部分完成");
    }
    ui->isMapSurvival->setChecked(true);
    ui->isMapFlat->setChecked(false);
    qDebug("成功调整了page2的方块列表设定");
    Data.step=1;
    turnToPage(1);
}

void MainWindow::on_StartWithFlat_clicked()
{
    if(!Collected)
    {
        Collect();
        qDebug("Collected");

        Collected=true;
        qDebug("StartWithSlope中的初始化部分完成");
    }
    ui->isMapSurvival->setChecked(true);
    ui->isMapFlat->setChecked(true);
    qDebug("成功调整了page2的方块列表设定");
    Data.step=1;
    turnToPage(1);
}

void MainWindow::on_StartWithNotVanilla_clicked()
{
    if(!Collected)
    {
        Collect();
        qDebug("Collected");

        Collected=true;
        qDebug("StartWithSlope中的初始化部分完成");
    }
    ui->isMapCreative->setChecked(true);
    ui->isMapFlat->setChecked(false);
    qDebug("成功调整了page2的方块列表设定");
    Data.step=1;
    turnToPage(1);
}



#endif
