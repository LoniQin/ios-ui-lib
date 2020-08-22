//
//  UICollectionView+Extension.swift
//  
//
//  Created by lonnie on 2020/8/22.
//

#if canImport(UIKit)

import UIKit

public extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: T.classForCoder().description(), for: indexPath) as! T
    }
    
    func register(_ cls: AnyClass) {
        register(cls, forCellWithReuseIdentifier: cls.description())
    }
    
}

#endif
