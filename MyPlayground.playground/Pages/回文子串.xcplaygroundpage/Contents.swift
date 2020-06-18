//: [Previous](@previous)

import Foundation
import UIKit

class Solution {
    public func longestPalindrome(_ string: String) -> String {
        
        if string.count < 1 {
           return ""
        }
        
        var start = 0, end = 0
        var dict:[Int:Character] = [:]
        
        for (index,item) in string.enumerated() {
            dict[index] = item
        }
        for (index,item) in string.enumerated() {
            let len1 = expandAroundCenter(string, index, index, current: item, dict: dict)
            let len2 = expandAroundCenter(string, index, index+1, current: item, dict: dict)
            let len = max(len1, len2)
            if len > end-start {
                start = index - (len-1)/2
                end = index+len/2
            }
            
        }
        return string.substring(start, end) ?? ""
    }
    
    private func expandAroundCenter(_ s:  String,_ left:Int, _ right:Int,current: Character ,dict:[Int:Character]) -> Int {
        var L = left, R = right;
        while L >= 0 && R < s.count && dict[L] == dict[R]{
            L = L-1
            R = R+1
        }
        return R - L - 1;
    }
    func isPalindrome(_ x: Int) -> Bool {
        if x<0 {
            return false
        }
        if x%10 == 0 && x != 0 {
            return false
        }
        
        var temp = x
        var revertedNumber = 0
        while temp != 0 {
            revertedNumber = revertedNumber * 10 + temp%10
            temp = temp/10
        }
 
       return  x == revertedNumber || x == revertedNumber/10
        
    }
    func reverse(_ x: Int) -> Int {
        if x<0 {
            let t = x*(-1)
            if t <= 0 && t <= 9 {
                return x
            }
        }
        
        if x >= 0 && x <= 9 {
            return x
        }
        
        var temp = x
        var revertedNumber = 0
        while temp != 0 {
            revertedNumber = revertedNumber * 10 + temp%10
            temp = temp/10
        }
        
        if (revertedNumber > 2147483647 || revertedNumber < -2147483648){
            return 0;
        }
        return revertedNumber
    }
}
extension String {
    func substring(from: IndexDistance) -> String? {
        let index = self.index(self.startIndex, offsetBy: from)
        return self.substring(from: index)
    }
    
    func substring(to: IndexDistance) -> String? {
        let index = self.index(self.startIndex, offsetBy: to + 1)
        return self.substring(to: index)
    }
    
    func substring(with range: Range<IndexDistance>) -> String? {
        let lower = self.index(self.startIndex, offsetBy: range.lowerBound)
        let upper = self.index(self.startIndex, offsetBy: range.upperBound)
        let range = Range(uncheckedBounds: (lower, upper))
        return self.substring(with: range)
    }
    
    func substring(_ lower: IndexDistance, _ range: IndexDistance) -> String? {
        let lowerIndex = self.index(self.startIndex, offsetBy: lower)
        let upperIndex = self.index(lowerIndex, offsetBy: range)
        let range = Range(uncheckedBounds: (lowerIndex, upperIndex))
        return self.substring(with: range)
    }
}
//print(Solution().longestPalindrome("aba"))
//print(Solution().isPalindrome(1213))

print(Solution().reverse(1534236469))
