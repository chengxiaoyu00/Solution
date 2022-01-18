//: [Previous](@previous)

import Foundation

class Solution {

    //MARK: - 15.三数之和
    /// 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
    /// - Parameter nums: 数组
    /// - Returns: 子数组
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//
//        var newNums = nums.sort()
//
//
//
//    }
    func formatUtcAppend2Time(_ date:Date) -> String{
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        format.locale = Locale.init(identifier: "us")
        format.timeZone = TimeZone(abbreviation: "UTC+0200")
        return format.string(from: date)
    }
}
let data = Date().timeIntervalSince1970
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
    let newData = Date().timeIntervalSince1970
    let time = (newData - data)
    let connectTime:Double = Double(String(format:"%.2f" , time) ) ?? 0.0
    print(connectTime)

}
//print(Solution().formatUtcAppend2Time(data))
