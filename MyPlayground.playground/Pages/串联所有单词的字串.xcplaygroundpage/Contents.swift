//: [Previous](@previous)

import Foundation

class Solution {
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        
        var temp:[Int] = []
        
        var wordsIndexs:[String] = []
        var  tempstring = s
        
        for (index,item) in words.enumerated() {
            /// 顺序往后遍历
//            print(String(index))
            
            wordsIndexs.append(String(index))
            
            tempstring = tempstring.replacingOccurrences(of: item, with: String(index))
            
        
        }
//        tempstring.components(separatedBy: "")
        var tempA:[Int:[Int]] = [:]
        
        var tempAk = 0
        for item in tempstring {
            print(item.isNumber)
            
            if item.isNumber,let c = item.wholeNumberValue {
                if let _ = tempA[tempAk] {
                    tempA[tempAk]?.append(c)
                }else{
                   tempA[tempAk] = [c]
                }
                
            }else{
                tempAk += 1
            }
        }
        print(tempA)
        return temp
    }
}

var s = "barfoothefoobarman", words = ["foo","bar"]

print(Solution().findSubstring(s,words))
