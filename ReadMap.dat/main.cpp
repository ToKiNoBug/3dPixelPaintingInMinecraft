#include <iostream>
#include <iomanip>
#include <fstream>
#include <cstring>
/* run this program using the console pauser or add your own getch, system("pause") or input loop */
using namespace std;
#include "NBT.h"
//char FileName[32]="map_152";
int main(int argc, char** argv) {
	char FileName[32];
	cout<<"��������������ļ�����";
	gets(FileName);
	cout<<endl<<"���ڷ����У�"<<endl;
	ReadMap(FileName);
	//RawExport();
	Raw2Color();
	//ColorExport();
	Color2BaseDepth();
	BaseExport();
	DepthExport();
	system("pause");
	return 0;
}
