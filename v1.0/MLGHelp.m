function [] = MLGHelp(varargin)
%%MINECRAFT Map Landform Generator By TokiNoBug from SCT＆DRC server
%%MC地图地形生成器 开发者：TokiNoBug时之虫 来自SCT＆DRC服务器
if nargin>=1
In=varargin{1};
else
    In="help";
end
In=lower(In);

switch In
    case "help"
        disp("欢迎使用MC地图地形生成器v1.0。")
        disp("这个函数用于为你提供其他函数的介绍和帮助。")
        disp("MC地图地形生成器(Minecraft Map Landform Generator，简称MLG)可以根据地图文件的内容，生成相应的地形。")
        disp("这个生成器主要的用处是在不作弊的生存中，让地图显示自定义的图片。这样的地图通常放在物品展示框里用作装饰。")
        disp("要想显示地图文件，你需要先使用mc-map.djfun.de/这个网站或者其他功能相同的工具，将自定义的图片转化为地图文件。")
        disp("地图文件是游戏用来记录地图内容的文件，通常名字为map_i.dat。其中i是地图的id，为一个自然数。地图文件在游戏存档的data文件夹下。")
        disp("地图指游戏内记录地形的物品，不是游戏存档。")
        disp("你需要先用NBT Explorer获取地图文件内记录的地图内容，然后整理数据的格式，把数据导入我编写的函数后会生成一个mcfunction文件，在游戏中运行这个函数就可以创建地图内容对应的地形。")
        disp("我一共编写了5个函数，分别是MLGHelp，Raw_to_BCD，GetHeight，MapExport和EzExport。")
        disp("输入MLGHelp('help')可以查看这段帮助")
        disp("输入MLGHelp('list')可以查看所有我编写的函数的列表")
        disp("输入MLGHelp('Raw_to_BCD')可以查看Raw_to_BCD这个函数的介绍")
        disp("输入MLGHelp('GetHeight')可以查看GetHeight这个函数的介绍")
        disp("输入MLGHelp('MapExport')可以查看MapExport这个函数的介绍")
        disp("输入MLGHelp('EzExport')可以查看EzExport这个函数的介绍")
        disp("输入MLGHelp('mode')可以查看所有内置的导出地形的模式。")
        disp("这些函数的作者是TokiNoBug时之虫")
    case "list"
        disp("以下为全部函数：")
        disp("MLGHelp是提供帮助的文件")
        disp("EzExport可以帮你一步到位生成地图画，它调用了以下三个函数")
        disp("Raw_to_BCD用于进一步整理数据格式，获得地图的地图色矩阵、基色矩阵和深度矩阵")
        disp("GetHeight用于生成地形的高度矩阵和水列表")
        disp("MapExport利用上述几个矩阵最终生成一个mc函数，这个mc函数创建地图对应的地形")
    case "mode"
        disp("由于大多数地图基色都由几种乃至十几种方块共享，所以我预设了几种适合生存模式的方块列表")
        disp("每个列表都为一种地图基色选定了唯一对应的一种方块，每一个模式都对应一个列表")
        disp("默认（Default）的方块列表只适合于创造模式，每个地图基色都选择了最能体现基色名称的方块")
        disp("Survival_Better模式为普通的生存模式设计，尽量替换掉了昂贵的、难以量产的方块。但有一些地图基色对应的方块唯一，或者特别少，所以仍然比较昂贵。")
        disp("InstBreak模式尽可能多的选择可以瞬间破坏，又能够大量生产的方块，适合生存模式下回收材料。但金块、绿宝石块和青金石块无法替换。")
        disp("Replace模式可以在默认的基础上自定义替换每种基色的方块，适合少量修改，需要你输入一个n行2列的列表，每行第一列是需要替换方块的地图基色，第二列是该基色对应的自定义方块。")
        disp("Custom模式可以彻底自定义替换整个方块列表，但需要你输入完整的自定义方块列表。")
        disp("输入MLGHelp('Defalut'/'Survival_Better'/'InsBreak'/'Replace'/'Custom')可以获得对应的方块列表。")
    
        BL=["glass","grass_block","sand_stone","mushroom_stem","redstone_block","ice","iron_block","birch_leaves","snow","clay","dirt","cobblestone","water","oak_planks","polished_diorite","orange_concrete","magenta_concrete","light_blue_concrete","yellow_concrete","lime_concrete","pink_concrete","gray_concrete","light_gray_concrete","cyan_concrete","purple_concrete","blue_concrete","brown_concrete","green_concrete","red_concrete","black_concrete","gold_block","diamond_block","lapis_block","emerald_block","spruce_planks","magma_block","white_terracotta","orange_terracotta","magenta_terracotta","light_blue_terracotta","yellow_terracotta","lime_terracotta","pink_terracotta","gray_terracotta","light_gray_terracotta","cyan_terracotta","purple_terracotta","blue_terracotta","brown_terracotta","green_terracotta","red_terracotta","black_terracotta"];
    case "default"
        disp(BL)
    case "survival_better"
        CBL=[10,"jungle_planks";11,"stone";31,"prismarine_bricks";35,"netherrack";];
        disp(CBL)
        disp("使用Replace模式进行替换。")
    case "instbreak"
        CBL=[2,"smooth_sandstone";4,"tnt";6,"brewing_stand";8,"snow_block";10,"brown_mushroom_block";11,"smooth_stone";13,"note_block";15,"smooth_red_sandstone";16,"magenta_stained_glass";17,"light_blue_stained_glass";18,"yellow_stained_glass";19,"lime_stained_glass";20,"pink_stained_glass";21,"gray_stained_glass";22,"light_gray_stained_glass";23,"prismarine";24,"purple_stained_glass";25,"blue_stained_glass";26,"brown_stained_glass";27,"green_stained_glass";28,"red_stained_glass";29,"black_stained_glass";34,"podzol";];
        disp(CBL)
        disp("使用Replace模式进行替换。")
    case "replace"
        disp("需要输入自定义的n*2修改列表，函数会根据自定义的修改列表，从默认方块列表中替换掉你想替换的方块。")
        disp("不需要包含所有需要替换的方块，适合小量修改。")
        disp("自定义修改列表格式如下：")
        disp("[<基色id> , <替换的方块id> ; <基色id> , <替换的方块id> ; ……]")
        disp("例如：")
        disp([10,"jungle_planks";11,"stone";31,"prismarine_bricks";35,"netherrack";])
    case "custom"
        disp("自定义整个方块列表，需要你输入所有52中基色的方块列表。")
        disp("自定义的方块列表中不应包含基色id，只需要按照基色id由大到小排序，排成一个文本构成的行/列向量。")
        disp("具体格式参考默认方块列表，输入MLGHelp('Default')查看。")
        
        
        
        
    otherwise
        disp("没有对应的帮助信息，请输入MLGHelp('list')查看所有可用的帮助信息。或者使用MLGHelp(help)查看基本帮助。")
end

