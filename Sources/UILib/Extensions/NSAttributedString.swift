//
//  NSAttributedString.swift
//  
//
//  Created by lonnie on 2020/9/26.
//
#if !os(macOS)
import UIKit
public extension NSAttributedString {
    convenience init(
        string: String,
        font: UIFont, textColor: UIColor,
        lineHeight: CGFloat? = nil,
        lineSpacing: CGFloat? = nil) {
        let paragraphStyle = NSMutableParagraphStyle()
        var attributes: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: textColor]
        if let lineHeight = lineHeight {
            paragraphStyle.minimumLineHeight = lineHeight
        }
        if let lineSpacing = lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing
        }
        attributes[.paragraphStyle] = paragraphStyle
        self.init(string: string, attributes: attributes)
    }
}
#endif
