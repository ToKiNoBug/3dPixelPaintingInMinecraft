#ifndef Page3_H
#define Page3_H

#include "mainwindow.h"
#include "ui_mainwindow.h"

#include  <QFile>
#include <QFileDialog>
#include <QMessageBox>
#include <QDebug>

#pragma once

void MainWindow::IniNeedGlass()
{
    for(short i=0;i<64;i++)
        for(short j=0;j<10;j++)
            NeedGlass[i][j]=false;
    NeedGlass[6][4]=true;//Lantern
    NeedGlass[6][2]=true;//IronPlate
    NeedGlass[30][1]=true;//GoldPlate
    return;
}

void MainWindow::InidoGlow()
{
    for(short i=0;i<64;i++)
        for(short j=0;j<10;j++)
            doGlow[i][j]=false;
    doGlow[2][2]=true;
    doGlow[6][4]=true;
    doGlow[14][2]=true;
    doGlow[28][9]=true;
    doGlow[34][2]=true;
    doGlow[35][2]=true;
    return;
}

void MainWindow::IniEnables()
{
    for(short i=0;i<64;i++)
        if(Enables[i]!=NULL)
        Enables[i]->setChecked(true);
    if(!Data.is16)
        for(short i=52;i<=58;i++)
            if(Enables[i]!=NULL)
            Enables[i]->setChecked(false);
    return;
}

void MainWindow::connectEnables()
{
    for(short i=0;i<64;i++)
        if(Enables[i]!=NULL)
        connect(Enables[i],SIGNAL(clicked()),this,SLOT(ChangeToCustom()));
}

void MainWindow::allowUpdateToCustom(bool allowAutoUpdate)
{
    if(allowAutoUpdate)
       {
        for(short i=0;i<64;i++)
            for(short j=0;j<10;j++)
            {if(Blocks[i][j]==NULL)
                    break;
             else
                    connect(Blocks[i][j],SIGNAL(clicked()),this,SLOT(ChangeToCustom()));
              }

        }
        else {
        for(short i=0;i<64;i++)
            for(short j=0;j<10;j++)
            {if(Blocks[i][j]==NULL)
                    break;
             else
                    disconnect(Blocks[i][j],SIGNAL(clicked()),this,SLOT(ChangeToCustom()));
              }
    }
    return;
}


void MainWindow::IniBL()
{
    ui->isBLSurvivalBetter->setChecked(true);

    qDebug("IniBL运行到一半");

    applyPre(BLBetter);
}


void MainWindow::ChangeToCustom()
{
    ui->isBLCustom->setChecked(true);
    return;
}

void MainWindow::applyPre(short*BL)
{
    allowUpdateToCustom(false);//prevent radiobuttons from switching BlockList mode to Custom

    qDebug("成功禁用更改预设");

    for(short i=0;i<64;i++)
        if(Blocks[i][BL[i]]==NULL)
        {if(Blocks[i][0]==NULL)continue;
            else
                Blocks[i][0]->setChecked(true);
            continue;
        }

        else
            Blocks[i][BL[i]]->setChecked(true);

    qDebug("修改了方块列表");

    allowUpdateToCustom(true);

    qDebug("恢复了更改预设");

    return;
}

void MainWindow::applyVanilla()
{
    applyPre(BLCreative);
    //ui->isBLCreative->setChecked(true);
    return;
}

void MainWindow::applyCheap()
{
    applyPre(BLCheaper);
    //ui->isBLSurvivalCheaper->setChecked(true);
    return;
}

void MainWindow::applyElegant()
{
    applyPre(BLBetter);
    //ui->isBLSurvivalBetter->setChecked(true);
    return;
}

void MainWindow::applyShiny()
{
    applyPre(BLGlowing);
    //ui->isBLGlowing->setChecked(true);
    return;
}


void MainWindow::on_confirmBL_clicked()
{
    //这里没有要做的初始化了，只需要grab数据
    for(short i=0;i<64;i++)
        if(Enables[i]==NULL)
            Data.colorAllowed[i]=false;
    else
            Data.colorAllowed[i]=((i>=52)&&!Data.is16)&&Enables[i]->isChecked();
    qDebug("成功从界面读入了MIndex");
    //this->
}

#endif
