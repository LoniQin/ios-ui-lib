//
//  UIView+Extension.swift
//  CryptorDemo
//
//  Created by gzuser on 8/20/20.
//  Copyright © 2020 com.lonnie.demos. All rights reserved.
//
#if canImport(UIKit)

import UIKit

fileprivate var tapKey: String = "tapKey"
public extension UIView {
    typealias GestureRecognizerBlock = (UIGestureRecognizer)->Void
    func onTap(_ block: @escaping GestureRecognizerBlock) -> Void {
        setAssociatedValue(block, with: &tapKey)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapEvent)))
    }
    
    @objc func handleTapEvent(_ gesture: UITapGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &tapKey)
        block?(gesture)
    }
}

#endif
