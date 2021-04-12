function [] = MLGHelp(varargin)
%%MINECRAFT Map Landform Generator By TokiNoBug from SCT��DRC server
%%MC��ͼ���������� �����ߣ�TokiNoBugʱ֮�� ����SCT��DRC������
if nargin>=1
In=varargin{1};
else
    In="help";
end
In=lower(In);

switch In
    case "help"
        disp("��ӭʹ��MC��ͼ����������v1.0��")
        disp("�����������Ϊ���ṩ���������Ľ��ܺͰ�����")
        disp("MC��ͼ����������(Minecraft Map Landform Generator�����MLG)���Ը��ݵ�ͼ�ļ������ݣ�������Ӧ�ĵ��Ρ�")
        disp("�����������Ҫ���ô����ڲ����׵������У��õ�ͼ��ʾ�Զ����ͼƬ�������ĵ�ͼͨ��������Ʒչʾ��������װ�Ρ�")
        disp("Ҫ����ʾ��ͼ�ļ�������Ҫ��ʹ��mc-map.djfun.de/�����վ��������������ͬ�Ĺ��ߣ����Զ����ͼƬת��Ϊ��ͼ�ļ���")
        disp("��ͼ�ļ�����Ϸ������¼��ͼ���ݵ��ļ���ͨ������Ϊmap_i.dat������i�ǵ�ͼ��id��Ϊһ����Ȼ������ͼ�ļ�����Ϸ�浵��data�ļ����¡�")
        disp("��ͼָ��Ϸ�ڼ�¼���ε���Ʒ��������Ϸ�浵��")
        disp("����Ҫ����NBT Explorer��ȡ��ͼ�ļ��ڼ�¼�ĵ�ͼ���ݣ�Ȼ���������ݵĸ�ʽ�������ݵ����ұ�д�ĺ����������һ��mcfunction�ļ�������Ϸ��������������Ϳ��Դ�����ͼ���ݶ�Ӧ�ĵ��Ρ�")
        disp("��һ����д��5���������ֱ���MLGHelp��Raw_to_BCD��GetHeight��MapExport��EzExport��")
        disp("����MLGHelp('help')���Բ鿴��ΰ���")
        disp("����MLGHelp('list')���Բ鿴�����ұ�д�ĺ������б�")
        disp("����MLGHelp('Raw_to_BCD')���Բ鿴Raw_to_BCD��������Ľ���")
        disp("����MLGHelp('GetHeight')���Բ鿴GetHeight��������Ľ���")
        disp("����MLGHelp('MapExport')���Բ鿴MapExport��������Ľ���")
        disp("����MLGHelp('EzExport')���Բ鿴EzExport��������Ľ���")
        disp("����MLGHelp('mode')���Բ鿴�������õĵ������ε�ģʽ��")
        disp("��Щ������������TokiNoBugʱ֮��")
    case "list"
        disp("����Ϊȫ��������")
        disp("MLGHelp���ṩ�������ļ�")
        disp("EzExport���԰���һ����λ���ɵ�ͼ������������������������")
        disp("Raw_to_BCD���ڽ�һ���������ݸ�ʽ����õ�ͼ�ĵ�ͼɫ���󡢻�ɫ�������Ⱦ���")
        disp("GetHeight�������ɵ��εĸ߶Ⱦ����ˮ�б�")
        disp("MapExport������������������������һ��mc���������mc����������ͼ��Ӧ�ĵ���")
    case "mode"
        disp("���ڴ������ͼ��ɫ���ɼ�������ʮ���ַ��鹲��������Ԥ���˼����ʺ�����ģʽ�ķ����б�")
        disp("ÿ���б�Ϊһ�ֵ�ͼ��ɫѡ����Ψһ��Ӧ��һ�ַ��飬ÿһ��ģʽ����Ӧһ���б�")
        disp("Ĭ�ϣ�Default���ķ����б�ֻ�ʺ��ڴ���ģʽ��ÿ����ͼ��ɫ��ѡ�����������ֻ�ɫ���Ƶķ���")
        disp("Survival_BetterģʽΪ��ͨ������ģʽ��ƣ������滻���˰���ġ����������ķ��顣����һЩ��ͼ��ɫ��Ӧ�ķ���Ψһ�������ر��٣�������Ȼ�Ƚϰ���")
        disp("InstBreakģʽ�����ܶ��ѡ�����˲���ƻ������ܹ����������ķ��飬�ʺ�����ģʽ�»��ղ��ϡ�����顢�̱�ʯ������ʯ���޷��滻��")
        disp("Replaceģʽ������Ĭ�ϵĻ������Զ����滻ÿ�ֻ�ɫ�ķ��飬�ʺ������޸ģ���Ҫ������һ��n��2�е��б�ÿ�е�һ������Ҫ�滻����ĵ�ͼ��ɫ���ڶ����Ǹû�ɫ��Ӧ���Զ��巽�顣")
        disp("Customģʽ���Գ����Զ����滻���������б�����Ҫ�������������Զ��巽���б�")
        disp("����MLGHelp('Defalut'/'Survival_Better'/'InsBreak'/'Replace'/'Custom')���Ի�ö�Ӧ�ķ����б�")
    
        BL=["glass","grass_block","sand_stone","mushroom_stem","redstone_block","ice","iron_block","birch_leaves","snow","clay","dirt","cobblestone","water","oak_planks","polished_diorite","orange_concrete","magenta_concrete","light_blue_concrete","yellow_concrete","lime_concrete","pink_concrete","gray_concrete","light_gray_concrete","cyan_concrete","purple_concrete","blue_concrete","brown_concrete","green_concrete","red_concrete","black_concrete","gold_block","diamond_block","lapis_block","emerald_block","spruce_planks","magma_block","white_terracotta","orange_terracotta","magenta_terracotta","light_blue_terracotta","yellow_terracotta","lime_terracotta","pink_terracotta","gray_terracotta","light_gray_terracotta","cyan_terracotta","purple_terracotta","blue_terracotta","brown_terracotta","green_terracotta","red_terracotta","black_terracotta"];
    case "default"
        disp(BL)
    case "survival_better"
        CBL=[10,"jungle_planks";11,"stone";31,"prismarine_bricks";35,"netherrack";];
        disp(CBL)
        disp("ʹ��Replaceģʽ�����滻��")
    case "instbreak"
        CBL=[2,"smooth_sandstone";4,"tnt";6,"brewing_stand";8,"snow_block";10,"brown_mushroom_block";11,"smooth_stone";13,"note_block";15,"smooth_red_sandstone";16,"magenta_stained_glass";17,"light_blue_stained_glass";18,"yellow_stained_glass";19,"lime_stained_glass";20,"pink_stained_glass";21,"gray_stained_glass";22,"light_gray_stained_glass";23,"prismarine";24,"purple_stained_glass";25,"blue_stained_glass";26,"brown_stained_glass";27,"green_stained_glass";28,"red_stained_glass";29,"black_stained_glass";34,"podzol";];
        disp(CBL)
        disp("ʹ��Replaceģʽ�����滻��")
    case "replace"
        disp("��Ҫ�����Զ����n*2�޸��б�����������Զ�����޸��б���Ĭ�Ϸ����б����滻�������滻�ķ��顣")
        disp("����Ҫ����������Ҫ�滻�ķ��飬�ʺ�С���޸ġ�")
        disp("�Զ����޸��б��ʽ���£�")
        disp("[<��ɫid> , <�滻�ķ���id> ; <��ɫid> , <�滻�ķ���id> ; ����]")
        disp("���磺")
        disp([10,"jungle_planks";11,"stone";31,"prismarine_bricks";35,"netherrack";])
    case "custom"
        disp("�Զ������������б���Ҫ����������52�л�ɫ�ķ����б�")
        disp("�Զ���ķ����б��в�Ӧ������ɫid��ֻ��Ҫ���ջ�ɫid�ɴ�С�����ų�һ���ı����ɵ���/��������")
        disp("�����ʽ�ο�Ĭ�Ϸ����б�����MLGHelp('Default')�鿴��")
        
        
        
        
    otherwise
        disp("û�ж�Ӧ�İ�����Ϣ��������MLGHelp('list')�鿴���п��õİ�����Ϣ������ʹ��MLGHelp(help)�鿴����������")
end

