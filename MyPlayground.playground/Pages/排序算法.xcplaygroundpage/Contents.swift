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
func testSort () {
    // 生成随机数数组进行排序操作
    var list:[Int] = []
    for _ in 0...99 {
        list.append(Int(arc4random_uniform(100)))
    }
    print("\(list)")
//    bubbleSort(arr:&list)
    insertionSort(&list)
    print("\(list)")
}
testSort()
