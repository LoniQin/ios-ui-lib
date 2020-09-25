//
//  CABasicAnimation.swift
//  
//
//  Created by lonnie on 2020/9/25.
//
#if canImport(UIKit)
import UIKit
public extension CABasicAnimation {
    
    convenience init(
        keyPath: CustomStringConvertible,
        fromValue: Any,
        toValue: Any,
        duration: Double,
        repeatCount: Float = 1,
        autoreverses: Bool = false,
        fillMode: CAMediaTimingFillMode = .removed,
        isRemovedOnCompletion: Bool = true,
        timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: .linear),
        isAdditive: Bool = false,
        isCumulative: Bool = false,
        valueFunction: CAValueFunction? = nil
    ) {
        self.init(keyPath: keyPath.description)
        self.fromValue = fromValue
        self.toValue = toValue
        self.autoreverses = autoreverses
        self.duration = duration
        self.repeatCount = repeatCount
        self.fillMode = fillMode
        self.timingFunction = timingFunction
        self.isRemovedOnCompletion = isRemovedOnCompletion
        self.isAdditive = isAdditive
        self.isCumulative = isCumulative
        self.valueFunction = valueFunction
    }
}
#endif
