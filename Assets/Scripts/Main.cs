using System.Net.Mime;
using System.Threading;
using System.Diagnostics;
using System;
using System.Globalization;
using System.Runtime.CompilerServices;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class Main : MonoBehaviour
{
    public Button btnRole;
    //所有的UI控件都是间接的继承了UIBehaviour
    //我们可以使用GetComponentsInChildren()函数来找到父物体下的
    //所有UI控件，然后利用父类装子类的办法
    //来记录所有我们找到的控件


    void Start()
    {
        LuaMgr.GetInstance().Init();
        LuaMgr.GetInstance().DoLuaFile("Main");
       
    }
}
