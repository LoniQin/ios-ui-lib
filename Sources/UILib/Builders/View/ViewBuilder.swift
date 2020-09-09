//
//  ViewBuilder.swift
//  
//
//  Created by lonnie on 2020/9/9.
//
#if canImport(UIKit)

import UIKit
import FoundationLib

extension Builder where T: UIView {
    
    public struct Border {
        
        var color: UIColor
        
        var width: CGFloat = 1
        
        var cornerRaidus: CGFloat = 0
        
        var maskToBounds: Bool = true
    }
    
    public func subview(_ view: UIView, _ strateges: LayoutStrategy...) -> Self {
        value?.addSubview(view)
        view.makeLayout(strateges)
        return self
    }
    
    public func layout(_ strateges: LayoutStrategy...) -> Self {
        value?.makeLayout(strateges)
        return self
    }
    
    public func backgroundColor(_ _backgroundColor: UIColor) -> Self {
        value?.backgroundColor = _backgroundColor
        return self
    }
    
    public func alpha(_ _alpha: CGFloat) -> Self {
        value?.alpha = _alpha
        return self
    }
    
    public func hidden(_ _isHidden: Bool) -> Self {
        value?.isHidden = _isHidden
        return self
    }
    
    public func border(_ border: Border) -> Self {
        value?.layer.borderWidth = border.width
        value?.layer.borderColor = border.color.cgColor
        value?.layer.cornerRadius = border.cornerRaidus
        value?.layer.masksToBounds = border.maskToBounds
        return self
    }
    
}

#endif
