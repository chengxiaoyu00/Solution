//: [Previous](@previous)

import UIKit
import Foundation
import WebKit
var str = "Hello, playground"

//: [Next](@next)
var view : WKWebView!
var config :WKWebViewConfiguration?
config = WKWebViewConfiguration.init()
config?.allowsAirPlayForMediaPlayback = true
config?.applicationNameForUserAgent = "ceshi"
config?.ignoresViewportScaleLimits = true
//config?.urlSchemeHandler(forURLScheme: "www.baidu.com")
view = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), configuration: config!)
let requ = URLRequest.init(url: URL(string: "www.baidu.com")!, timeoutInterval: 10)
view.load(requ)


extension Array {
    
    // 去重
    func filterDuplicates<E: Equatable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        for value in self {
            let key = filter(value)
            if !result.map({filter($0)}).contains(key) {
                result.append(value)
            }
        }
        return result
    }
}

class DemoModel: CustomStringConvertible {
    
    let name: String
    let numberid:Int
    init(_ name: String,_ id: Int) {
        self.name = name
        self.numberid = id
    }
    
    var description: String {
        return name
    }
}

let arrays = ["1", "2", "2", "3", "4", "4"]
let filterArrays = arrays.filterDuplicates({$0})
print(filterArrays)

let modelArrays = [DemoModel("1",2), DemoModel("1",3), DemoModel("2",3), DemoModel("3",4)]
let filterModels = modelArrays.filterDuplicates({$0.numberid})
print(filterModels)

