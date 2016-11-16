//
//  ViewController5.swift
//  SwiftBasicDemo
//
//  Created by 思 彭 on 16/11/16.
//  Copyright © 2016年 思 彭. All rights reserved.

// 错误处理

import UIKit

class ViewController5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "错误处理"
        
        // 1.函数内的 throws异常处理
        func send(job: Int, toPrinter printrName: String) throws ->String {
            if  printrName == "Never Has Toner" {
                throw PrintError.noToner
            }
            return  "Job sent"
        }
        
        // 2.do...catch处理异常   输出： Job sent
        do {
            
            let  printerresponse = try send(job: 1040, toPrinter: "Bi Sheng")
            print(printerresponse)
        }catch {
            print("error = \(error)")
        }
        
        // 3.
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
            print(printerResponse)
        } catch PrintError.onFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrintError {
            print("Printer error: \(printerError).")
        } catch {
            print(error)
        }
    }

    // 定义“打印错误”的枚举
    enum PrintError: Error {
        case outOfPaper
        case noToner
        case onFire
    }
}
