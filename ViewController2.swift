//
//  ViewController2.swift
//  SwiftBasicDemo
//
//  Created by 思 彭 on 16/11/15.
//  Copyright © 2016年 思 彭. All rights reserved.

// 对象和类

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "对象和类"
        
        // 1.对象和类
        var shape = Shape()
        shape.numberOfSides = 7
        var shapeDescription = shape.simpleDescription()
        print(shapeDescription)
        
        // 2.初始化创建类，init创建
        var nameShape = NameShape(name: "Sisi")
        print(nameShape.name)
        
        // 3.子类，继承关系
        let test = Square(sidelength: 5.0, name: "HaHa")
        print("area = \(test.area())")
        print(test.simpleDescription())
        
        // 4. set方法
        var traig = TriangleAndSquare(size: 55, name: "xixix")
        print(traig.size)
        print(traig.triangle)
    }
}

// 定义类
class Shape {
    
    var numberOfSides = 0
    func simpleDescription() -> String {
        
        return "A shape with \(numberOfSides) sides."
    }
}

// 带初始化方法的类
class NameShape {
    
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        
        return "A shape with \(numberOfSides) sides."
    }
}

// 继承父类的子类
class Square: NameShape {
    
    var sideLength: Double
    
    init(sidelength: Double, name: String) {
        self.sideLength = sidelength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        
        return sideLength * sideLength
    }
    // 重写父类方法
    override func simpleDescription() -> String {
        
        return "A square with sides of length \(sideLength)."
    }
}

// set方法
class TriangleAndSquare {
    
    var size: Double = 0.0
    var triangle: Square {
        
        willSet {
           
            print(triangle.simpleDescription())
        }
    }
    init(size: Double, name: String) {
        triangle = Square(sidelength: size, name: name)
        self.size = size
    }
}
