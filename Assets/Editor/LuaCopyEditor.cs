using System.IO;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class LuaCopyEditor
{
    [MenuItem("XLua/自动生成txt后缀的Lua")]
    public static void CopyLuaTxt()
    {
        //首先要找  我们的所有的lua文件
        string path=Application.dataPath+"/Lua/";
        //判断路径是否存在
        if(!Directory.Exists(path)) 
              return ;//如果不存在就直接返回
        //得到每一个lua文件的路径，才能进行迁移拷贝
        //GetFiles(path)是得到path路径下的所有的文件的路径    path是参数路径
        string[] strs=Directory.GetFiles(path,"*.lua");//"*.lua"是得到了后缀名为.lua的路径   
        for(int i=0;i<strs.Length;i++)
        {
           // Debug.Log(strs[i]);

        }

        //然后把lua文件拷贝到新的文件夹中
        //先定义一个新的路径

        string newPath=Application.dataPath+"/LuaTxt/";
        //判断新的文件夹路径是否存在
        if(!Directory.Exists(newPath))
        {//如果不存在，就根据路径创建文件夹
            Directory.CreateDirectory(newPath);

        }
        else
        {
            //删除之前该文件路径下的所有文件
            string[] oldFiles=Directory.GetFiles(newPath,"*.txt");
            
            for (int i=0;i<oldFiles.Length;++i)
            {
                File.Delete(oldFiles[i]);

            }

        }
        List<string> newFileNames=new List<string>();
        string fileName;
        Debug.Log("-------------------------------------------");
        for (int i=0;i<strs.Length;++i)
        {
            //得到一个新的文件路径  用于拷贝
            //strs[0]=E:/MyUnityProjects2/Learn_xLuaDemo2/Assets/Lua\BasePanel.lua
            fileName=newPath+strs[i].Substring(strs[i].LastIndexOf("/")+1)+".txt";
            newFileNames.Add(fileName);

            // Debug.Log(fileName);
            //strs[0]=E:/MyUnityProjects2/Learn_xLuaDemo2/Assets/LuaTxt\BasePanel.lua
            //把老的文件拷贝到新的文件夹下
            File.Copy(strs[i],fileName);
        }
        //刷新一下
        AssetDatabase.Refresh();

        //刷新过后，再来改制定包  
        for (int i=0;i<newFileNames.Count;++i)
        {
            //Unity API
            //传入的路径必须是相对于Asset文件的路径   Asset/..../....
            string path2=newFileNames[i].Substring(newFileNames[i].IndexOf("Asset"));
            Debug.Log(path2);
            AssetImporter importer=AssetImporter.GetAtPath(path2);
            if(importer!=null)
            {
                importer.assetBundleName="lua";//修改包名为lua
                
            }
        }


    }
    
}
