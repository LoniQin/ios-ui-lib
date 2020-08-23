//
//  Alert.swift
//  
//
//  Created by lonnie on 2020/8/20.
//
#if canImport(UIKit)

import Foundation
import UIKit

public struct Alert {
    
    public struct Action {
        
        public enum Style: Int {
            
            case `default` = 0

            case cancel = 1

            case destructive = 2

        }
        
        public var title: String
        
        public var style: Style
        
        public var block: ()->Void
        
        public init(
            title: String,
            style: Style = .default,
            block: @escaping ()->Void = {}) {
            self.title = title
            self.style = style
            self.block = block
        }
        
    }
    
    public var title: String
    
    public var message: String
    
    public var actions: [Action]
    
    public var host: UIViewControllerConvertable
    
    public init(
        host: UIViewControllerConvertable,
        title: String = "",
        message: String = "",
        actions: [Action] = []) {
        self.title = title
        self.message = message
        self.actions = actions
        self.host = host
    }
    
    public func show() {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(UIAlertAction(title: action.title, style: UIAlertAction.Style(rawValue: action.style.rawValue) ?? .default, handler: { _ in
                action.block()
            }))
        }
        host.toViewController().present(alert, animated: true, completion: nil)
    }
    
}

#endif
