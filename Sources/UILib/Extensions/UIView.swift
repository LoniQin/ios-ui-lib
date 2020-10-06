//
//  UIView.swift
//
//
//  Created by lonnie on 2020/8/22.
//
#if canImport(UIKit)

import UIKit
import FoundationLib

fileprivate var tapKey: String = "tapKey"

public extension UIView {
    
    typealias GestureRecognizerBlock = (UIGestureRecognizer)->Void
    
    convenience init(color: UIColor) {
        self.init()
        self.backgroundColor = color
    }
    
    func onTap(_ block: @escaping GestureRecognizerBlock) -> Void {
        setAssociatedValue(block, with: &tapKey)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapEvent)))
    }
    
    @objc func handleTapEvent(_ gesture: UITapGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &tapKey)
        block?(gesture)
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func becomeSubview(of view: UIView) -> Self {
        view.addSubview(self)
        return self
    }
    
    func addSubviews(@ArrayBuilder _ builder: () -> [UIView]) {
        addSubviews(builder())
    }
    
    func removeSubviews(_ views: [UIView]) {
        views.forEach {
            $0.removeFromSuperview()
        }
    }
    
}

#endif
