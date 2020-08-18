//
//  UIColor+Extension.swift
//
//
//  Created by lonnie on 2020/8/19.
//

import UIKit

public extension UIColor {
    
    convenience init(_ value: Int) {
        let alpha = 0xff & value
        let blue = ((0xff << 8) & value) >> 8
        let green = ((0xff << 16) & value) >> 16
        let red = ((0xff << 24) & value) >> 24
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    func toInt() -> Int {
        let zero = CGFloat.zero
        var (red, green, blue, alpha) = (zero, zero, zero, zero)
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        var value = 0
        [alpha, blue, green, red].enumerated().forEach { index, item in
            let shift = 8 * index
            value |= (Int(Double(item * 255)) << shift)
        }
        return value
    }
    
}
