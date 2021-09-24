注意：本仓库是立体地图画的上一代版本，因为开发环境等原因已经被关闭，不再更新。

关于地图画生成器，请访问[SlopeCraft](https://github.com/ToKiNoBug/SlopeCraft). 

Notice: This repo is an earlier generation of 3d map pixel art generator. This repo will be archived and never updated.

About 3d map pixel art generator, see [SlopeCraft](https://github.com/ToKiNoBug/SlopeCraft). 

# 3dPixelPaintingInMinecraft<br>
在minecraft中生成3d的地图画<br>
<br>
## 软件简介<br>
Slope软件是我（TokiNoBug）用matlab开发的、用于在minecraft中生成立体地图画的软件。<br>
与spritecraft等像素画软件不同，Slope是专门面向地图的像素画，它设计的目的就是让你用地图将像素画记录下来，然后贴在物品展示框上。这里地图指游戏中可以记录地形的物品，不是存档。<br>
所以，Slope的颜色调整模块是完全面向地图的，它不是为了让像素画在玩家视角中接近原图，而是为了让像素画在地图的“视角”中接近原图。<br>
由于地图中的颜色与方块的相对高度有关，所以Slope生存的地图画往往不是平板的，而是立体的，是人工地形。我将其称为立体地图画。<br>
一言以蔽之，Slope是为地图而设计的。<br>
正是因此，利用Slope制作的地图画的“画质”，比spritecraft导出、再用地图记录的地图画要好很多——因为专业。<br>
<br>
<br>
## 地图画的游戏版本、类型、颜色空间和方块列表是怎么一回事？<br>
在Slope中，你可以调节地图画所对应的游戏版本、地图画类型、颜色空间和方块列表。我将一一简述这些参数是怎么回事。<br>
### 1.游戏版本：<br>
Slope支持的minecraft版本为1.12\~1.16。其中从1.12到1.15的地图没有什么变化，最多只有204种颜色；而1.16则为了下界树木增加了28种颜色，达到了232色。（这里的颜色忽略透明）<br>
### 2.地图画类型：<br>
Creative类型的地图画可以使用到完整的204/232种颜色，享受最高的画质；但它不能导出为立体地图画，
只能导出为地图文件，利用作弊的方法在存档中呈现。<br>关于这种方法，可以使用 "mc-map.djfun.de" 这个网站。<br>
Survival类型的地图画则牺牲了1/4的颜色，换来可以在原版生存实装的优点。这种地图画可以生成为三维地图画，也是这个软件的核心功能。<br>
Flat类型的地图画是平板的。由于立体地图画实装的难度很高，我特意开发了平板地图画的功能。<br>平板地图画顾名思义，是传统平坦的像素画，它最容易实装，但只有Creative类型1/4的颜色：51/58色。<br>
这里需要注明，Survival类型与Creative类型冲突，地图画只能为其中一种；但Flat类型的地图画与它们平行（虽然平坦的Creative没什么意义）。<br>
### 3.颜色空间：<br>
这是比较专业的部分。简单来说不同的颜色空间是用不同的方式去描述颜色。在Slope中，它代表着不同的调整颜色的方式。<br>
Slope中使用了4种颜色空间：RGB、HSV、Lab、XYZ。（CMY模式已移除）<br>
其中Lab模式对大多数图片的调整效果最好，我将它设为默认。但具体到每个像素画，你最好依次尝试一下，选择视觉效果最好的调整方案。<br>
### 4.方块列表：<br>
这是最为重要的部分，它与最终生成的地图画息息相关。简单来说，地图中的每个基础颜色往往对应着多种方块，但导出的时候我们只能给每个基础颜色选择一种对应的方块。<br>
所以方块列表就是建造像素画的“材料表”，称之为方块列表。我预设了4种方块列表，分别为：Creative、Survival Cheaper、Survival Better和Instant Break。<br>
Creative方块列表尽量还原每一种基础颜色的“原汁原味”，如沙子的颜色就对应砂岩、钻石块的颜色就对应钻石块等。
它往往不太适合生存实装（废话，3000个钻石块爽死你），只适合创造模式演示，因此我命名为Creative。<br>
Survival Cheaper是极度优化的方块列表，一切基础颜色都尽全力选择生存中最容易获得的、最廉价的方块，比如“下界”的颜色使用地狱岩、“白色”使用雪块。它适合生存的早期和中期。<br>
Survival Better是“优化的不那么狠”的方块列表，它尽量选择了生存中可以量产，又“足够优雅”的方块，如“白色”使用白色混凝土。它适合生存的后期，是首选，也是默认。<br>
Instant Break顾名思义，是“瞬间破坏”。它尽量选用可以在效率5钻石镐+急迫2效果下可以被瞬间破坏的方块，便于玩家拆除。如“白色”使用白色染色玻璃<br>
Custom是自定义的方块列表，这部分的功能还没完成。<br>
<br>
<br>
## Slope的功能<br>
Slope包含以下功能：<br>
导入图片、调整颜色、生成立体地图画、导出为minecraft数据包常用的.mcfunction格式。<br>
<br>
## 安装方法：<br>
在 版本号\安装包 文件中下载安装程序，下载完成后安装。<br>
<br>
## 使用方法：<br>
1.准备好你要转换的图片，使用ps等编辑图片的软件（甚至是画图也可以）将图片裁剪、缩放，使图片的长和宽均为128像素的整数倍。<br>
2.打开Slope.exe，等待大概1分钟（软件启动很慢）；<br>
3.点击 导入图片 按钮，选择你裁剪后的图片，程序会将这个图片导入。<br>
4.选择适当的游戏版本、地图画类型、颜色空间和方块列表，点击 调整颜色 按钮，静待片刻。<br>
5.点击 显示原图 或 显示调整后图片 对比，选择看着最顺眼的调整方案。<br>
6.在 地图西北角坐标 中输入地图西北角的坐标。地图只能是不缩放的（缩放了没有意义）。如果不知道该填什么坐标，那就写入-64,5,-64吧。<br>
7.点击 生成地图画 ，生成出地图画。静待地图画生成完成。<br>
8.点击 导出为mcfunction ，选择保存文件的位置后，等待程序导出。这个过程往往比较慢，需要1\~10分钟。请耐心等待。<br>
9.生成完毕后就可以关闭软件了。随便找一个创造模式的单机存档（最好是虚空超平坦），创建一个数据包（如果不会，请翻wiki；如果还不会，直接使用 v2.0 文件夹下的示范存档（版本1.16.4）。<br>
把函数移动到数据包的function文件夹里。这里我假设保存的文件为test.mcfunction，它被放在名为cubicmap的数据包中。<br>
10.打开minecraft，打开这个存档，将自己tp到地图画附近（地图西北角坐标就行），运行命令/reload。<br>
11.运行命令/function cubicmap:test，minecraft会执行这个函数<br>
12.等待函数执行完毕后，拿出你的小木棍/小木斧，圈投影。注意，地图画的长比宽多1，它有一溜石头方块呢！<br>
