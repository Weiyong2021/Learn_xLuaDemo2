------------------------利用面向对象来构造一个格子对象---------------------
--注意，itemGird.lua就是一个格子对象

-------------要理解这一行的，这一行是关键-------------------
Object:subClass("itemGrid")

-------------------------“成员变量”----------------------------
itemGrid.obj=nil
itemGrid.imgItem=nil
itemGrid.txtNum=nil



---------------------------成员方法----------------------------
------------实例化格子对象----------------
--就是找到控件然后给上面的这三个赋予初始值-----------
function itemGrid:Init(father,posX,posY)
    --实例化出一个对象出来
    self.obj=ABMgr:LoadRes("ui","Item")
    --设置父对象
    self.obj.transform:SetParent(father,false)
    --设置他的位置
    self.obj.transform.localPosition=Vector3(posX,posY,0)

    --先找控件
    self.imgItem=self.obj.transform:Find("imgItem"):GetComponent(typeof(Image))
    self.txtNum=self.obj.transform:Find("txtNum"):GetComponent(typeof(Text))
 
end



----------------------初始化格子实例化之后的信息----------------------
function itemGrid:InitData(data)
    local data2=ItemData[data.id]
    local str=string.split(data2.icon,"_")
    --加载图集
    local spriteAtlas =ABMgr:LoadRes("ui",str[1],typeof(SpriteAtlas))

     --设置图片
    self.imgItem.sprite=spriteAtlas:GetSprite(str[2])

     --设置数量
    self.txtNum.text=data.num
 
end



-------------------------删除自己--------------------------
function itemGrid:Destroy()
         GameObject.Destroy(self.obj)
         self.obj=nil
end

