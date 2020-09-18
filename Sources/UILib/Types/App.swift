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
    
    public weak var window: UIWindow?
    
    public var storage: DataStorageStrategy
    
    public init(
        window: UIWindow?,
        storage: DataStorageStrategy = UserDefaults.standard) {
        self.window = window
        self.storage = storage
    }
    
}

#endif
