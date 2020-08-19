//
//  File.swift
//  
//
//  Created by lonnie on 2020/8/20.
//

import Foundation
import UIKit
public struct Screen {
    
    private var screen: UIScreen
    
    private init(screen: UIScreen) {
        self.screen = screen
    }
    
    static var main = Screen(screen: .main)
    
    public var width: CGFloat { screen.bounds.size.width }
    
    public var height: CGFloat { screen.bounds.size.height }
    
    public var scale: CGFloat { screen.scale }
    
    func snapshotView(afterScreenUpdates afterUpdates: Bool) -> UIView {
        return screen.snapshotView(afterScreenUpdates: afterUpdates)
    }
    
}