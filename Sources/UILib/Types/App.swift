//
//  App.swift
//  
//
//  Created by lonnie on 2020/9/12.
//
#if canImport(UIKit)
import UIKit
import FoundationLib

public class App: NSObject {
    
    public static var current = App(window: nil)
    
    public weak var window: UIWindow?
    
    public var storage: DataStorageStrategy = NSCacheStorage.default
    
    public var network: Networking = HttpClient.default
    
    public var logger: Logging = DebugLogger.default
    
    public init(
        window: UIWindow?) {
        self.window = window
    }
    
}

#endif
