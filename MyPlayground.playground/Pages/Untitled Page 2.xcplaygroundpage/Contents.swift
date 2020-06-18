//: [Previous](@previous)

import Foundation
import UIKit
//var str = "Hello, playground"
//typealias blocks = (_ str:String) -> ()
////: [Next](@next
//str.first { (char) -> Bool in
//   return char == "p"
//}
//var callBalck :blocks?
//let back = callBalck
//if let _ = callBalck {
//    callBalck!("a")
//}
//
//
//var array1 : [String] = ["1"]
//array1.append("s")
//func example() {
//    defer {
//        print("leaving scope,tinme to cleanup?")
//    }
//    print("performing some operation")
//}
//example()
//let ints = [0, 1, 2, 3, 4, 11, 6, 7, 8, 9]
//let strings = ints.map { return String($0) }
//print("strings: \(strings)")
//
//print(((str1:String)->Bool).self)
//let randomCPX:Float = Float(arc4random_uniform(400)) //x 范围在14-最大宽-14中取得
//let randomCPY:Float = Float(arc4random_uniform(300)) //y 范围随机取值
//let ix = Float(60)-randomCPX
//let iy = Float(60)-randomCPY
//print(ix,iy)
//let str2 = "ابدأ السحب_nor" + "_done"
//print(str2)

//let lin = Double(7)/3.0
//if lin <= 1 {
//    print(lin ,":<= 1")
//}else if lin <= 2{
//   print(lin,":<= 2")
//}else{
//  print(lin,":> 2")
//}
//print(lin)

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class test {
    static public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var newNums:[Int] = []
        var dict : [Int:Int] = [:]
        for (index,item) in nums.enumerated() {
            dict[item] = index
            print(dict)
        }
        for (index1,item1) in nums.enumerated() {
            if let index2 = dict[(target - item1)] ,index1 != index2{
                newNums.append(index1)
                newNums.append(index2)
                return newNums
            }
        }
        return newNums
    }
    
    //Definition for singly-linked list.
  
    static public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var sum1 = ""
//        var sum2 = ""
//        var sum3 = ""
        var ln1 = l1
        var ln2 = l2
        let dummyHead = ListNode(0)
        var curr = dummyHead
        var carry = 0
        while (ln1 != nil || ln2 != nil) {
            let x = ln1 != nil ? ln1?.val : 0
            let y = ln2 != nil ? ln2?.val : 0
            
            let sum = carry + x! + y!
            carry = sum/10
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            if ln1 != nil { ln1 = ln1?.next }
            if ln2 != nil { ln2 = ln2?.next }
            
        }
        if carry > 0 {
            curr.next = ListNode(carry)
        }
//        while let lnt1 = ln1{
//            sum1 = sum1 + String(lnt1.val)
//            ln1 = lnt1.next
//        }
//        while let lnt2 = ln2 {
//            sum2 = sum2 + String(lnt2.val)
//            ln2 = lnt2.next
//        }
//        if let sumint1 = Int(sum1),let sumint2 = Int(sum2) {
//            sum3 = String(sumint1+sumint2)
//        }
//        for item in sum3 {
//            let ln3next = ListNode( Int("\(item)")!)
//            print(ln3next.val)
//            if ln3.val != -1 {
//                ln3next.next = ln3
//            }
//            ln3 = ln3next
//        }
        return dummyHead.next
    }
    
    
    
}
class Solution {
    static public func lengthOfLongestSubstring(_ s: String) -> Int {
//        var ans = 0
//        var map :[Character:Int] = [:]
//        var i = 0
//        for (j,item) in s.enumerated() {
//            if (map[item] != nil) {
//                i = max(map[item] ?? 0, i)
//            }
//            ans = max(ans, j - i + 1)
//            map[item] = j+1
//        }
//        return ans
        let string = s.utf8CString

        var result = 0

        var map = [CChar: Int](minimumCapacity: Int(Int8.max))
        var start = 0

        for index in 0...string.count - 1{
            let c = string[index]
            if c != 0 {
                if let last = map[c],last >= start{
                    start = last + 1
                }else if result < index - start + 1{
                    result = index - start + 1
                }
                map[c] = index
            }
        }

        return result
       
    }
    
    /// /** 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。你可以假设 nums1 和 nums2 不会同时为空。*/
    ///
    /// - Parameters:
    ///   - firstArray:
    ///   - secondArray:
    /// - Returns:
    static public func findMedianSortedArrays(_ firstArray: [Int], _ secondArray: [Int]) -> Double {
        
        var resultArray: Array<Int> = []
        var firstIndex = 0
        var secondIndex = 0
        
        while firstIndex < firstArray.count && secondIndex < secondArray.count {
            if firstArray[firstIndex] < secondArray[secondIndex] {
                resultArray.append(firstArray[firstIndex])
                firstIndex += 1
            } else {
                resultArray.append(secondArray[secondIndex])
                secondIndex += 1
            }
        }
        
        while firstIndex < firstArray.count {
            resultArray.append(firstArray[firstIndex])
            firstIndex += 1
        }
        
        while secondIndex < secondArray.count {
            resultArray.append(secondArray[secondIndex])
            secondIndex += 1
        }
        let cCount = resultArray.count
        guard cCount != 0 else { return 0 }
        let yushu = cCount%2
        if yushu == 0 {
            let rf = cCount/2
            let lt = rf-1
            return Double(resultArray[rf]+resultArray[lt])/2.0
        }else{
            print(resultArray)
            return Double(resultArray[((cCount+1)/2-1)])
        }
    }
    /// 假设按照升序排序的数组在预先未知的某个点上进行了旋转。( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。 你可以假设数组中不存在重复的元素。 你的算法时间复杂度必须是 O(log n) 级别。
    static public func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        /// 暴力方法m 数组内数量越大时间复杂度越高最大O（log（n））
//        for (index,item) in nums.enumerated() {
//            if item == target {
//                return index
//            }
//        }
        var left:Int = 0,right:Int = nums.count-1
        while left <= right {
            let mid = (left+right)/2
            if nums[mid] == target {
                return mid
            }
            /// 左端是排号顺序的
            if nums[mid] >= nums[left] {
                if nums[mid] > target && nums[left] <= target {
                    right = mid-1
                }else{
                    left = mid+1
                }
            }else{
                if nums[mid] < target && nums[right] >= target {
                    left = mid+1
                }else{
                    right = mid-1
                }
            }
            
        }
        
        return -1
//        if let rs = Solution().binarySearch(arr: nums, start: 0, end: nums.count-1, khey: target) {
//            return rs
//        }else{
//            return -1
//        }
        
    }
    private func binarySearch(arr: [Int], start: Int, end: Int, khey: Int) -> Int? {
        guard start < end else {
            return -1
        }
        let mid = start + (end - start) / 2
       
        let last = arr[end]
        if arr[mid] == khey {
            return mid
        }
        if arr[end] == khey {
            return end
        }
        if arr[start] == khey {
            return start
        }
        /// 右半部分为有序数组
        if arr[mid] < last {
            if arr[mid] < khey && khey < arr[end] {
                return binarySearch(arr:arr, start: mid+1, end: end-1, khey:khey)
            }else{
                return binarySearch(arr:arr, start: start, end: mid-1, khey:khey)
            }
        }else {
            if arr[start] < khey && khey < arr[mid] {
                return binarySearch(arr:arr, start: start, end: mid-1, khey:khey)
            }else{
                return binarySearch(arr:arr, start: mid+1, end: end, khey:khey)
            }
        }
        /// 二分法查找
//        if arr[mid] > khey {
//            return binarySearch(arr: arr, start: start, end: mid - 1, khey: khey)
//        } else if arr[mid] < khey {
//            return binarySearch(arr: arr, start: mid + 1, end: end, khey: khey)
//        } else {
//            return mid
//        }
    }
}
//print(test.twoSum([3,7,6,3,15], 6))
/* 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。您可以假设除了数字 0 之外，这两个数都不会以 0 开头。*/
//var l1 = ListNode(3)
//l1.next = ListNode(4)
//l1.next?.next = ListNode(2)
//var l2 = ListNode(4)
//l2.next = ListNode(6)
//l2.next?.next = ListNode(5)

/*给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。*/
//print(Solution.lengthOfLongestSubstring("bbbbb"))


//print(Solution.findMedianSortedArrays([1,3], [2,4]))

print(Solution.search([4,5,6,7,0,1,2], 2))


let knowDict = ["a":"a","zoo":"zoo","zoo":"zoo","zoo":"zoo"]


func checkString(_ input:String) -> Bool {
    /// 输入字符串转拆成单字母数组
    let stringArray = input.map {String($0)}
    /// 转成字符串
    let ksr = knowDict.keys.joined()
    
    /// 先排除不包含字符的输入
    for (index,item) in stringArray.enumerated() {
        if ksr.contains(item) {/// 查找匹配到的字符串会出现的位置
            let bindex = index-1
            var bfstr = "" /// 前一个字符
            var afstr = "" ///
            if stringArray.count > bindex,bindex > 0 {
                bfstr = stringArray[index-1]
                for kls in knowDict.keys {
                    
                }
            }
            
            
            index
            return false
        }else{
            
            return false
            
        }
        
    }
    
    
    
    
    return false
    
}
