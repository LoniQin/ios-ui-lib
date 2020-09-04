//
//  LayoutConstraintConvertable.swift
//  
//
//  Created by lonnie on 2020/9/4.
//
#if canImport(UIKit)

import UIKit

public protocol LayoutConstraintConvertable {
    func toLayoutConstraints(with firstItem: UIView) -> [NSLayoutConstraint]
}

#endif
