//
//  UIView+AutoLayout.swift
//  
//
//  Created by lonnie on 2020/1/1.
//
#if canImport(UIKit)

import UIKit

public extension UIView {
    
    func makeLayout(_ strategy: LayoutStrategy) {
        if translatesAutoresizingMaskIntoConstraints {
            translatesAutoresizingMaskIntoConstraints.toggle()
        }
        let constraints = strategy.toLayoutConstraints(with: self)
        if superview == nil {
            addConstraints(constraints)
        } else {
            superview?.addConstraints(constraints)
        }
    }
    
    func makeLayout(_ strategies: [LayoutStrategy]) {
        makeLayout(.strategies(strategies))
    }
    
    func makeLayout(_ strategies: LayoutStrategy...) {
        makeLayout(.strategies(strategies))
    }
    
}

#endif

