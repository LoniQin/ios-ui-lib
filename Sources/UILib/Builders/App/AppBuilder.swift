//
//  AppBuilder.swift
//  
//
//  Created by lonnie on 2020/9/12.
//
#if !os(macOS)
import UIKit
import FoundationLib

extension App: Buildable {
    
    public typealias BuilderClass = AppBuilder
    
}
public class AppBuilder: Builder<App> {

    @discardableResult
    public func rootViewController(_ value: UIViewControllerConvertable) -> Self {
        build {
            $0.window?.rootViewController = value.toViewController()
            $0.window?.makeKeyAndVisible()
        }
    }

}

#endif
