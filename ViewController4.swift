//
//  ViewController4.swift
//  SwiftBasicDemo
//
//  Created by 思 彭 on 16/11/16.
//  Copyright © 2016年 思 彭. All rights reserved.

// 协议和扩展

import UIKit

// 定义协议
protocol ExampleProtocol {
   
    var simpleDescription: String {
        get
    }
    // 使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，在设计接口的时候，也要考虑到使用者程序的扩展性。所以要多考虑使用mutating来修饰方法。
    mutating func adjust()
}

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "协议和扩展"
        
        // 1.Classes, enumerations, and structs都能接受协议
        var a = SimpleClass()
        a.adjust()
        let aDescription = a.simpleDescription
        print("aDescription = \(aDescription)")
        var b = SimpleStructure()
        b.adjust()
        let bDescription = b.simpleDescription
        print("bDescription = \(bDescription)")
        
        // 输出结果： 
        /* aDescription = A very simple class.  Now 100% adjusted.
           bDescriptionA = simple structure (adjusted)
        */
        
        // 2. extension扩展的使用
        print(7.simpleDescription)}   // The number 7

    }
    
    // 创建类,遵守协议
    class SimpleClass: ExampleProtocol {
        var simpleDescription: String = "A very simple class."
        var anotherProperty: Int = 69105
        func adjust() {
            simpleDescription += "  Now 100% adjusted."
        }
    }
    
    struct SimpleStructure: ExampleProtocol {
        var simpleDescription: String = "A simple structure"
        mutating func adjust() {
            simpleDescription += " (adjusted)"
        }
    }
    
    // Int的扩展
    extension Int: ExampleProtocol {
        var simpleDescription: String {
            return "The number \(self)"
        }
        mutating func adjust() {
            self += 42
        }
}

