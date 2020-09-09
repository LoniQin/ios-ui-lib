//
//  File.swift
//  
//
//  Created by lonnie on 2020/9/9.
//
#if canImport(UIKit)
import UIKit
import FoundationLib
extension Builder where T: UIView {
    
    func layout(_ layouts: LayoutStrategy...) -> Self {
        value?.makeLayout(layouts)
        return self
    }
    
    func backgroundColor(_ _backgroundColor: UIColor) -> Self {
        value?.backgroundColor = _backgroundColor
        return self
    }
    
    func alpha(_ _alpha: CGFloat) -> Self {
        value?.alpha = _alpha
        return self
    }
    
    func hidden(_ _isHidden: Bool) -> Self {
        value?.isHidden = _isHidden
        return self
    }
    
    struct Border {
        var color: UIColor
        var width: CGFloat
        var cornerRaidus: CGFloat
        var maskToBounds: Bool
    }
    
    func border(_ border: Border) -> Self {
        value?.layer.borderWidth = border.width
        value?.layer.borderColor = border.color.cgColor
        value?.layer.cornerRadius = border.cornerRaidus
        value?.layer.masksToBounds = border.maskToBounds
        return self
    }
    
}

#endif
