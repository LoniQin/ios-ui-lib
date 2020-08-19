//
//  File.swift
//  
//
//  Created by lonnie on 2020/8/20.
//

import Foundation
public struct Router {
    
    public enum Method {
        
        case present
        
        case push
    }
    
    public let from: UIViewControllerConvertable
    
    public let to: UIViewControllerConvertable
    
    public let method: Method = .push
    
    public let animated: Bool = true
    
    public let completion: ()->Void = {}
    
    func start() {
        switch method {
        case .push:
            from.toViewController().navigationController?.pushViewController(to.toViewController(), animated: animated)
            completion()
        default:
            from.toViewController().present(to.toViewController(), animated: animated, completion: completion)
        }
    }
    
}
