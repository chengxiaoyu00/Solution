//: [Previous](@previous)

import Foundation



//: [Next](@next)
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
    func maxDepth(_ root: TreeNode?) -> Int {
    
        guard let `root` = root else { return 0 }
        if root.left  == nil && root.right == nil {
            return 1
        }
        return (1 + max(maxDepth(root.left), maxDepth(root.right)))
        
    }
    
    /// 迭代
    ///
    /// - Parameter root:
    /// - Returns: 最大深度
    func maxDepth2(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var depth: Int = 0
        var stack: [(TreeNode, Int)] = []
        stack.append((root!, 1))
        while !stack.isEmpty {
            let (node, nDepth) = stack.removeLast()
            depth = max(depth, nDepth)
            
            if let right = node.right {
                stack.append((right, nDepth + 1))
            }
            if let left = node.left {
                stack.append((left, nDepth + 1))
            }
        }
        return depth
    }
}
