//
//  App.swift
//  
//
//  Created by lonnie on 2020/9/12.
//
#if canImport(UIKit)
import UIKit
import FoundationLib

class App: NSObject {
    
    static var current = App(window: nil)
    
    public weak var window: UIWindow?
    
    public var storage: DataStorageStrategy
    
    public var network: Networking
    
    public init(
        window: UIWindow?,
        storage: DataStorageStrategy = UserDefaults.standard,
        network: Networking = HttpClient.default) {
        self.window = window
        self.storage = storage
        self.network = network
    }
    
}

#endif
