//: [Previous](@previous)

import Foundation
import UIKit
var str = "Hello, playground"

//: [Next](@next)
class Solution {
    func myAtoi(_ str: String) -> Int {
        guard !str.isEmpty else {
            return 0
        }
        
        let ＋: Int8 = 43
        let －: Int8 = 45
        let ascii0: Int8 = 48
        let ascii9: Int8 = 57
        let space: Int8 = 32
        
        
        var sign: Int = 1
        
        var result: Int = 0
        
        let chars = str.utf8CString
        
        var i: Int = 0
        
        while chars[i] == space {
            i += 1
        }
        
        if chars[i] == ＋ || chars[i] == － {
            sign = chars[i] == － ? -1 : 1
            i += 1
        }
        
        while i < chars.count - 1, ascii0...ascii9 ~= chars[i] {
            
            if result > Int32.max / 10 || (result == Int32.max / 10 && Int(chars[i] - ascii0) > 7) {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
            
            result = result * 10 +  Int(chars[i] - ascii0)
            i += 1
        }
        
        return result * sign
    }
}
print(Solution().myAtoi("4193 with words"))
