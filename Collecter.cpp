#include "mainwindow.h"
#include "ui_mainwindow.h"

#include  <QFile>
#include <QFileDialog>
#include <QMessageBox>
#include <QDebug>

#ifndef Collecter_H
#define Collecter_H

void MainWindow::Collect()
{
    for(short Base=0;Base<64;Base++)
    {Enables[Base]=NULL;
        ShowColors[Base]=NULL;
        for(short j=0;j<10;j++)
            Blocks[Base][j]=NULL;
    }

    //////////////
    Enables[0]=ui->Enable00;
    Enables[1]=ui->Enable01;
    Enables[2]=ui->Enable02;
    Enables[3]=ui->Enable03;
    Enables[4]=ui->Enable04;
    Enables[5]=ui->Enable05;
    Enables[6]=ui->Enable06;
    Enables[7]=ui->Enable07;
    Enables[8]=ui->Enable08;
    Enables[9]=ui->Enable09;
    Enables[10]=ui->Enable10;
    Enables[11]=ui->Enable11;
    Enables[12]=ui->Enable12;
    Enables[13]=ui->Enable13;
    Enables[14]=ui->Enable14;
    Enables[15]=ui->Enable15;
    Enables[16]=ui->Enable16;
    Enables[17]=ui->Enable17;
    Enables[18]=ui->Enable18;
    Enables[19]=ui->Enable19;
    Enables[20]=ui->Enable20;
    Enables[21]=ui->Enable21;
    Enables[22]=ui->Enable22;
    Enables[23]=ui->Enable23;
    Enables[24]=ui->Enable24;
    Enables[25]=ui->Enable25;
    Enables[26]=ui->Enable26;
    Enables[27]=ui->Enable27;
    Enables[28]=ui->Enable28;
    Enables[29]=ui->Enable29;
    Enables[30]=ui->Enable30;
    Enables[31]=ui->Enable31;
    Enables[32]=ui->Enable32;
    Enables[33]=ui->Enable33;
    Enables[34]=ui->Enable34;
    Enables[35]=ui->Enable35;
    Enables[36]=ui->Enable36;
    Enables[37]=ui->Enable37;
    Enables[38]=ui->Enable38;
    Enables[39]=ui->Enable39;
    Enables[40]=ui->Enable40;
    Enables[41]=ui->Enable41;
    Enables[42]=ui->Enable42;
    Enables[43]=ui->Enable43;
    Enables[44]=ui->Enable44;
    Enables[45]=ui->Enable45;
    Enables[46]=ui->Enable46;
    Enables[47]=ui->Enable47;
    Enables[48]=ui->Enable48;
    Enables[49]=ui->Enable49;
    Enables[50]=ui->Enable50;
    Enables[51]=ui->Enable51;
    Enables[52]=ui->Enable52;
    Enables[53]=ui->Enable53;
    Enables[54]=ui->Enable54;
    Enables[55]=ui->Enable55;
    Enables[56]=ui->Enable56;
    Enables[57]=ui->Enable57;
    Enables[58]=ui->Enable58;
    /////////////////
    ShowColors[0]=ui->Color00;
    ShowColors[1]=ui->Color01;
    ShowColors[2]=ui->Color02;
    ShowColors[3]=ui->Color03;
    ShowColors[4]=ui->Color04;
    ShowColors[5]=ui->Color05;
    ShowColors[6]=ui->Color06;
    ShowColors[7]=ui->Color07;
    ShowColors[8]=ui->Color08;
    ShowColors[9]=ui->Color09;
    ShowColors[10]=ui->Color10;
    ShowColors[11]=ui->Color11;
    ShowColors[12]=ui->Color12;
    ShowColors[13]=ui->Color13;
    ShowColors[14]=ui->Color14;
    ShowColors[15]=ui->Color15;
    ShowColors[16]=ui->Color16;
    ShowColors[17]=ui->Color17;
    ShowColors[18]=ui->Color18;
    ShowColors[19]=ui->Color19;
    ShowColors[20]=ui->Color20;
    ShowColors[21]=ui->Color21;
    ShowColors[22]=ui->Color22;
    ShowColors[23]=ui->Color23;
    ShowColors[24]=ui->Color24;
    ShowColors[25]=ui->Color25;
    ShowColors[26]=ui->Color26;
    ShowColors[27]=ui->Color27;
    ShowColors[28]=ui->Color28;
    ShowColors[29]=ui->Color29;
    ShowColors[30]=ui->Color30;
    ShowColors[31]=ui->Color31;
    ShowColors[32]=ui->Color32;
    ShowColors[33]=ui->Color33;
    ShowColors[34]=ui->Color34;
    ShowColors[35]=ui->Color35;
    ShowColors[36]=ui->Color36;
    ShowColors[37]=ui->Color37;
    ShowColors[38]=ui->Color38;
    ShowColors[39]=ui->Color39;
    ShowColors[40]=ui->Color40;
    ShowColors[41]=ui->Color41;
    ShowColors[42]=ui->Color42;
    ShowColors[43]=ui->Color43;
    ShowColors[44]=ui->Color44;
    ShowColors[45]=ui->Color45;
    ShowColors[46]=ui->Color46;
    ShowColors[47]=ui->Color47;
    ShowColors[48]=ui->Color48;
    ShowColors[49]=ui->Color49;
    ShowColors[50]=ui->Color50;
    ShowColors[51]=ui->Color51;
    ShowColors[52]=ui->Color52;
    ShowColors[53]=ui->Color53;
    ShowColors[54]=ui->Color54;
    ShowColors[55]=ui->Color55;
    ShowColors[56]=ui->Color56;
    ShowColors[57]=ui->Color57;
    ShowColors[58]=ui->Color58;
    ////////////////
    Blocks[0][0]=ui->is00Glass;
    Blocks[1][0]=ui->is01Grass;
    Blocks[1][1]=ui->is01SlimeBlock;
    Blocks[2][0]=ui->is02BirchPlanks;
    Blocks[2][1]=ui->is02SmoothSandstone;
    Blocks[2][2]=ui->is02Glowstone;
    Blocks[2][3]=ui->is02EndStone;
    Blocks[2][4]=ui->is02EndBricks;
    Blocks[3][0]=ui->is03MushroomStem;
    Blocks[3][1]=ui->is03CobWeb;
    Blocks[4][0]=ui->is04RedstoneBlock;
    Blocks[4][1]=ui->is04TNT;
    Blocks[5][0]=ui->is05Ice;
    Blocks[5][1]=ui->is05PackedIce;
    Blocks[5][2]=ui->is05BlueIce;
    Blocks[6][0]=ui->is06IronBlock;
    Blocks[6][1]=ui->is06BrewingStand;
    Blocks[6][2]=ui->is06IronPlate;
    Blocks[6][3]=ui->is06IronTrapDoor;
    Blocks[6][4]=ui->is06Lantern;
    Blocks[6][5]=ui->is06Grindstone;
    Blocks[7][0]=ui->is07OakLeaves;
    Blocks[7][1]=ui->is07SpruceLeaves;
    Blocks[7][2]=ui->is07BirchLeaves;
    Blocks[7][3]=ui->is07JungleLeaves;
    Blocks[7][4]=ui->is07AcaciaLeaves;
    Blocks[7][5]=ui->is07DarkOakLeaves;
    Blocks[8][0]=ui->is08Concrete;
    Blocks[8][1]=ui->is08Wool;
    Blocks[8][2]=ui->is08StainedGlass;
    Blocks[8][3]=ui->is08SnowBlock;
    Blocks[9][0]=ui->is09Clay;
    Blocks[10][0]=ui->is10CoarseDirt;
    Blocks[10][1]=ui->is10PolishedGranite;
    Blocks[10][2]=ui->is10JunglePlanks;
    Blocks[10][3]=ui->is10BrownMushroomBlock;
    Blocks[10][4]=ui->is10Dirt;
    Blocks[11][0]=ui->is11Cobblestone;
    Blocks[11][1]=ui->is11Stone;
    Blocks[11][2]=ui->is11SmoothStone;
    Blocks[11][3]=ui->is11StoneBricks;
    Blocks[12][0]=ui->is12Water;
    Blocks[13][0]=ui->is13OakPlanks;
    Blocks[14][0]=ui->is14PolishedDiorite;
    Blocks[14][1]=ui->is14QuartzBlock;
    Blocks[14][2]=ui->is14SeaLantern;
    Blocks[14][3]=ui->is14Target;
    Blocks[15][0]=ui->is15Concrete;
    Blocks[15][1]=ui->is15Wool;
    Blocks[15][2]=ui->is15StainedGlass;
    Blocks[15][3]=ui->is15AcaciaPlanks;
    Blocks[15][4]=ui->is15Pumpkin;
    Blocks[15][5]=ui->is15Terracotta;
    Blocks[15][6]=ui->is15SmoothRedsandstone;
    Blocks[15][7]=ui->is15HoneyBlock;
    Blocks[15][8]=ui->is15Honeycomb;

    Blocks[16][0]=ui->is16Concrete;
    Blocks[16][1]=ui->is16Wool;
    Blocks[16][2]=ui->is16StainedGlass;
    Blocks[16][3]=ui->is16PurpurBlock;

    Blocks[17][0]=ui->is17Concrete;
    Blocks[17][1]=ui->is17Wool;
    Blocks[17][2]=ui->is17StainedGlass;
    Blocks[18][0]=ui->is18Concrete;
    Blocks[18][1]=ui->is18Wool;
    Blocks[18][2]=ui->is18StainedGlass;
    Blocks[18][3]=ui->is18HayBlock;

    Blocks[19][0]=ui->is19Concrete;
    Blocks[19][1]=ui->is19Wool;
    Blocks[19][2]=ui->is19StainedGlass;
    Blocks[20][0]=ui->is20Concrete;
    Blocks[20][1]=ui->is20Wool;
    Blocks[20][2]=ui->is20StainedGlass;
    Blocks[21][0]=ui->is21Concrete;
    Blocks[21][1]=ui->is21Wool;
    Blocks[21][2]=ui->is21StainedGlass;
    Blocks[22][0]=ui->is22Concrete;
    Blocks[22][1]=ui->is22Wool;
    Blocks[22][2]=ui->is22StainedGlass;
    Blocks[23][0]=ui->is23Concrete;
    Blocks[23][1]=ui->is23Wool;
    Blocks[23][2]=ui->is23StainedGlass;
    Blocks[23][3]=ui->is23Prismarine;

    Blocks[24][0]=ui->is24Concrete;
    Blocks[24][1]=ui->is24Wool;
    Blocks[24][2]=ui->is24StainedGlass;
    Blocks[25][0]=ui->is25Concrete;
    Blocks[25][1]=ui->is25Wool;
    Blocks[25][2]=ui->is25StainedGlass;
    Blocks[26][0]=ui->is26Concrete;
    Blocks[26][1]=ui->is26Wool;
    Blocks[26][2]=ui->is26StainedGlass;
    Blocks[26][3]=ui->is26DarkOakPlanks;
    Blocks[26][4]=ui->is26SoulSand;
    Blocks[26][5]=ui->is26SoulSoil;

    Blocks[27][0]=ui->is27Concrete;
    Blocks[27][1]=ui->is27Wool;
    Blocks[27][2]=ui->is27StainedGlass;
    Blocks[27][3]=ui->is27KelpBlock;

    Blocks[28][0]=ui->is28Concrete;
    Blocks[28][1]=ui->is28Wool;
    Blocks[28][2]=ui->is28StainedGlass;
    Blocks[28][3]=ui->is28Bricks;
    Blocks[28][4]=ui->is28RedMushroomBlock;
    Blocks[28][5]=ui->is28WartBlock;
    Blocks[28][6]=ui->is28Shroomlight;

    Blocks[29][0]=ui->is29Concrete;
    Blocks[29][1]=ui->is29Wool;
    Blocks[29][2]=ui->is29StainedGlass;
    Blocks[29][3]=ui->is29Obsidian;
    Blocks[29][4]=ui->is29CoalBlock;
    Blocks[29][5]=ui->is29Basalt;
    Blocks[29][6]=ui->is29BlackStone;

    Blocks[30][0]=ui->is30GoldBlock;
    Blocks[30][1]=ui->is30GoldPlate;

    Blocks[31][0]=ui->is31DiamondBlock;
    Blocks[31][1]=ui->is31PrismarineBricks;
    Blocks[31][2]=ui->is31DarkPrismarine;

    Blocks[32][0]=ui->is32LapisBlock;

    Blocks[33][0]=ui->is33EmeraldBlock;

    Blocks[34][0]=ui->is34Podzol;
    Blocks[34][1]=ui->is34SprucePlanks;
    Blocks[34][2]=ui->is34Campfire;

    Blocks[35][0]=ui->is35Netherrack;
    Blocks[35][1]=ui->is35NetherBricks;
    Blocks[35][2]=ui->is35Magma;

    Blocks[36][0]=ui->is36Terracotta;
    Blocks[37][0]=ui->is37Terracotta;
    Blocks[38][0]=ui->is38Terracotta;
    Blocks[39][0]=ui->is39Terracotta;
    Blocks[40][0]=ui->is40Terracotta;
    Blocks[41][0]=ui->is41Terracotta;
    Blocks[42][0]=ui->is42Terracotta;
    Blocks[43][0]=ui->is43Terracotta;
    Blocks[44][0]=ui->is44Terracotta;
    Blocks[45][0]=ui->is45Terracotta;
    Blocks[46][0]=ui->is46Terracotta;
    Blocks[47][0]=ui->is47Terracotta;
    Blocks[48][0]=ui->is48Terracotta;
    Blocks[49][0]=ui->is49Terracotta;
    Blocks[50][0]=ui->is50Terracotta;
    Blocks[51][0]=ui->is51Terracotta;

    Blocks[52][0]=ui->is52CrimsonNylium;
    Blocks[53][0]=ui->is53CrimsonPlanks;
    Blocks[53][1]=ui->is53StrippedCrimsonLog;

    Blocks[54][0]=ui->is54CrimsonStem;
    Blocks[54][1]=ui->is54StrippedCrimsonStem;

    Blocks[55][0]=ui->is55WarpedNylium;

    Blocks[56][0]=ui->is56WarpedPlanks;
    Blocks[56][1]=ui->is56StrippedWarpedLog;

    Blocks[57][0]=ui->is57WarpedStem;
    Blocks[57][1]=ui->is57StrippedWarpedStem;

    Blocks[58][0]=ui->is58WarpedWartBlock;
}


#endif
