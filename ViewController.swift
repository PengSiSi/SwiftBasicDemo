//
//  ViewController.swift
//  SwiftBasicDemo
//
//  Created by 思 彭 on 16/11/15.
//  Copyright © 2016年 思 彭. All rights reserved.

// 基础语法掌握

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "基本语法《一》"
        self.view.backgroundColor = UIColor.groupTableViewBackground
        // 1.常量，变量, 类型转换
        let label = "The Width is"
        let width = 94
        let widthLabel = label + String(width)
        
        //2.拼接字符串
        let apples = 3
        let oranges = 5
        let appleSummany = "I have \(apples) apples"
        let fruitSummany = "I have \(apples + oranges) fruits"
        
        // 3.数组,字典的使用
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        var occupations = [
            "Malcolm": "Captain",
            "Kaylee": "Mechanic",
        ]
        // 当没有key，则默认师插入，否则是修改
        occupations["janyne"] = "Public Relations"
        
        // 4.创建空字典，空数组
        let emptyArray = [String]()
        let emptyDic = [String: Float]()
        
        // 当类型可以被推断，使用以下方法是错误的
        /*
        let emptyArray1 = []
        let emptyDic1 = [:]
        */
        
        shoppingList = []
        occupations = [:]
        
        // 5.if条件判断
        let individualScores = [75, 78,43, 89, 12]
        var teamScore = 0
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            }
            else {
                teamScore += 1
            }
        }
        print("teamScore = \(teamScore)")
        
        // 6.可选类型？
        var optionString: String? = "Hello"
        print(optionString == nil)  // false
        
        var optionName: String? = "John Appleseed"
        var greeting = "Hello!"
        // 守护
        if let name = optionName {
            greeting = "Hello,\(name)"
        }
        print("greeting = \(greeting)")
        
        // 7.可选值为nil  ??类似三目 当可选类型不存在为nil，则使用？？后面的默认值
        let nickName: String? = nil
        let fullName: String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        print(informalGreeting)
        
        // 8.Switch的使用
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":  //多个值
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"): //  条件判断
            print("Is it a spicy \(x)?")
            // 注意：default必须有，否则报错
        default:
            print("Everything tastes good in soup.")
        }
        
        // 9. 元组的使用  找出最大值 
        // 注意： 最后一个，可要可不要，都不会报错
        let interestingNumbers = [
            "Prime" : [2, 3, 5, 7, 11, 13],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25]
        ]
        var largest = 0
        for (kind, numbers) in interestingNumbers {
            print(kind)
            for number in numbers {
                if number > largest {
                    largest = number
                }
            }
        }
        print(largest)
        
        // 10. while循环   2 可能一次也不执行
        var n = 2
        while n < 2 {
            n = n * 2
        }
        print(n)
        
        //  repeat while循环   4 注意：至少会执行一次
        var m = 2
        repeat {
            m = m * 2
        }while m < 2
        print(m)
        
        // 11. ..<的使用  6
        var total = 0
        for i in 0..<4 {  // 注意不要使用空格，否则报错
            total += i
        }
        print("total = \(total)")
        
        // 12: 函数和元组
        // 返回值为string
        func greet(person: String, day: String) -> String {
            
            return "Hello \(person),today = \(day)."
        }
        //函数调用
        let str = greet(person: "SiSi", day: "Tuesday")
        print("str = \(str)")
        
        // 13. _参数名可以省略
        func greet1 (_ person: String, on day:  String) -> String {
            
            return "Hello \(person), today is \(day)"
        }
        print(greet1("haha", on: "hahahah"))
        
        // 14. 元组 －－－ 函数返回多个值
        func calculatevalue(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
            
            var min = scores[0]
            var max = scores[0]
            var sum = 0
            for score in scores {
                if score > max {
                    max = score
                }
                else if score < min {
                    min = score
                }
                sum += score
            }
            return (min, max, sum)
        }
        
        // 函数调用
        let result = calculatevalue(scores: [34, 56, 23, 13, 78])
        print(result.min)
        print(result.max)
        print(result.2)  // 下标调用： 注意： 下标从0开始
        
        // 15.参数不特定指定数组 每一个值为Int
        func sumOf(numbers: Int...) ->Int {
            
            var sum = 0
            for number in numbers {
                sum += number
            }
            return sum
        }
        print(sumOf(numbers: 32,45,67,88))
        
        // 16.函数的嵌套  15
        func returnFifteen() ->Int {
            
            var y = 10
            func add() {
                y += 5
            }
            add()
            return y
        }
        print(returnFifteen())
        
        // 17. 函数的返回值是一个函数类型  8
        func makeIncrement() -> ((Int) -> Int) {
            func addOne(number: Int) -> Int {
                return 1 + number
            }
            return addOne
        }
        var increment = makeIncrement()
        print(increment(7))
        
        // 18. 函数的参数是函数类型   true
        func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
           
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        func lessThanTen(number: Int) -> Bool {
            
            return number < 10
        }
        var numbers = [20, 19, 7, 12]
        print(hasAnyMatches(list: numbers, condition: lessThanTen))
        
        // 19. map
        numbers.map({
            
            (number: Int) -> Int in
            let result = 3 * number
            return result
            })
        let mappedNumbers = numbers.map { (number) in
             3 * number
        }
        print(mappedNumbers)
    }
}

