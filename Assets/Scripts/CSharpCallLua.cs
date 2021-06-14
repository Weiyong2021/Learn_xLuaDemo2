using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using XLua;

public static class CSharpCallLua
{
    [CSharpCallLua]
    public static List<System.Type> list=new List<System.Type>(){
        typeof(UnityAction<bool>)

    };

}
