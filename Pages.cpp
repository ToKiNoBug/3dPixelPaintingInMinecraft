#ifndef Pages_H
#define Pages_H

#include "mainwindow.h"
#include "ui_mainwindow.h"

#include  <QFile>
#include <QFileDialog>
#include <QMessageBox>
#include <QDebug>


void MainWindow::turnToPage(int page)
{
    page%=9;
    switch (page)
    {
        case 0:
            if(Data.step>=page)
            {
                ui->ShowStep->setText("Step 0 / 6");
                ui->ShowStepName->setText("开始");
                break;
            }

    case 1:
        if(Data.step>=page)
        {
            ui->ShowStep->setText("Step 1 / 6");
            ui->ShowStepName->setText("导入图片");
            break;
        }
    case 2:
        if(Data.step>=page)
        {
            ui->ShowStep->setText("Step 2 / 6");
            ui->ShowStepName->setText("设置地图画类型");
            break;
        }
    case 3:
        if(Data.step>=page)
        {
            ui->ShowStep->setText("Step 3 / 6");
            ui->ShowStepName->setText("设置方块列表");
            break;
        }
    case 4:
        if(Data.step>=page)
        {
            ui->ShowStep->setText("Step 4 / 6");
            ui->ShowStepName->setText("调整颜色");
            break;
        }
    case 5:
        if(Data.step>=5)
        {
            ui->ShowStep->setText("Step 5 / 6");
            ui->ShowStepName->setText("导出为投影");
            break;
        }
    case 6:
        if(Data.step>=5)
        {
            ui->ShowStep->setText("Step 5 / 6");
            ui->ShowStepName->setText("导出为mcfunction");
            break;
        }
    case 7:
        if(Data.step>=5)
        {
            ui->ShowStep->setText("Step 5 / 6");
            ui->ShowStepName->setText("导出为地图文件");
            break;
        }
    case 8:
        if(Data.step>=6)
        {
            ui->ShowStep->setText("Step 6 / 6");
            ui->ShowStepName->setText("结束");
            break;
        }
    default:
        qDebug("尝试翻页错误");
        return;
    }


    ui->stackedWidget->setCurrentIndex(page);
    return;
}


void MainWindow::turnToPage0()
{
    turnToPage(0);
    return;
}

void MainWindow::turnToPage1()
{
    turnToPage(1);
    return;
}

void MainWindow::turnToPage2()
{
    turnToPage(2);
    return;
}

void MainWindow::turnToPage3()
{
    turnToPage(3);
    return;
}

void MainWindow::turnToPage4()
{
    turnToPage(4);
    return;
}

void MainWindow::turnToPage5()
{
    turnToPage(5);
    return;
}

void MainWindow::turnToPage6()
{
    turnToPage(6);
    return;
}

void MainWindow::turnToPage7()
{
    turnToPage(7);
    return;
}

void MainWindow::turnToPage8()
{
    turnToPage(8);
    return;
}

#endif
