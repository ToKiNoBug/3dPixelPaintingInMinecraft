# 3dPixelPaintingInMinecraft
在minecraft中生成3d的地图画

实话说这是一个很普通的matlab程序，代码水平简陋但确保无虫。
它可以根据游戏的地图文件（map_i.dat）生成出一个mcfunction文件（minecraft数据包的函数），运行这个mcfuntion函数就可以在minecraft中重建出地图所描绘的地形。

它最主要的作用是构建立体的像素画。方块之间的相对高度关系编织出三种阴影，我充分利用了地图的51种基色和3种阴影，让地图可以显示出尽量丰富的画质。
153种基色可以让地图（游戏中的物品，而非存档）显示的像素画具有最丰富的的色彩，这远比平板像素画要好。

关于立体像素画的更多细节可以看这个视频，以及视频简介：
https://www.bilibili.com/video/BV1Ci4y1E7oU

