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
    
}

#endif
