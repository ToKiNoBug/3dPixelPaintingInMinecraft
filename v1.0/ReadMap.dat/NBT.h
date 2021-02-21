unsigned char buf[16384]="Default";
unsigned short Color[128][128];
unsigned short Base[128][128];
short Depth[128][128];

//char FileName[32]="map_152";
void ReadMap(char*FileName) {
	char Reco[10]={'c','o','l','o','r','s',0,0,4*16+0,0};
	ifstream ifile;
	short i=0;
	ifile.open(FileName,ios::in|ios::binary);
	if(ifile.eof())
	{
		cout<<"文件打开失败"<<endl;
		return;
	}
	ifile.read((char*)buf,16384);
	i=0;
	while(i<=16383)
	{
		if(buf[i]=='c')
		{
			buf[0]=0;
			buf[0]+=(buf[i+0]==Reco[0]);
			buf[0]+=(buf[i+1]==Reco[1]);
			buf[0]+=(buf[i+2]==Reco[2]);
			buf[0]+=(buf[i+3]==Reco[3]);
			buf[0]+=(buf[i+4]==Reco[4]);
			buf[0]+=(buf[i+5]==Reco[5]);
			buf[0]+=(buf[i+6]==Reco[6]);
			buf[0]+=(buf[i+7]==Reco[7]);
			buf[0]+=(buf[i+8]==Reco[8]);
			buf[0]+=(buf[i+9]==Reco[9]);
			
			if(buf[0]==10)
			{
				cout<<"成功识别到Color数组"<<endl;
			ifile.seekg(i+10,ios::beg);
			ifile.read((char*)buf,16384);
			break;
		}
		}
		i++;
	}

	ifile.close();
	return;
}

void RawExport()
{
	char OutFile[32]="Raw.txt";
	ofstream ofile;	
	ofile.open(OutFile,ios::out);
	if(ofile.eof())
	{
		cout<<"文件打开失败"<<endl;
		return;
	}
	int i=0;
	ofile<<"Raw=";
	ofile<<'[';
	while(i<=16383)
	{
		ofile<<(int)buf[i]<<',';
		i++;
	}
	ofile<<']'<<endl;
	cout<<"成功提取出原始数据Raw矩阵"<<endl;
	ofile.close();
}


void Raw2Color()
{
	short i=0;
	short r=0,c=0;
	while(i<=16383)
	{
		c=i%128;
		if(c==-1)c=127;
		r=i/128;
		Color[r][c]=(unsigned short)buf[i];
		i++;
	}
	r=0;
	while(r<=127)
	{
		//swap(Color[r][0],Color[r][127]);
		r++;
	}
}

void ColorExport()
{
	char OutFile[32]="Colors.txt";
	ofstream ofile;	
	ofile.open(OutFile,ios::out);
	if(ofile.eof())
	{
		cout<<"文件打开失败"<<endl;
		return;
	}
	short r=0,c=0;
	ofile<<"Color=";
	ofile<<'[';
	while(r<=127)
	{
		c=0;
		while(c<=127)
		{
		ofile<<Color[r][c];
		c==127?ofile<<';':ofile<<',';
		c++;
		}
		r++;
	}
	ofile<<"];";
	cout<<"成功提取出地图色Color矩阵"<<endl;
	ofile.close();
}

void Color2BaseDepth()
{
	short r=0,c=0;
	while(r<=127)
	{
		c=0;
		while(c<=127)
		{
			Depth[r][c]=Color[r][c]%4;
			Base[r][c]=(Color[r][c]-Depth[r][c])/4;
			Base[r][c]<0?Base[r][c]+=64:0;
			c++;
		}
		
		r++;
	}
}

void BaseExport()
{
	char OutFile[32]="Base.txt";
	ofstream ofile;	
	ofile.open(OutFile,ios::out);
	if(ofile.eof())
	{
		cout<<"文件打开失败"<<endl;
		return;
	}
	short r=0,c=0;
		ofile<<"Base=";
	ofile<<'[';
	while(r<=127)
	{
		c=0;
		while(c<=127)
		{
		ofile<<Base[r][c];
		c==127?ofile<<';':ofile<<',';
		c++;
		}
		r++;
	}
	ofile<<"];";
	cout<<"成功提取出基色Base矩阵"<<endl;
	ofile.close();
}

void DepthExport()
{
	char OutFile[32]="Depth.txt";
	ofstream ofile;	
	ofile.open(OutFile,ios::out);
	if(ofile.eof())
	{
		cout<<"文件打开失败"<<endl;
		return;
	}
	short r=0,c=0;
	ofile<<"Depth=";
	ofile<<'[';
	while(r<=127)
	{
		c=0;
		while(c<=127)
		{
		ofile<<Depth[r][c];
		c==127?ofile<<';':ofile<<',';
		c++;
		}
		r++;
	}
	ofile<<"];";
	cout<<"成功提取出阴影Depth矩阵"<<endl;
	ofile.close();
}
