function [BlockList,NeedGlass] = ApplyBlockList(Mode,CBL)

NeedGlass=false(1,59);

%%Presser=[0,0,0,0];
%%0代表不使用压力板，1代表使用压力板。四个位置依次对应木质、石质、铁质和金质压力板。
BlockList=["glass","grass_block[snowy=false]","smooth_sandstone","mushroom_stem[east=true,west=true,north=true,south=true,up=true,down=true]","redstone_block","ice","iron_block","birch_leaves[distance=7,persistent=true]","snow_block","clay","coarse_dirt","cobblestone","water[level=0]","oak_planks","polished_diorite","orange_concrete","magenta_concrete","light_blue_concrete","yellow_concrete","lime_concrete","pink_concrete","gray_concrete","light_gray_concrete","cyan_concrete","purple_concrete","blue_concrete","brown_concrete","green_concrete","red_concrete","black_concrete","gold_block","diamond_block","lapis_block","emerald_block","podzol[snowy=false]","netherrack","white_terracotta","orange_terracotta","magenta_terracotta","light_blue_terracotta","yellow_terracotta","lime_terracotta","pink_terracotta","gray_terracotta","light_gray_terracotta","cyan_terracotta","purple_terracotta","blue_terracotta","brown_terracotta","green_terracotta","red_terracotta","black_terracotta","crimson_nylium","crimson_planks","crimson_hyphae[axis=y]","warped_nylium","warped_planks","warped_hyphae[axis=y]","warped_wart_block"];


if strcmp(Mode,"Survival_Cheaper")
    CBL.BlockList=["birch_planks","heavy_weighted_pressure_plate[power=0]","white_concrete","coarse_dirt","target[power=0]","light_weighted_pressure_plate[power=0]","prismarine_bricks","spruce_planks"];
    CBL.BaseList=[2,6,8,10,14,30,31,34];
    NeedGlass([6,30]+1)=true;
    CBL.NeedGlass=NeedGlass;
    Mode="Custom";
end

if strcmp(Mode,"InstBreak")
    CBL.BlockList=["slime_block","tnt[unstable=false]","heavy_weighted_pressure_plate[power=0]","white_stained_glass","coarse_dirt","stone","note_block[instrument=harp,note=0,powered=false]","target[power=0]","orange_stained_glass","magenta_stained_glass","light_blue_stained_glass","yellow_stained_glass","lime_stained_glass","pink_stained_glass","gray_stained_glass","light_gray_stained_glass","cyan_stained_glass","purple_stained_glass","blue_stained_glass","brown_stained_glass","green_stained_glass","red_stained_glass","black_stained_glass","light_weighted_pressure_plate[power=0]","prismarine_bricks"];
    CBL.BaseList=[1,4,6,8,10,11,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
    NeedGlass([6,30]+1)=true;
    CBL.NeedGlass=NeedGlass;
    Mode="Custom";
end

if strcmp(Mode,"Survival_Better")
    CBL.BlockList=["slime_block","birch_planks","packed_ice","white_concrete","jungle_planks","smooth_stone","quartz_block","prismarine_bricks","spruce_planks","netherbricks","stripped_crimson_hyphae[axis=y]","stripped_warped_hyphae[axis=y]"];
    CBL.BaseList=[1,2,5,8,10,11,14,31,34,35,54,57];
    
    Mode="Custom";
end

if strcmp(Mode,"Glowing")
    CBL.BlockList=["slime_block","glowstone","packed_ice","lantern[hanging=false]","white_concrete","jungle_planks","smooth_stone","sea_lantern","shroomlight","prismarine_bricks","campfire[facing=north,lit=true,signal_fire=false,waterlogged=false]","magma_block","stripped_crimson_hyphae[axis=y]","stripped_warped_hyphae[axis=y]"];
    CBL.BaseList=[1,2,5,6,8,10,11,14,28,31,34,35,54,57];
    Mode="Custom";
end

if strcmp(Mode,"Custom")
    u=~strcmp(CBL.BlockList,"");
    CBL.BaseList=CBL.BaseList(u);
    CBL.BlockList=CBL.BlockList(u);
    BlockList(CBL.BaseList+1)=CBL.BlockList;
    NeedGlass=CBL.NeedGlass;
end
end

