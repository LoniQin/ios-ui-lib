//
//  AppBuilder.swift
//  
//
//  Created by lonnie on 2020/9/12.
//
#if canImport(UIKit)
import UIKit
import FoundationLib

extension App: Buildable {
    
    typealias BuilderClass = AppBuilder
    
}
class AppBuilder: Builder<App> {

    public func rootViewController(_ value: UIViewControllerConvertable) -> Self {
        build {
            $0.window?.rootViewController = value.toViewController()
            $0.window?.makeKeyAndVisible()
        }
    }
    
    public func storage( _ value: DataStorageStrategy) -> Self {
        build {
            $0.storage = value
        }
    }
    
}

#endif
