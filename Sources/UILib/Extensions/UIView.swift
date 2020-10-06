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

fileprivate var swipeKey: String = "swipeKey"

fileprivate var panKey: String = "panKey"

fileprivate var longPressKey: String = "longPressKey"

fileprivate var pinchKey: String = "pinchKey"

fileprivate var rotationKey: String = "rotationKey"

public extension UIView {
    
    typealias GestureRecognizerBlock = (UIGestureRecognizer)->Void
    
    convenience init(color: UIColor) {
        self.init()
        self.backgroundColor = color
    }
    
    @discardableResult
    func onTap(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &tapKey)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapEvent)))
        return self
    }
    
    @objc func handleTapEvent(_ gesture: UITapGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &tapKey)
        block?(gesture)
    }
    
    @discardableResult
    func onSwipe(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &swipeKey)
        self.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeEvent)))
        return self
    }
    
    @objc func handleSwipeEvent(_ gesture: UITapGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &swipeKey)
        block?(gesture)
    }
    
    @discardableResult
    func onPan(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &panKey)
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanEvent)))
        return self
    }
    
    @objc func handlePanEvent(_ gesture: UITapGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &panKey)
        block?(gesture)
    }
    
    @discardableResult
    func onLongPress(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &longPressKey)
        self.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressEvent)))
        return self
    }
    
    @objc func handleLongPressEvent(_ gesture: UILongPressGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &longPressKey)
        block?(gesture)
    }
    
    @discardableResult
    func onPinch(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &pinchKey)
        self.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(handlePinchEvent)))
        return self
    }
    
    @objc func handlePinchEvent(_ gesture: UIPinchGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &pinchKey)
        block?(gesture)
    }
    
    @discardableResult
    func onRotation(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &rotationKey)
        self.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(handleRotationEvent)))
        return self
    }
    
    @objc func handleRotationEvent(_ gesture: UIRotationGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &rotationKey)
        block?(gesture)
    }
    
    @discardableResult
    func addSubviews(_ views: [UIView]) -> Self  {
        views.forEach {
            addSubview($0)
        }
        return self
    }
    
    @discardableResult
    func becomeSubview(of view: UIView) -> Self {
        view.addSubview(self)
        return self
    }
    
    @discardableResult
    func addSubviews(@ArrayBuilder _ builder: () -> [UIView]) -> Self {
        addSubviews(builder())
    }
    
    @discardableResult
    func removeSubviews(_ views: [UIView]) -> Self {
        views.forEach {
            $0.removeFromSuperview()
        }
        return self
    }
    
}

#endif
