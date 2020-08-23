//
//  UITableViewCell.swift
//  
//
//  Created by lonnie on 2020/8/22.
//
#if canImport(UIKit)

import UIKit
public extension UITableView {
    
    func dequeueCell<T: UITableViewCell>() -> T {
        dequeueReusableCell(withIdentifier: T.classForCoder().description()) as! T
    }
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(T.self, forCellReuseIdentifier: T.classForCoder().description())
    }
    
    func register(_ nib: UINib) {
        if let cell = nib.instantiate(withOwner: nil, options: nil).first as? UITableViewCell {
            register(nib, forCellReuseIdentifier: cell.classForCoder.description())
        }
    }
    
}

#endif
