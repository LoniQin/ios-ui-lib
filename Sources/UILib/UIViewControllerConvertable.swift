//
//  UIViewControllerConvertable.swift
//  
//
//  Created by lonnie on 2020/8/20.
//
import UIKit
import Foundation
public protocol UIViewControllerConvertable {
    
    func toViewController() -> UIViewController
    
}

extension UIViewController: UIViewControllerConvertable {
    
    public func toViewController() -> UIViewController { self }
    
}
