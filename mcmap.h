#ifndef MCMAP_H
#define MCMAP_H
#include  <Eigen/Dense>
using namespace Eigen;

class ColorSet{
    public:
        MatrixXf RGB;
        MatrixXf HSV;
        MatrixXf Lab;
        MatrixXf XYZ;
        unsigned char *Map;
        ColorSet(bool isStandard);
        void ApplyAllowed(bool *MIndex);
};


class mcMap
{
public:
        mcMap();
        mcMap(mcMap*p);
      ~mcMap();
        bool is16;
        bool isFlat;
        bool isSurvival;
        int step;
        ColorSet *Basic;
        ColorSet *Allowed;
        bool colorAllowed[256];
        //Colors
        //rawPic*
        //MapPic*
        //AdjedPic*
        //NBTWriter*
        //Build
        //

};

#endif // MCMAP_H
