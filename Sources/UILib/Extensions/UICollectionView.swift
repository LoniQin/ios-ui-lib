//
//  UICollectionView.swift
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
    

}

extension UICollectionView: ListView {
    
    public func register(_ cls: AnyClass) {
        register(cls, forCellWithReuseIdentifier: cls.description())
    }
    
    public func register(_ nib: UINib) {
        if let cell = nib.instantiate(withOwner: nil, options: nil).first as? UICollectionViewCell {
            register(nib, forCellWithReuseIdentifier: cell.classForCoder.description())
        }
    }
    
}

#endif
