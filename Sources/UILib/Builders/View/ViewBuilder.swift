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
    
    func backgroundColor(_ color: UIColor) -> Self {
        value?.backgroundColor = color
        return self
    }
    
}

#endif
