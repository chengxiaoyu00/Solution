//: [Previous](@previous)

import Foundation

// * Definition for a binary tree node.
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
    /// 合并二叉树
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {
            return t2
        }
        if t2 == nil {
            return t1
        }
        t1?.val += t2?.val ?? 0
        t1?.left = mergeTrees(t1?.left, t2?.left)
        t1?.right = mergeTrees(t1?.right, t2?.right)
       
        return t1
    }
    /// 中序遍历(迭代)
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var res = [Int]()
        var stack = [TreeNode]()
        var node = root
        while !stack.isEmpty || node != nil {
            if node != nil {
                stack.append(node!)
                node = node!.left
            } else {
                node = stack.popLast()
                res.append(node!.val)
                node = node!.right
            }
        }
        
        return res
    }
    /// 反转二叉树
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if let `root` = root {
            let right = root.right
            let left = root.left
            root.right = left
            root.left = right
            if root.left != nil {
                invertTree(root.left)
            }
            if root.right != nil {
                invertTree(root.right)
            }
            
            return root
            
        }else{
            return nil
        }
        
    }
    /// 层次遍历
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        var queue = [TreeNode]()
        if let root = root {
            queue.append(root)
        }
        while queue.count > 0 {
            let size = queue.count
            var level = [Int]()
            for _ in 0 ..< size {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.insert(level, at: 0)
        }
        return res
    }
    func mideaTree(_ node: TreeNode) -> [Int] {
        var list:[Int] = []
        var stack:[TreeNode] = []
        var currn:TreeNode? = node
        while !stack.isEmpty || currn != nil {
            if let cc = currn{
                stack.append(cc)
                currn = cc.left
            }else{
                currn = stack.popLast()
                if let c = currn?.val {
                    list.append(c)
                }
                currn = currn?.right
                
            }
        }
        return list
        
    }
}
let node = TreeNode(1)
node.left = nil
node.right = TreeNode(2)
node.right?.left = TreeNode(3)
print(Solution().mideaTree(node))
