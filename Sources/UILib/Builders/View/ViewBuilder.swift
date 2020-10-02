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
        
        var width: CGFloat
        
        var cornerRaidus: CGFloat
        
        var maskToBounds: Bool
        
        public init(color: UIColor, width: CGFloat = 1, cornerRaidus: CGFloat = 0, maskToBounds: Bool = true) {
            self.color = color
            self.width = width
            self.cornerRaidus = cornerRaidus
            self.maskToBounds = true
        }
    }
    
    public func appendingSubview(_ view: UIView, _ strateges: LayoutStrategy...) -> Self {
        value?.addSubview(view)
        view.makeLayout(strateges)
        return self
    }
    
    public func layout(_ strateges: LayoutStrategy...) -> Self {
        value?.makeLayout(strateges)
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
