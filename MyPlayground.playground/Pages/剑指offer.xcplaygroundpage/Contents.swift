//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
 
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        
    }
}

class Solution {
    //MARK: - 剑指 Offer 05. 替换空格
    //请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
    func replaceSpace(_ s: String) -> String {

        var result = ""
        for item in s {
            if item == " " {
                result = result + "%20"
            }else{
                result = result + String(item)
            }
        }
        return result
        
    }
    //MARK: - 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。
    /// 剑指 Offer 06. 从尾到头打印链表
    func reversePrint(_ head: ListNode?) -> [Int] {

        guard let start = head else { return [] }
        var tempArray:[Int] = [start.val]
        var lestHead:ListNode? = start
        while lestHead?.next != nil {
            lestHead = lestHead?.next
            if let t = lestHead {
                tempArray.insert(t.val,at:0)
            }
            
        }
        
        return tempArray
        
    }
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {

        guard !preorder.isEmpty,!preorder.isEmpty else { return nil}
        
        let root = TreeNode(preorder[0])
        
        for item in preorder {
            
        }
        
        return root
    }
    /// 6. Z 字形变换
    func convert(_ s: String, _ numRows: Int) -> String {

        if numRows < 2 {
            return s
        }
        var result:[Int:[Character]] = [:]
        for item in 0..<numRows {
            let array:[Character] = []
            result[item] = array
        }
        var x = 0
        var y = -1
        for item in s {
            
            result[x]?.append(item)
            if x==0 || x == numRows-1 {
                y = -y
            }
            x = x+y
            print(result)
        }
        var strarray:[Character] = []
        for item in 0..<numRows {
            if let array = result[item] {
                strarray+=array
            }
        }
        
        return String(strarray)
    }
    
    /// 7. 整数反转
    func reverse(_ x: Int) -> Int {
        let i =  x < 0 ? -1:1
        let str = String(String(x*i).reversed())
        let reuslt = (Int(str) ?? 0) * i
        if (reuslt < Int32.min ) || (reuslt > Int32.max) {
            print(reuslt)
            return 0
        }

        return reuslt
    }
    /// 354. 俄罗斯套娃信封问题
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        
        if envelopes.isEmpty {
            return  envelopes.count
        }
        
        let newev = envelopes.sorted { (a, b) -> Bool in
            return (a[0]*a[1])<(b[0]*b[1])
        } 
        
        return 0
    }
    
    /// 11. 盛最多水的容器
    func maxArea(_ height: [Int]) -> Int {

        var left: Int = 0
        var right:Int = height.count - 1
        var result:Int = 0
        while left < right {
            let leftX = height[left]
            let rightX = height[right]
            result = max((min(leftX, rightX) * (right-left)),result)
            if leftX <= rightX {
                left+=1
            }else{
                right-=1
            }
        }
        
        return result
        
    }
    
    static let digits = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),(50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
    
    func intToRoman(_ num: Int) -> String {

        var result = ""
        var temp = num
        for item in Solution.digits {
            if num == 0 { break }
            while temp >= item.0 {
                temp = temp-item.0
                result+=item.1
            }
        }
        
        return result
        
    }
    static let digits2 = ["M":1000, "CM":900, "D":500, "CD":400,"C":100,"XC":90, "L":50, "XL":40,"X":10, "IX":9, "V":5, "IV":4, "I":1]
    /// 13. 罗马数字转整数
    func romanToInt(_ s: String) -> Int {
        var result = 0
        let newS:[String] = s.map { (c) -> String in
            return String(c)
        }
        var index = 0
        while index < newS.count {
            
            let nextStr =  index+1 < newS.count ? newS[index+1]:""
            let str = newS[index]
            if str == "C" {
                if nextStr == "M" {
                    result += Solution.digits2["CM"] ?? 0
                    index+=2
                }else if nextStr == "D" {
                    result += Solution.digits2["CD"] ?? 0
                    index += 2
                }else {
                    result += Solution.digits2["C"] ?? 0
                    index += 1
                }
                
            }else if str == "X" {
                if nextStr == "C" {
                    result += Solution.digits2["XC"] ?? 0
                    index += 2
                }else if nextStr == "L" {
                    result += Solution.digits2["XL"] ?? 0
                    index += 2
                }else {
                    result += Solution.digits2["X"] ?? 0
                    index += 1
                }
                
            }else if str == "I" {
                if nextStr == "X" {
                    result += Solution.digits2["IX"] ?? 0
                    index += 2
                }else if nextStr == "V" {
                    result += Solution.digits2["IV"] ?? 0
                    index += 2
                }else {
                    result += Solution.digits2["I"] ?? 0
                    index += 1
                }
                
            }else{
                result += Solution.digits2[str] ?? 0
                index += 1
            }
            
        }
        
        return result

    }
    
    func isMatch(_ s: String, _ p: String) -> Bool {

        return false
    }
    
    /// 14. 最长公共前缀
    /// - Parameter strs: 编写一个函数来查找字符串数组中的最长公共前缀。
    /// - Returns: 如果不存在公共前缀，返回空字符串 ""
    func longestCommonPrefix(_ strs: [String]) -> String {

        var result = ""
        let new = strs.sorted { (str1, str2) -> Bool in
            return str1.count < str2.count
        }.map { (str) -> [String] in
            return str.map { (c) -> String in
                return String(c)
            }
        }
//        print(new)
        guard let firststr = new.first else { return result }
        var cindex = 0
        while cindex < firststr.count {
            let str = firststr[cindex]
            var needAdd = false
            for item in new {
                if str == item[cindex] {
                    
                    needAdd = true
                }else{
                    needAdd = false
                    break
                }
            }
            if needAdd {
                result += str
            }else{
                break
            }
            cindex += 1
        }
        
//        print(result)
        
        return result
    }
    /// 快慢指针删除倒数第n个节点
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

        let msn = ListNode(0)
        msn.next = head
        
        var fast:ListNode? = msn
        var slo:ListNode? = msn
        
        for _ in 0...n {
            fast = fast?.next
        }
        while fast != nil {
            fast = fast?.next
            slo = slo?.next
        }
        let del = slo?.next
        slo?.next = del?.next
        del?.next = nil
        
        return msn.next
    }
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var list1 = l1
        var list2 = l2
        
        let dum:ListNode? = ListNode(0)
        var cur:ListNode? = dum
        
        while list2 != nil && list1 != nil {
            if (list1?.val ?? 0) >= (list2?.val ?? 0) {
                cur?.next = list2
                list2 = list2?.next
            }else{
                cur?.next = list1
                list1 = list1?.next
            }
            cur = cur?.next
        }
        cur?.next = list1 != nil ? list1:list2
        return dum?.next

    }
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {

        let den = ListNode(0)
//        den.next = head
        var index = head
        var temp:[[ListNode]] = []
        while index?.next != nil {
            if temp.count <= k ,let current = index{
                current.next = nil
//                temp.append(current)
            }
            
        }
        
        return den.next
        
    }
    
    /// 剑指 Offer 24. 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev:ListNode? = nil
        var curr:ListNode? = head
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        return prev

    }
    /// 给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if k==0 || head == nil || head?.next == nil {
            return head
        }
        
        var n = 1
        var iter:ListNode? = head
        /// 迭代器找到尾节点记录深度
        while iter?.next != nil {
            iter = iter?.next
            n+=1
        }
        /// 需要移动的位数
        var add = n - (k%n)
        if add == n {
            return head
        }
        /// 连城一个环
        iter?.next = head
        add -= 1
        /// 查到需要打断的点
        while add > 0 {
            add -= 1
            iter = iter?.next
        }
        let ret = iter?.next /// 需要返回的节点
        iter?.next = nil ///打断节点
        return ret
        

    }
    /// 剑指 Offer 03. 数组中重复的数字
    func findRepeatNumber(_ nums: [Int]) -> Int {

        var keys:[Int:Int] = [:]
        
        for item in nums {
            if let old = keys[item] {
                if old == item {
                    return old
                }
            }else{
                keys[item] = item
            }
        }
        
        return 0
    }
    /// 剑指 Offer 04. 二维数组中的查找
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        guard !matrix.isEmpty else { return false }
        var coun = 0
        guard let min = matrix.first?.first else { return false }
        guard let max = matrix.last?.last else { return false }
        guard target != min || target != max  else {
            return true
        }
//        guard target > min ,target < max else {
//            return false
//        }
        
        while coun <= matrix.count - 1 {
            
            for item in matrix[coun] {
                if matrix[coun].last ?? 0 < target {
                    break
                }else if item == target {
                    return true
                }
            }
            coun += 1
        }
        
        return false
        
    }

    
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        
        if head == nil,head?.next == nil {
            return head
        }
        
        let dummyHead:ListNode? = ListNode(0)
        dummyHead?.next = head
        var lastSorted = head
        var curr = head?.next
        
        while curr != nil {
            if (lastSorted?.val ?? 0) <= (curr?.val ?? 0) {
                lastSorted = lastSorted?.next
            }else{
                var prev = dummyHead
                while (prev?.next?.val ?? 0) <= (curr?.val ?? 0) {
                    prev = prev?.next
                }
                lastSorted?.next = curr?.next
                curr?.next = prev?.next
                prev?.next = curr
                
            }
            curr = lastSorted?.next
        }
        
        return dummyHead?.next
        
    }
    
    /// 剑指 Offer 67. 把字符串转换成整数
    /// - Parameter str: 输入
    /// - Returns: 输出整数
    func strToInt(_ str: String) -> Int {
        
        if str.isEmpty {
            return 0
        }
        var result = 0
        for item in str {
            
        }
        
        return result>0 ? min(result, Int.max):max(result,Int.min)
    }
}

//var temp = "We are happy."
//Solution().replaceSpace(temp)
//let ls = ListNode(1)
//let ls2 = ListNode(3)
//let ls3 = ListNode(2)
//ls.next = ls2
//ls2.next = ls3
//
//Solution().reversePrint(ls)

//let s = "PAYPALISHIRING"
//let numRows = 4
//Solution().convert(s, numRows)
//Solution().reverse(-2147483412)
//Solution().maxArea([1,8,6,2,5,4,8,3,7])
//Solution().romanToInt("MCMXCIV")
//Solution().longestCommonPrefix(["abab","aba","abc"])
//Solution().findRepeatNumber([1,8,6,2,5,4,8,3,7])

let s = [[-5,3]]
let target = -5
Solution().findNumberIn2DArray(s, target)
