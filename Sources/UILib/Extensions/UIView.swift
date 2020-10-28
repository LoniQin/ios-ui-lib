//
//  UIView.swift
//
//
//  Created by lonnie on 2020/8/22.
//
#if !os(macOS)

import UIKit
import FoundationLib

fileprivate var tapKey: String = "tapKey"

fileprivate var swipeKey: String = "swipeKey"

fileprivate var panKey: String = "panKey"

fileprivate var longPressKey: String = "longPressKey"

fileprivate var pinchKey: String = "pinchKey"

fileprivate var rotationKey: String = "rotationKey"

// MARK: Gesture Recognizers
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
    
    @objc fileprivate func handleTapEvent(_ gesture: UITapGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &tapKey)
        block?(gesture)
    }
    
    @discardableResult
    func onSwipe(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &swipeKey)
        self.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeEvent)))
        return self
    }
    
    @objc fileprivate func handleSwipeEvent(_ gesture: UITapGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &swipeKey)
        block?(gesture)
    }
    
    @discardableResult
    func onPan(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &panKey)
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanEvent)))
        return self
    }
    
    @objc fileprivate func handlePanEvent(_ gesture: UITapGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &panKey)
        block?(gesture)
    }
    
    @discardableResult
    func onLongPress(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &longPressKey)
        self.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressEvent)))
        return self
    }
    
    @objc fileprivate func handleLongPressEvent(_ gesture: UILongPressGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &longPressKey)
        block?(gesture)
    }
    
    @discardableResult
    func onPinch(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &pinchKey)
        self.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(handlePinchEvent)))
        return self
    }
    
    @objc fileprivate func handlePinchEvent(_ gesture: UIPinchGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &pinchKey)
        block?(gesture)
    }
    
    @discardableResult
    func onRotation(_ block: @escaping GestureRecognizerBlock) -> Self {
        setAssociatedValue(block, with: &rotationKey)
        self.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(handleRotationEvent)))
        return self
    }
    
    @objc fileprivate func handleRotationEvent(_ gesture: UIRotationGestureRecognizer) {
        let block: GestureRecognizerBlock? = getAssociatedValue(with: &rotationKey)
        block?(gesture)
    }
    
}

// MARK: Add and remove subviews
public extension UIView {
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

// MARK: Add lines
public extension UIView {
    
    struct Line {
        
        public enum Direction {
            
            case leading
            
            case trailing
            
            case top
            
            case bottom
            
        }
        
        public var color: UIColor
        
        public var thickness: CGFloat
        
        public var padding: CGFloat
        
        public var direction: Direction
        
        public init(
            color: UIColor,
            direction: Direction,
            thickness: CGFloat = 1.0,
            padding: CGFloat = 0
        ) {
            self.color = color
            self.thickness = thickness
            self.padding = padding
            self.direction = direction
        }
    }
    
    func addLine(_ line: Line) -> Self {
        let view = UIView()
        self.addSubview(view)
        var strategies = [LayoutStrategy]()
        switch line.direction {
        case .top, .bottom:
            if line.direction == .top {
                strategies.append(.equalTop())
            } else {
                strategies.append(.equalBottom())
            }
            strategies.append(.equalHorizontal(offset: (line.padding, line.padding)))
            strategies.append(.constraint(attribute: .height, constant: line.thickness, relateToSuperView: false))
        case .leading, .trailing:
            if line.direction == .leading {
                strategies.append(.equalLeading())
            } else {
                strategies.append(.equalTrailing())
            }
            strategies.append(.equalVertical(offset: (line.padding, line.padding)))
            strategies.append(.constraint(attribute: .width, constant: line.thickness, relateToSuperView: false))
        }
        view.makeLayout(strategies)
        return self
    }
}

#endif
