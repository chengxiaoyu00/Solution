//: [Previous](@previous)

import Foundation
/// 冒泡排序
func bubbleSort (arr: inout [Int]) {
    for i in 0..<arr.count - 1 {
        for j in 0..<arr.count - 1 - i {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
}

/// 选择排序
///
/// - Parameter list: 需要排序的数组
func selectionSort(_ list: inout [Int]) -> Void {
    for j in 0..<list.count - 1 {
        var minIndex = j
        for i in j..<list.count {
            if list[minIndex] > list[i] {
                minIndex = i
            }
        }
        list.swapAt(j, minIndex)
    }
}

/// 插入排序
/// - Parameter arr: 数组
func insertionSort(_ arr:inout [Int]) {
    for i in 1..<arr.endIndex {
        let temp = arr[i]
        for j in (0..<i).reversed() {
            if arr[j] > temp {
                arr.swapAt(j, j+1)
            }
        }
    }
}
// 测试调用
//func testSort () {
//    // 生成随机数数组进行排序操作
//    var list:[Int] = []
//    for _ in 0...99 {
//        list.append(Int(arc4random_uniform(100)))
//    }
//    print("\(list)")
////    bubbleSort(arr:&list)
//    insertionSort(&list)
//    print("\(list)")
//}
//testSort()

public class ListNode {
      
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }

    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next;
        
    }

}
/// 奇偶排列链表
func oddEvenList(_ head: ListNode?) -> ListNode? {

    guard head != nil else {
        return head
    }
    /// 偶数节点的头节点
    let evenHead = head?.next
    /// 奇数节点的尾节点
    var odd = head
    var even = evenHead
    while even?.next != nil,even != nil {
        odd?.next = even?.next
        odd = odd?.next
        even?.next = odd?.next
        even = even?.next
    }
    odd?.next = evenHead
    
    return head

}

func removeDuplicates(_ nums: inout [Int]) -> Int {

    var i = 0
    var j = i+1
    var k = j+1
    var removeIndex:[Int] = []
    while k < nums.count {
        let ni = nums[i]
        let nj = nums[j]
        let nk = nums[k]
        if (ni == nj),(ni == nk) {
            print("chongfu",ni)
            removeIndex.append(i)
        }
        i+=1
        j+=1
        k+=1
        
    }
    
    let temp = nums.enumerated().filter { (index,item) -> Bool in
        return !removeIndex.contains(index)
    }.map { (index,item) -> Int in
        return item
    }
    nums = temp
    print("nums =",temp)
    return temp.count
    
}
var num = [0,1,2,2,2,2,2,3,4,4,4]
removeDuplicates(&num)
