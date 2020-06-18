//: [Previous](@previous)

import Foundation
import UIKit

class test:UIView {
    var lab = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    /// 开始扫光效果
    ///
    /// - Parameters:
    ///   - repeatCount: 重复次数- 如果次数小于最大数值需要在动画结束时调用stopShimmering
    ///   - delegate: 动画代理CAAnimationDelegate
    func startShimmering(_ repeatCount:Float = Float.greatestFiniteMagnitude,delegate: CAAnimationDelegate? = nil) {
        
        let light = UIColor(white: 0, alpha: 0.1).cgColor
        let dark = UIColor.black.cgColor
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [dark, light, dark]
        gradient.frame = CGRect(x: -bounds.size.width, y: 0, width: 3 * bounds.size.width, height: bounds.size.height)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint   = CGPoint(x: 1.0, y: 0.525)
        gradient.locations  = [0.4, 0.5, 0.6]
        
        layer.mask = gradient
        
        let animation: CABasicAnimation = CABasicAnimation.init(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue   = [0.8, 0.9, 1.0]
        animation.delegate = delegate
        animation.duration = 2.5
        animation.repeatCount = repeatCount
        animation.isRemovedOnCompletion = false
        
        gradient.add(animation, forKey: "shimmer")
    }
    
    
    
    func stopShimmering() {
        layer.removeAllAnimations()
        layer.mask = nil
    }
}

let vi = test()
//vi.startShimmering()
