---------------------------------常用类的别名的命名---------------------------
--常用别名都在这里面定位
--准备我们自己之前导入的脚本
--面向对象相关
require("Object")
--字符串拆分
require("SplitTools")
--Json解析
Json = require("JsonUtility")

--Unity相关的
GameObject = CS.UnityEngine.GameObject
Resources = CS.UnityEngine.Resources
Transform = CS.UnityEngine.Transform
RectTransform = CS.UnityEngine.RectTransform
TextAsset = CS.UnityEngine.TextAsset
--图集对象类
SpriteAtlas = CS.UnityEngine.U2D.SpriteAtlas

Vector3 = CS.UnityEngine.Vector3
Vector2 = CS.UnityEngine.Vector2

--UI相关
UI = CS.UnityEngine.UI
Image = UI.Image
Text = UI.Text
Button = UI.Button
Toggle = UI.Toggle
ScrollRect = UI.ScrollRect

--自己写的C#脚本相关
--直接得到AB包资源管理器的 单例对象
ABMgr = CS.ABMgr.GetInstance()


Canvas=GameObject.Find("Canvas").transform


