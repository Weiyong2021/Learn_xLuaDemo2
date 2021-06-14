--------------------------玩家数据准备-----------------------------

PlayerData = {}
--我们目前只做背包功能 所以只需要它的道具信息即可

--PlayerData的大表中存有三张小表
PlayerData.equips = {}--存储装备的小表
PlayerData.items = {}--存储道具的小表
PlayerData.gems = {}--存储宝石的小表

--为玩家数据写了一个 初始化方法 以后直接改这里的数据来源即可
function PlayerData:Init()
    --道具信息 不管存本地 还是存服务器 都不会把道具的所有信息存进去
    --道具ID和道具数量  
    
    --目前因为没有服务器 为了测试 我们就写死道具数据作为玩家信息
    table.insert(self.equips, {id = 1, num = 1})
    table.insert(self.equips, {id = 2, num = 1})

    table.insert(self.items, {id = 3, num = 50})
    table.insert(self.items, {id = 4, num = 20})

    table.insert(self.gems, {id = 5, num = 99})
    table.insert(self.gems, {id = 6, num = 88})
end