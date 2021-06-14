
-----------------------这个脚本是得到配置表的数据---------------------------
--首先要明确，json的数据我们已经打包到ab包中了
--现在需要通过ab包管理器来加载他
local txt=ABMgr:LoadRes("json","ItemData",typeof(CS.UnityEngine.TextAsset))

print(txt.text)--拿到文本中的所有内容，然后打印出来
--获取它的文本信息 进行json解析
--注意这个Json的解析  尤其是Json.decode()
local itemDataList=Json.decode(txt.text)

print(itemDataList[1])--注意lua的索引是从1开始的
--加载出来是一个像数组结构的数据
--不方便我们通过 id去获取里面的内容 所以 我们用一张新表转存一次
--而且这张 新的道具表 在任何地方 都能够被使用
--一张用来存储道具信息的表
--键值对形式  键是道具ID 值是道具表一行信息

ItemData = {}
for _, value in pairs(itemDataList) do
    ItemData[value.id] = value
end


----------测试看看数据有没有读取成功-------------------
-- for i=1,6 do
--     print(ItemData[i].id..ItemData[i].name)
--     print("\n")
-- end






