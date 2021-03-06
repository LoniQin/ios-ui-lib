//
//  CollectionViewBuilder.swift
//  
//
//  Created by lonnie on 2020/9/8.
//
#if !os(macOS)
import UIKit
import FoundationLib
extension UICollectionView: Buildable {
    
    public typealias BuilderClass = CollectionViewBuilder
    
}

public class CollectionViewBuilder: Builder<UICollectionView> {
    
    public struct Section {
        
        public var items: [Item]
        
    }
    
    public struct Item {
        
        public var cell: ()->UICollectionViewCell
        
        public var itemSize: ()->CGSize
        
        public var handlers: [Handler] = []
        
        public var canMove: ()->Bool = { false }
        
        public var shouldFocus: ()->Bool = { false }
        
        public var canSelect: ()->Bool = { true }
        
        func runHandlers(_ event: Handler.Event, _ params: inout [ParamKey: Any]) {
            handlers.filter({$0.event == event}).forEach {
                $0.block(&params)
            }
        }
        
    }
    
    public enum ParamKey: String {
        
        case indexPath
        
        case itemSize
        
    }
    
    public struct Handler {
        
        enum Event {
            
            case didSelect
            
            case didDeselect
            
            case didHighlight
            
            case didUnhighlight
            
        }
        
        let event: Event
        
        let block: (inout [ParamKey: Any])->Void
    }
    
    public var sections = [Section]()
    
    public required init(_ value: UICollectionView) {
        super.init(value)
        value.delegate = self
        value.dataSource = self
    }
    
    
}

extension CollectionViewBuilder: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func section(at index: Int) -> Section {
        sections[index]
    }
    
    func item(at indexPath: IndexPath) -> Item {
        sections[indexPath.section].items[indexPath.row]
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.section(at: section).items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        item(at: indexPath).cell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        item(at: indexPath).runHandlers(.didSelect, &params)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        item(at: indexPath).runHandlers(.didDeselect, &params)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        item(at: indexPath).runHandlers(.didHighlight, &params)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        item(at: indexPath).runHandlers(.didHighlight, &params)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        item(at: indexPath).itemSize()
    }
    
    public func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        item(at: indexPath).canMove()
    }
    
    public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        item(at: indexPath).shouldFocus()
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        item(at: indexPath).canSelect()
    }
    
}

#endif
