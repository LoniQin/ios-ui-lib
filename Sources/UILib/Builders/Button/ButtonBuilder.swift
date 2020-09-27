//
//  File.swift
//  
//
//  Created by lonnie on 2020/9/9.
//
#if canImport(UIKit)
import FoundationLib
import UIKit
extension UIButton: Buildable {
    
    public typealias BuilderClass = ButtonBuilder
    
}
public class ButtonBuilder: Builder<UIButton> {
    
    public func touchUpInside(_ handler: @escaping (T) -> Void) -> Self {
        build {
            $0.onTouchUpInside { (control) in
                if let control = control as? T {
                    handler(control)
                }
            }
        }
    }
    
}
#endif