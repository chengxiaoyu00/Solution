//: [Previous](@previous)

import Foundation
import UIKit
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count <= 0 { return -1}
        
        if nums.first! == target { return 0 }
        
        if nums.last! == target { return nums.count - 1 }
        
        var low = 0
        var high = nums.count - 1
        var mid = (low + high) >> 1
        while low <= high {
            let vallow = nums[low]
            let valhigh = nums[high]
            let valmid = nums[mid]
            
            if vallow == target {
                return low
            }
            if valhigh == target {
                return high
            }
            if valmid == target {
                return mid;
            }
            
            if target > valhigh {
                if target > vallow {
                    if target > valmid {
                        low += 1
                        high -= 1
                    } else {
                        high = mid - 1
                        low += 1
                    }
                }
            } else {
                if target > vallow {
                    if target > valmid {
                        low = mid + 1;
                    } else {
                        high = mid - 1
                    }
                } else {
                    low += 1
                    high -= 1
                }
            }
            mid = (low + high) >> 1
            if target > valhigh && target < vallow {
                return -1
            }
        }
        return -1
    }
}

print(Solution().search([4,5,6,7,0,1,2], 7))
