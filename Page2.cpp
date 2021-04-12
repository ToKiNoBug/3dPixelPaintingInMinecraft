#ifndef Page2_H
#define Page2_H

#include "mainwindow.h"
#include "ui_mainwindow.h"

#include  <QFile>
#include <QFileDialog>
#include <QMessageBox>
#include <QDebug>

#pragma once

void MainWindow::on_confirmType_clicked()
{
    static bool needInitialize=true;
    if(Data.step<3)Data.step=3;
    Data.is16=ui->isGame16->isChecked();
    qDebug("从窗口获得了isGame16的信息");

    Data.isFlat=ui->isMapFlat->isChecked();
    qDebug("从窗口获得了isMapFlat的信息");

    Data.isSurvival=ui->isMapSurvival->isChecked();
    qDebug("从窗口获得了isMapSurvival的信息");
    if(needInitialize)
    {


        IniBL();
        qDebug("IniBL");

        IniEnables();
        qDebug("IniEnables");

        IniNeedGlass();
        qDebug("IniNeedGlass");

        InidoGlow();
        qDebug("InidoGlow");

        ui->isBLSurvivalBetter->setChecked(true);
        applyElegant();
        qDebug("applyElegant");

        connect(ui->isBLCreative,SIGNAL(clicked()),this,SLOT(applyVanilla()));
        connect(ui->isBLSurvivalCheaper,SIGNAL(clicked()),this,SLOT(applyCheap()));
        connect(ui->isBLSurvivalBetter,SIGNAL(clicked()),this,SLOT(applyElegant()));
        connect(ui->isBLGlowing,SIGNAL(clicked()),this,SLOT(applyShiny()));

    }



    ui->NextPage2->setEnabled(true);
    return;

}

#endif
