import UIKit
import Foundation
//var str = "Hello, playground"
//
//var view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//view.backgroundColor = .red
//
//UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10, options:.curveEaseIn , animations: {
//    view.transform = CGAffineTransform(scaleX: 20, y: 20)
//}) { (finish) in
//
//}
//
let queue = DispatchQueue(label: "com.xiaoyu.queue",qos:.utility ,attributes: .concurrent)
var isback = false
queue.sync {
    for i in 0..<10 {
        print("🌈",i,"当前线程: \(Thread.current)")
    }
}

print("🐒当前线程: \(Thread.current)")
print("🐒")
queue.async {
    for i in 0..<10 {
        print("🌈-",i,"当前线程: \(Thread.current)")
    }
}
//DispatchQueue.main.async {
//    isback = true
//}
queue.sync {
    isback = true
}
//DispatchQueue.main.async {
//    DispatchQueue.main.async {
//        sleep(2)
//        print(1)//3
//    }
//    print(2) // 1s
//    DispatchQueue.main.async {
//        print(3)//3
//    }
//}
//sleep(1)
//let queue = OperationQueue()
//queue.maxConcurrentOperationCount = 1
//queue.addOperation {
//    queue.addOperation {
//        sleep(1)
//        print(1,"当前线程: \(Thread.current)")
//    }
//    print(2,"当前线程: \(Thread.current)")
//    queue.addOperation {
//        print(3,"当前线程: \(Thread.current)")
//    }
//}
//print(4,"当前线程: \(Thread.current)")
//sleep(2)
// map
//let abc: String = "abc"
//_ = abc.map {
//    print($0.description)
//}
//
//// filter
//let filtered = abc.filter { $0 == "b" }

// reduce
//let result = abc.reduce("5") { (result, c) -> String in
////    print(result)
////    print(c)
//    return String(c) + result
//}
//print(result)
//
//var dict = Dictionary<String, Any>()
//
//dict["sksk"] = 6
//dict["sksk"] = 7
//print(dict)
//var tcount = 40
//var isUpdata = false
//class Solution {
//    lazy var operationQueue: OperationQueue = {
//        let queue = OperationQueue()
//        queue.name = "com.EventsLikesVC.queue"
//        queue.maxConcurrentOperationCount = 1
//        return queue
//    }()
//}
//
//var _isUpdate: Bool = true
//let lock = NSLock()
///// 网络请求参数
//var isUpdate: Bool {
//    get {
//        return _isUpdate
//    }
//    set {
//        lock.lock()
//        _isUpdate = newValue
//        lock.unlock()
//    }
//}
//let operation = BlockOperation {
//    while true {
////        lock.lock()
//        if !isUpdata {
//            break
//        }
//        if tcount > 0 {
//            tcount -= 1
//            debugPrint("剩余：\(tcount) 线程：\(Thread.current)")
//            sleep(UInt32(1.2))
//        }
//
//        if tcount <= 0 {
//            break
//        }
////        lock.unlock()
//    }
//}
//let operation2 = BlockOperation {
//    while true {
////        lock.lock()
////        isUpdata = false
//        if isUpdata {
//            break
//        }
//        if tcount > 0 {
//            tcount -= 1
//            debugPrint("2剩余：\(tcount) 线程：\(Thread.current)")
//            sleep(UInt32(1.2))
//        }
//        if tcount <= 0 {
//            break
//        }
////        lock.unlock()
//    }
//}
//let operation3 = BlockOperation {
//    while true {
//        //        lock.lock()
//        //        isUpdata = false
//        if !isUpdata {
//            break
//        }
//        if tcount > 0 {
//            tcount -= 1
//            debugPrint("3剩余：\(tcount) 线程：\(Thread.current)")
//                        sleep(UInt32(1.2))
//        }
//        if tcount <= 0 {
//            break
//        }
//        //        lock.unlock()
//    }
//}
//let operation4 = BlockOperation {
//    while true {
//        //        lock.lock()
//        //        isUpdata = false
//        if isUpdata {
//            break
//        }
//        if tcount > 0 {
//            tcount -= 1
//            debugPrint("4剩余：\(tcount) 线程：\(Thread.current)")
//                        sleep(UInt32(1.2))
//        }
//        if tcount <= 0 {
//            break
//        }
//        //        lock.unlock()
//    }
//}
//isUpdata = true
//let vvvv = Solution()
//vvvv.operationQueue.addOperation(operation)
////sleep(UInt32(7))
//isUpdata = false
//vvvv.operationQueue.addOperation(operation2)
//isUpdata = true
//vvvv.operationQueue.addOperation(operation3)
////sleep(UInt32(7))
//isUpdata = false
//vvvv.operationQueue.addOperation(operation4)
