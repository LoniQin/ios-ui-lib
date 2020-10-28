//
//  UITableViewCell.swift
//  
//
//  Created by lonnie on 2020/8/22.
//
#if !os(macOS)

import UIKit
public extension UITableView {
    
    func dequeueCell<T: UITableViewCell>() -> T {
        dequeueReusableCell(withIdentifier: T.classForCoder().description()) as! T
    }
    
}

extension UITableView: ListView {
    
    public func register(_ cls: AnyClass) {
        register(cls, forCellReuseIdentifier: cls.description())
    }
    
    public func register(_ nib: UINib) {
        if let cell = nib.instantiate(withOwner: nil, options: nil).first as? NSObject {
            register(nib, forCellReuseIdentifier: cell.classForCoder.description())
        }
    }
    
}

#endif
