//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
/**
 我们从二叉树的根节点 root 开始进行深度优先搜索。

 在遍历中的每个节点处，我们输出 D 条短划线（其中 D 是该节点的深度），然后输出该节点的值。（如果节点的深度为 D，则其直接子节点的深度为 D + 1。根节点的深度为 0）。

 如果节点只有一个子节点，那么保证该子节点为左子节点。

 给出遍历输出 S，还原树并返回其根节点 root。

  

 示例 1：
 输入："1-2--3--4-5--6--7"
 输出：[1,2,5,3,4,6,7]
 
 示例 2：
 输入："1-2--3---4-5--6---7"
 输出：[1,2,5,3,null,6,null,4,null,7]
 
 示例 3：
 输入："1-401--349---90--88"
 输出：[1,401,null,349,88,90]
  

 提示：

 原始树中的节点数介于 1 和 1000 之间。
 每个节点的值介于 1 和 10 ^ 9 之间。

 */

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

    /// 26 删除排序数组中的重复项
    func removeDuplicates(_ nums: inout [Int]) -> Int {

        if nums.isEmpty {
            return 0
        }
        let count = nums.count
        if count == 1 {
            return nums.count
        }
        
        var youbiao = 0
        for _ in 0..<count {
            if youbiao < nums.count - 1 {
                if nums[youbiao] == nums[youbiao+1] {
                    nums.remove(at: youbiao)
                }else{
                    youbiao += 1
                }
            }else{
                break
            }
        }
        print(nums)

        return nums.count
    }
    //MARK: - 31.下一个排列
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count<=1 {
            return
        }
        var max = nums[0]
        var min = nums[0]
        for i in 0..<nums.count  {
            let new = nums[i]
            if new > max {
                max = new
            }
            if min > new {
                min = new
            }
        }
        
    }
    
    //MARK: - 32.最长有效括号
    func longestValidParentheses(_ s: String) -> Int {
        var left=0,right = 0 ,maxlength=0
        
        for item in s {
            print(item)
            if item == "(" {
                left+=1
            }else{
                right+=1
            }
            if left == right {
                maxlength = max(maxlength,right*2)
            }else if left < right {
                left = 0
                right = 0
            }
        }
        left = 0
        right = 0
        for item in s.reversed() {
            print("反向",item)
            if item == ")" {
                right+=1
            }else{
                left+=1
            }
            if left == right {
                maxlength = max(maxlength,left*2)
            }else if right < left {
                left = 0
                right = 0
            }
        }
        
        return maxlength
    }
}
var numbs:[Int] = [1,1,2]

//Solution().removeDuplicates(&numbs)
Solution().longestValidParentheses("(()")
