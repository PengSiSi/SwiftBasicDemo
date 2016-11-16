//
//  ViewController3.swift
//  SwiftBasicDemo
//
//  Created by 思 彭 on 16/11/16.
//  Copyright © 2016年 思 彭. All rights reserved.

// 枚举和结构体

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "枚举和结构体"
        // 1. 枚举的使用
        let ace = Rank.ace
        print(ace)  // ace
        let acrRawValue = ace.rawValue
        print(acrRawValue)   // 1
        
        if let convertedRank = Rank(rawValue: 3) {
            
            let threeDescription = convertedRank.simpleDescription()
            print(threeDescription)   // 3
        }
        
        // 2. 
        let hearts = Suit.hearts
        let heartedDescription = hearts.simpleDescription()
        print("heartedDescription = \(heartedDescription)")
        
        // 3.
        let success = ServerResponse.result("6:00 am", "8:09 pm")
        let failure = ServerResponse.failure("Out of cheese.")
        
        switch success {
        case let .result(sunrise, sunset):
            print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
        case let .failure(message):
            print("Failure...  \(message)")
            
        }
        // 4.结构体
        let structVar = Card(rank: .ace, suit: .hearts)
        print(structVar.simpleDescription())

    }
    
    // 定义枚举
    enum Rank: Int {
        case ace = 1
        case two, three, four,five, six, seven, eight, nine, ten
        case jack, queen, king
        func simpleDescription() -> String {
            
            switch self {
                
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }
    // 定义枚举
    enum Suit {
        case spades, hearts, diamonds, clubs
        func simpleDescription() -> String {
            switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
            }
        }
    }
    
    // 定义枚举元组
    enum ServerResponse {
        case result(String, String)
        case failure(String)
    }
    
    // 定义结构体
    struct Card {
        var rank: Rank
        var suit: Suit
        func simpleDescription() -> String {
            
            return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
        }
    }
}
