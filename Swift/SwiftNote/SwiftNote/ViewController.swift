//
//  ViewController.swift
//  SwiftNote
//
//  Created by Tang on 15/3/28.
//  Copyright (c) 2015年 Tang. All rights reserved.
//

import UIKit

/*
  提示：
   在外面定义为函数。里面定义为方法。
*/
//自定义（函数）
func youFunction(a:Int,b:Int){
    
    // swift 默认是let 常亮，所以 a 和 b 都是常量  a = 100赋值会报错
    
  // youFunction(var a:Int, var b:Int) 此时为变量 a = 100赋值不会报错
    
    println("a+b = \(a+b)")
}

class ViewController: UIViewController {

    //定义变量时 如何告诉编译器其类型
    /*
     1.var noteTextView : UITextView! :号后面给类型
     2. var a = 19 直接赋值 系统通过赋的值可判断 a 为整型
    */
    @IBOutlet weak var noteTextView : UITextView!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var noteTextField: UITextField!
    //-------(定义一个数组里面存放的是字典)-------
    var array:[Dictionary<String,String>] = []
    //-------(定义一个数组里面存放的是字符串)-------
    //    var array1 :[String] = []
    
    
    //--------自定义（方法）--------
    /*
    方法的构成
            1 方法名
            2 返回值类型
            3 参数列表
            4 方法的实现
    */
    func myCustomFuction(a:Int,b:Int){
        println("hello word !\(a)")
    }
    
    func myCustomFuction2(label a:Int , label b:Int) -> Int{
        
        return a+b
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //必须加上 b: (第一个参数不用写)
//        myCustomFuction(100,b:200)
        self.myCustomFuction(100,b:200)
        
        //方法调用有返回值的方法
        var result = myCustomFuction2(label: 2, label: 2)
        println("a+b的结果是 ：\(result)")
        
        //函数调用的时候，不需要写标号
        youFunction(10, 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//保存日记按钮
    @IBAction func didSaveClicked(sender: AnyObject)
    {
        //得到文本内容
        var content = noteTextView.text
        var name = noteTextField.text
        
        //  -------(创建一个字典)-------
        var dict = Dictionary<String,String>()
//        var  dict = ["key1":"value1","key2":"value2"]
        //  -------(创建一个字典)------- 此处有问题
//        var dict2 = Dictionary<String,Int> = ["str":29]
        
        //key-value
        dict["name"] = name
        dict["content"] = content
        println(dict)
        
        //将字典添加到数组中
        array.append(dict)
        
    }
//查看日记
    @IBAction func didPrintClicked(sender: AnyObject)
    {
        //取消键盘
        self.view.endEditing(true)
        //-------(定义一个字符串)-------
        var lists = ""
        //遍历数组
        for var i=0 ;i<array.count;i++
        {
//            println(array[i])
            lists = lists + array[i]["name"]!+" : "+array[i]["content"]!+"\n"
        }
        noteLabel.text = lists
    }
    //打开日记按钮
    @IBAction func didOpenClicked(sender: AnyObject)
    {
        var name = self.noteTextField.text
        //遍历笔记数组
        for dict in array
        {
            //获得笔记名称
            var filename = dict["name"]
            //比较名称 是否为需要打开的笔记
            if name == filename
            {
                //打开笔记
                noteTextView.text = dict["content"]
                break //结束循环
            }
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        noteTextView.resignFirstResponder()
        //或者
//        self.view.endEditing(true)
    }
}

