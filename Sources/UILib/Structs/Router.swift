//
//  File.swift
//  
//
//  Created by lonnie on 2020/8/20.
//
#if canImport(UIKit)
import Foundation
public struct Router {
    
    public enum Method {
        
        case present
        
        case push
        
        case pop
        
        case popToRoot
        
        case popTo(UIViewControllerConvertable)
    }
    
    public let host: UIViewControllerConvertable
    
    public let destination: UIViewControllerConvertable? = nil
    
    public let method: Method = .push
    
    public let animated: Bool = true
    
    public let completion: ()->Void = {}
    
    func start() {
        switch method {
        case .push:
            host.toViewController().navigationController?.pushViewController(destination!.toViewController(), animated: animated)
            completion()
        case .pop:
            host.toViewController().navigationController?.popViewController(animated: animated)
            completion()
        case .popToRoot:
            host.toViewController().navigationController?.popToRootViewController(animated: animated)
            completion()
        case .popTo(let controller):
            host.toViewController().navigationController?.popToViewController(controller.toViewController(), animated: animated)
            completion()
        case .present:
            host.toViewController().present(destination!.toViewController(), animated: animated, completion: completion)
        }
    }
    
}
#endif
