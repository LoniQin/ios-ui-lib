//
//  UIControl+Extension.swift
//  CryptorDemo
//
//  Created by gzuser on 8/20/20.
//  Copyright © 2020 com.lonnie.demos. All rights reserved.
//
#if canImport(UIKit)
import UIKit
import FoundationLib

fileprivate var onTouchInsideKey = "onTouchInside"

fileprivate var onEditingBeginKey = "onEditingBeginKey"

fileprivate var onEditingEndKey = "onEditingEndKey"

public extension UIControl {
    
    typealias ActionBlock = (UIControl)->Void
    
    @discardableResult
    func onTouchUpInside(block: @escaping ActionBlock) -> Self {
        setBlock(block: block, with: &onTouchInsideKey)
        addTarget(self, action: #selector(handleTouchUpInside), for: .touchUpInside)
        return self
    }
    
    @objc private func handleTouchUpInside(control: UIControl) {
       executeBlock(with: &onTouchInsideKey)
    }
    
    @discardableResult
    func onEditingBegin(block: @escaping ActionBlock) -> Self {
        setBlock(block: block, with: &onEditingBeginKey)
        addTarget(self, action: #selector(handleEditingBegin), for: .editingDidBegin)
        return self
    }
    
    @objc private func handleEditingBegin(control: UIControl) {
       executeBlock(with: &onEditingBeginKey)
    }
    
    @discardableResult
    func onEditingEnd(block: @escaping ActionBlock) -> Self {
        setBlock(block: block, with: &onEditingEndKey)
        addTarget(self, action: #selector(handleEditingEnd), for: .editingDidEnd)
        return self
    }
    
    @objc private func handleEditingEnd(control: UIControl) {
       executeBlock(with: &onEditingEndKey)
    }
    
    func setBlock(block: @escaping ActionBlock, with key: inout String) {
        setAssociatedValue(block, with: &key)
    }
    
    func executeBlock(with key: inout String) {
        
        let block: ActionBlock? = getAssociatedValue(with: &key)
        if let value = self as? Self {
            block?(value)
        }
   
    }
}
#endif
