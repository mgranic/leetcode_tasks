//
//  ArrayStringSolutions.swift
//  LeetCodeApp
//
//  Created by Mate Granic on 23.06.2024..
//

import Foundation

struct ArrayStringSolutions {
    
    // https://leetcode.com/problems/majority-element/description/?envType=study-plan-v2&envId=top-interview-150
    func majorityElement(_ nums: [Int]) -> Int {
        var majorityNumber = [Int:Int]()
        for num in nums {
            if majorityNumber[num] != nil {
                majorityNumber[num] = majorityNumber[num]! + 1
            } else {
                majorityNumber[num] = 1
            }
        }
        let majorityNum = majorityNumber.max { $0.value < $1.value }
        return majorityNum!.key
    }
    
}
