//
//  LayoutConstraintConvertable.swift
//  
//
//  Created by lonnie on 2020/9/4.
//
#if !os(macOS)

import UIKit

public protocol LayoutConstraintConvertable {
    func toLayoutConstraints(with firstItem: UIView) -> [NSLayoutConstraint]
}

#endif
