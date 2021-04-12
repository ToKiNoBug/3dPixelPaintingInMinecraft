#pragma once
#ifndef MCMAP_CPP
#define MCMAP_CPP
#include "mcmap.h"
#include <iostream>
#include <fstream>
using namespace std;
void readFromFile(const char*FileName,MatrixXf& M)
{
    fstream Reader(FileName, ios::in|ios::binary);
    float data[256][3];
    Reader.read((char*)&data[0][0],sizeof(data));
    Reader.close();
    M.setZero(256,3);
    for(short r=0;r<256;r++)
    {M(r,0)=data[r][0];
    M(r,1)=data[r][1];
    M(r,2)=data[r][2];
    }
    return;
}

void GetMap(unsigned char *Map)
{
    for(short r=0;r<256;r++)Map[r]=4*(r%64)+r/64;
    return;
}

ColorSet::ColorSet(bool isStandard)
{
    if(!isStandard)
    {
        Map=NULL;
        return;
    }
    Map=new unsigned char[256];
    GetMap(Map);
    RGB.setZero(256,3);
    HSV.setZero(256,3);
    Lab.setZero(256,3);
    XYZ.setZero(256,3);


    return;
}

void ColorSet::ApplyAllowed(bool *MIndex)
        {
        for(short r=0;r<256;r++)
        {
        if (MIndex[r])continue;
        RGB.row(r).fill(1e20f);
        HSV.row(r).fill(1e20f);
        Lab.row(r).fill(1e20f);
        XYZ.row(r).fill(1e20f);
        }
        return;
        }

void GetBLCreative(short*BL)
{
short Crea[64]={0,0,1,1,0,0,0,0,3,0,4,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
for(short i=0;i<64;i++)
    BL[i]=Crea[i];
return;
}

void GetBLCheaper(short*BL)
{
    short Chea[64]={0,0,0,0,1,0,5,2,3,0,4,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    for(short i=0;i<64;i++)
        BL[i]=Chea[i];
    return;
}

void GetBLBetter(short*BL)
{
short Bett[64]={0,1,1,0,0,2,0,2,0,0,3,2,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0};
for(short i=0;i<64;i++)
    BL[i]=Bett[i];
return;
}

void GetBLGlowing(short*BL)
{
short Glow[64]={0,1,2,0,0,2,4,2,0,0,3,2,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,9,0,0,1,0,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0};
for(short i=0;i<64;i++)
    BL[i]=Glow[i];
return;
}

mcMap::mcMap()
{
    is16=true;
    isFlat=false;
    isSurvival=true;
    step=1;//1,2,3,4,5,6,7.     1 代表进度为0
    Basic=new ColorSet(true);
    Allowed=new ColorSet(false);
   // BLCreative[0]=0;
    return;
}

mcMap::~mcMap()
{
    return;
}


#endif
