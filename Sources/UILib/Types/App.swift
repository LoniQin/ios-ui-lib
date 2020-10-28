//
//  App.swift
//  
//
//  Created by lonnie on 2020/9/12.
//
#if !os(macOS)
import UIKit
import FoundationLib

public class App: NSObject {
    
    public static var current = App(window: nil)
    
    public weak var window: UIWindow?
    
    public var storage: DataStorage = CacheStorage.default
    
    public var network: Networking = HttpClient.default
    
    public var logger: Logging = DebugLogger.default
    
    public init(
        window: UIWindow?) {
        self.window = window
    }
    
}

#endif
