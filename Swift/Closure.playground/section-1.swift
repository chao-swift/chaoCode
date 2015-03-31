// Playground - noun: a place where people can play

import UIKit
/**
闭包 是一个独立的函数功能的代码段，我们可以在代码之间当作变量那样使用和传递他
*/

//1
//创建一个可以接受一个整型参数，并且返回值类型为整型的闭包
var closure1 =
{
    (a:Int) -> Int in
    return 10
}
var result = closure1(30)
println("\(result)")


//2
func  function1 (a: Int) -> Int {
    return 10 ;
}
var result2 = function1(30)
println("\(result2)")

//3
func function2(cls: (Int) -> Int)
{
    var result0 = cls(20)
    println("\(result0)")
}
// 将闭包作为函数参数
function2(closure1)

function2({
    (a:Int) -> Int in
    println("这是一个闭包")
    return 0
})
