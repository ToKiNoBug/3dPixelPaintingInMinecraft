#ifndef Page1_H
#define Page1_H

#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "mcmap.cpp"
#include  <QFile>
#include <QFileDialog>
#include <QMessageBox>
#include <QDebug>


void MainWindow::on_ImportPic_clicked()
{
    static bool needInitialize=true;
    QString Path =QFileDialog::getOpenFileName(this,tr("选择图片"),"",tr("Images (*.png *.bmp *.jpg *.tif *.GIF )"));
    if (Path.isEmpty())
    {//Data.step=1;
        return;}

    QImage *rawPic=new QImage;
    if(! ( rawPic->load(Path) ) )
    {
        QMessageBox::information(this,tr("打开图片失败"),tr("要不试试换一张图片吧！"));
        delete rawPic;
                    return;
    }
    if(needInitialize)
    {

        GetBLCreative(BLCreative);
        GetBLCheaper(BLCheaper);
        GetBLBetter(BLBetter);
        GetBLGlowing(BLGlowing);
        qDebug("成功初始化四个预设方块列表");

        readFromFile("RGB.Toki",Data.Basic->RGB);
        readFromFile("HSV.Toki",Data.Basic->HSV);
        readFromFile("Lab.Toki",Data.Basic->Lab);
        readFromFile("XYZ.Toki",Data.Basic->XYZ);
        qDebug("成功载入颜色");
        needInitialize=false;
        qDebug("导入图片按钮处的初始化部分完成");
        //可能在这里为ShowColor赋予颜色，也可能直接在ui里完成
    }
    ui->ShowRawPic->setPixmap(QPixmap::fromImage(*rawPic));
    //这里要将图片信息加入到Data
    Data.step=2;
    ui->NextPage->setEnabled(true);
    return;
}




#endif
