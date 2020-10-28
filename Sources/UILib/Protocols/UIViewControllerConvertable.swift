//
//  UIViewControllerConvertable.swift
//  
//
//  Created by lonnie on 2020/8/20.
//
#if !os(macOS)

import UIKit

public protocol UIViewControllerConvertable: NSObjectProtocol {
    
    func toViewController() -> UIViewController
    
}

extension UIViewController: UIViewControllerConvertable {
    
    public func toViewController() -> UIViewController { self }
    
}

#endif
