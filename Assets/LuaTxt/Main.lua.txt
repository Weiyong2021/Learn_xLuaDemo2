print("----------准备就绪--------------")

-------------------常用类的别名准备好 ，为以后的调用方便准备--------------
require("initClass")


---------------------数据的准备  读取json表中道具信息的数据--------------
require("itemData")

-----------------------初始化玩家的数据----------------------------------
require("PlayerData")
PlayerData:Init()

----------------------之后的核心逻辑都在这里写----------------------------

require("BasePanel")

require("MainPanel")

require("BagPanel")

require("itemGrid")


--显示主面板
MainPanel:ShowMe()






















