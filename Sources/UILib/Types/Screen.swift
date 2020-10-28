//
//  File.swift
//  
//
//  Created by lonnie on 2020/8/20.
//
#if !os(macOS)

import Foundation
import UIKit

public struct Screen {
    
    private let screen: UIScreen
    
    public init(screen: UIScreen) {
        self.screen = screen
    }
    
    public static let main = Screen(screen: .main)
    
    public var width: CGFloat { screen.bounds.size.width }
    
    public var height: CGFloat { screen.bounds.size.height }
    
    public var scale: CGFloat { screen.scale }
    
    public var nativeScale: CGFloat { screen.nativeScale }
    
    public func snapshotView(afterScreenUpdates afterUpdates: Bool) -> UIView {
        return screen.snapshotView(afterScreenUpdates: afterUpdates)
    }
    
}

#endif
