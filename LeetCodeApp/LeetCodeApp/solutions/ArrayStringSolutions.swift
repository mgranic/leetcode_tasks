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
        // dictionary where each number with it's number of occurance will be placed as key-value pair
        // [key: number, vaule: number of occurances]
        var majorityNumber = [Int:Int]()
        // iterate all numbers
        for num in nums {
            // check if this number is already placed in dictionary
            if majorityNumber[num] != nil {
                // add one more occurance for this number
                majorityNumber[num] = majorityNumber[num]! + 1
            } else { // this is first occurance of this number so set 1
                majorityNumber[num] = 1
            }
        }
        // get number with most occuranceses and return it from the function
        let majorityNum = majorityNumber.max { $0.value < $1.value }
        return majorityNum!.key
    }
    
    //https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/submissions/1298890779/?envType=study-plan-v2&envId=top-interview-150
    func strStr(_ haystack: String, _ needle: String) -> Int {
        // transform strings to arrays
        let haystackArray = Array(haystack)
        let needleArray = Array(needle)

        // get number of elements for each arrray
        let needleCount = needleArray.count - 1
        let haystackCount = haystackArray.count - 1

        // true if substring occurance is found
        var isFound = true

        // if substring is bigger than the string, it cannot be found in the string
        if ((needleCount + 1) > (haystackCount + 1)) {
            return -1
        } else if (needle == haystack) {
            // if string is the same as substring it is found imideately (index 0)
            return 0
        }

        // iterate each element in haystack
        for i in 0...(haystackCount) {
            // by default set string found as true
            isFound = true
            
            // if first element of needle is not the same as the first element of haystack skip this element and set found to false
            if (needleArray[0] != haystackArray[i]) {
                isFound = false
                continue
            }
            
            // if you reach this point it means first element of substring (needle) is found in string (haystack)
            // now iterate all other characters of needle and compare them
            for j in 0...(needleCount) {
                
                // if this element of the needle is not the same as the corresponding haystack element or if the rest of the substring does
                // not fit in the rest of the string, stop iterating substring and set substring as "not fouund"
                if (((i+j) > (haystackCount)) || (needleArray[j] != haystackArray[i+j])) {
                    isFound = false
                    break
                }
            }
            // if you reach this point it means that all of the elements of substring were the same as the all of the corresponding elements of string
            // return first element of string that matches the substring
            if (isFound == true) {
                return i
            }
        }
        // if you reach this point substring is not found, so return -1
        return -1
    }
    
}
