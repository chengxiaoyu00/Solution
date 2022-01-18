//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
class Solution {
    /** 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
     注意：答案中不可以包含重复的三元组。
     */
    /// 15. 三数之和
    public func threeSum(_ nums: [Int]) -> [[Int]] {
        var temp:[[Int]] = []
        if nums.isEmpty || nums.count < 3 {
            return temp
        }
        nums.sorted()
        if nums.first! > 0 {
            return temp
        }
        for k in 0...nums.count {
            if nums[k] > 0 {break}
            if(k > 0 && nums[k] == nums[k - 1]) {
                continue
            }
            var A = k + 1
            var B = nums.count-1
            debugPrint("for 循环 A==\(A),B===\(B)")
            while A < B {
                let sum = nums[k]+nums[A]+nums[B]
                debugPrint(sum,"A==\(A),B===\(B)")
                if sum == 0 {
                    temp.append([nums[k],nums[A],nums[B]])
                    while (A<B && nums[A] == nums[A+1]) {
                        A=A+1
                    }
                    while (A<B && nums[B] == nums[B-1]) {
                        B=B-1
                    }
                    A=A+1
                    B=B-1
                    
                }else if sum > 0 {
                    B=B-1
                }else{
                    A=A+1
                }
            }
        }
        
        return temp
    }
}
Solution().threeSum([-1,0,1,2,-1,-4])
