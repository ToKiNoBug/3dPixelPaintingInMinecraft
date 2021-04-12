#pragma once
#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include "mcmap.h"
#include "ui_mainwindow.h"
#include <QMainWindow>
#include <QButtonGroup>
QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    mcMap Data;
    void turnToPage(int);

    QRadioButton *Blocks[64][9];
    QCheckBox *Enables[64];
    QLabel *ShowColors[64];
    short SelectedBlockList[64];
    //bool Enabled[64];//被启动的方块列表，相当于最终的MIndex
    bool NeedGlass[64][10];
    bool doGlow[64][10];
    QString BlockId[64][10];
    short BLCreative[64];
    short BLCheaper[64];
    short BLBetter[64];
    short BLGlowing[64];

    //初始化方块列表用
    void Collect();//done
    bool Collected;
    void IniNeedGlass();//done
    void InidoGlow();//done
    void IniBL();//done
    void IniEnables();
    //void setShowColors();
    void applyPre(short*BL);//done
    void connectEnables();//done

    //其他非初始化用途
    void allowUpdateToCustom(bool allowAutoUpdate);//done
    //void getBlockIds();
    void getMIndex();
private slots:

    //翻页的自定义槽
    void turnToPage0();
    void turnToPage1();
    void turnToPage2();
    void turnToPage3();
    void turnToPage4();
    void turnToPage5();
    void turnToPage6();
    void turnToPage7();
    void turnToPage8();

    //forPage1
    void on_ImportPic_clicked();

    //forPage2

    //forPage3
    //应用预设方块列表的自定义槽
    void ChangeToCustom();
    void applyVanilla();
    void applyCheap();
    void applyElegant();
    void applyShiny();
    //forPage4

    //forPage5

    void on_StartWithSlope_clicked();

    void on_StartWithFlat_clicked();

    void on_StartWithNotVanilla_clicked();

    void on_confirmType_clicked();

    void on_confirmBL_clicked();

private:
    Ui::MainWindow *ui;
};






#endif // MAINWINDOW_H
