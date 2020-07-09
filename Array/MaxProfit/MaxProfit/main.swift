//
//  main.swift
//  MaxProfit
//
//  Created by 郑志强 on 2020/7/9.
//  Copyright © 2020 郑志强. All rights reserved.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    
    var maxProfix = 0
    
    for i in 0 ..< prices.count {
        
        if i < prices.count - 1 && prices[i] > prices[i + 1] { continue }

        for j in i ..< prices.count {
            
            if j < prices.count - 1 && prices[j] < prices[j + 1] { continue }
            
            maxProfix = max(maxProfix, prices[j] - prices[i])
        }
    }
    return maxProfix
}


let prices = [7,6,4,3,1]

print(maxProfit(prices))


func maxProfit1(_ prices: [Int]) -> Int {

    guard !prices.isEmpty else {
        return 0
    }
    
    var minPrice = prices.first!
    var maxProfit = prices.first!
    
    for price in prices {
        maxProfit = max(maxProfit, price - minPrice)
        minPrice = min(price, minPrice)
    }
    return maxProfit
}


func maxProfit2(_ prices: [Int]) -> Int {

    guard !prices.isEmpty else {
        return 0
    }
    
    var minPrice = prices.first!
    
    for i in 1 ..< prices.count {
        minPrice = min(minPrice, prices[i])
        
    }
    return 0
}
