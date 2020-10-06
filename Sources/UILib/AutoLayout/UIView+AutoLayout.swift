//
//  UIView+AutoLayout.swift
//  
//
//  Created by lonnie on 2020/1/1.
//
#if canImport(UIKit)

import UIKit

public extension UIView {
    
    @discardableResult
    func makeLayout(_ strategy: LayoutStrategy) -> Self {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints.toggle()
        }
        let constraints = strategy.toLayoutConstraints(with: self)
        if superview == nil {
            addConstraints(constraints)
        } else {
            superview?.addConstraints(constraints)
        }
        return self
    }
    
    @discardableResult
    func makeLayout(_ strategies: [LayoutStrategy]) -> Self {
        makeLayout(.strategies(strategies))
    }
    
    @discardableResult
    func makeLayout(_ strategies: LayoutStrategy...) -> Self {
        makeLayout(.strategies(strategies))
    }
    
}

#endif

