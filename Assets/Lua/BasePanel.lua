-----------面板基类----------
--利用面向对象
Object:subClass("BasePanel")
BasePanel.panelObj=nil

---存储面板下的所有的子控件，使用表来模拟一个字典存储
BasePanel.controls={}


--添加事件的标识

BasePanel.eventflog=false





function BasePanel:Init()
    if self.panelObj==nil then 
         --①--实例化面板对象
         self.panelObj=ABMgr:LoadRes("ui",self.name,typeof(GameObject))
         --设置父节点
         self.panelObj.transform:SetParent(Canvas,false)
 
         --找面板下所有的有用的控件
         --在Unity中，所有的UI的基类是UIBehaviour
         --在这里利用了，父类装子类的用法
         --找到面板下的所有的有关的UI的子控件
         local allControls=self.panelObj:GetComponentsInChildren(typeof(CS.UnityEngine.EventSystems.UIBehaviour))

         --遍历数组
         --如果存入的一些对我们没有用的UI控件
         --为了避免，找各种的无用的控件  我们定一个规则  
         --就是在拼接面板的时候，我们按照特定的命名规则来命名
         --Button    btn名字
         --Toggle    tog名字
         --Image     img名字
         --Text      txt名字
         --ScrollRect  sv名字
         for i=0,allControls.Length-1 do
            local controlName=allControls[i].name    --拿到控件的名字
            if string.find(controlName,"btn")~=nil or 
               string.find(controlName,"tog")~=nil or
               string.find(controlName,"img")~=nil or
               string.find(controlName,"txt")~=nil or
               string.find(controlName,"sv")~=nil then


                --比如  对于btnRole这个按钮来说，他身上有 Button  和Image两个组件
                --下面的代码在这个btnRole控件的时候，就会这样存起来
                --self.controls={["btnRole"]={Button,Image}}
                --但是，虽然这样存起来了，但是我们在获取或者访问的时候，无法像C#一样使用泛型
                --来进行显示访问，这样就会造成，当我们按照名字来从字典中访问控件的时候会出现混乱
                --所以在存储控件名字的同时，还需要存储对应的控件类型
                -- if self.controls[controlName]~=nil then
                --     table.insert(self.controls[controlName],allControls[i])
                -- else
                --     --self.controls={[controlName]={allControls[i]}}
                --     self.controls[controlName]={allControls[i]}
                -- end

                --经过修改之后的
                --最终的存储形式就是下面这样的了:
                --self.controls={"btnRole"={"Button"=Button控件,"Image"=Image控件}}

                local typeControl=allControls[i]:GetType().Name
                if self.controls[controlName]~=nil then 
                    self.controls[controlName][typeControl]=allControls[i]

                else
                    self.controls[controlName]={[typeControl]=allControls[i]}
                end
            
            end

         end
         
    end
    
end


--根据名字和控件类型的名字来获取控件
function BasePanel:GetControl(name,typeControl)
    if self.controls[name]~=nil then 
        local sameNamControl=self.controls[name]
        if sameNamControl[typeControl]~=nil then 
            return sameNamControl[typeControl]
        end
    end
    return nil
    
end

function BasePanel:ShowMe()

    self:Init()
    self.panelObj:SetActive(true)


end


function BasePanel:HideMe()
     self.panelObj:SetActive(false)
end