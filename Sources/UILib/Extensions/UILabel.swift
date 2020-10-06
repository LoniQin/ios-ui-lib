//
//  UILabel.swift
//  
//
//  Created by lonnie on 2020/10/7.
//

import Foundation
#if canImport(UIKit)

import UIKit
public extension UILabel {
    
    convenience init(text: String, textColor: UIColor = .red, font: UIFont, numberofLines: Int = 0) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
    }
    
    convenience init(attributedText: NSAttributedString, numberofLines: Int = 0) {
        self.init()
        self.attributedText = attributedText
        self.numberOfLines = numberOfLines
    }
    
}

#endif
