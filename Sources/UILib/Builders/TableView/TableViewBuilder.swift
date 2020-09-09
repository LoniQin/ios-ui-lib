//
//  TableViewBuilder.swift
//  
//
//  Created by lonnie on 2020/9/6.
//
#if canImport(UIKit)

import UIKit
import FoundationLib

extension UITableView: Buildable {
    public typealias BuilderClass = TableViewBuilder
    
}
public class TableViewBuilder: Builder<UITableView>, UITableViewDelegate, UITableViewDataSource {
 
    public struct Section {
        
        public var rows = [Row]()
        
        public var header: () -> UIView? = { nil }
        
        public var headerHeight: () -> CGFloat = { 0 }
        
        public var footer: () -> UIView? = { nil }
        
        public var footerHeight: () -> CGFloat = { 0 }
        
    }
    
    public struct Row {
        
        public var cell: () -> UITableViewCell
        
        public var height: () -> CGFloat = { UITableView.automaticDimension }
        
        public var handlers: [Handler] = []

        func runHandlers(_ event: Handler.Event, _ params: inout [ParamKey: Any]) {
            handlers.filter({$0.event == event}).forEach {
                $0.block(&params)
            }
        }
        
    }
    
    enum ParamKey: String {
        
        case indexPath
        
    }
    
    public struct Handler {
        
        enum Event {
            
            case didSelect
            
            case didDeselect
            
            case didEndDisplay
            
            case didHighlight
            
            case didUnhighlight
            
        }
        
        let event: Event
        
        let block: (inout [ParamKey: Any])->Void
    }
    
    public var sections = [Section]()

    
    /// Init method
    /// - Parameter tableView: TableView
    public required init(_ tableView: UITableView) {
        super.init(tableView)
        self.value?.delegate = self
        self.value?.dataSource = self
    }
    
    /// Append section
    /// - Parameter section: TableView Section
    public func append(_ section: Section) {
        sections.append(section)
    }
    
    
    /// Append row
    /// - Parameter row: TableView Sectoin
    public func append(_ row: Row) {
        if sections.isEmpty {
            sections.append(Section())
        }
        sections[sections.count - 1].rows.append(row)
    }
    
    func row(at indexPath: IndexPath) -> Row {
        sections[indexPath.section].rows[indexPath.row]
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sections[section].header()
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sections[section].headerHeight()
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sections[section].footer()
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        sections[section].footerHeight()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        row(at: indexPath).cell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        row(at: indexPath).height()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        row(at: indexPath).runHandlers(.didSelect, &params)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        row(at: indexPath).runHandlers(.didEndDisplay, &params)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        row(at: indexPath).runHandlers(.didDeselect, &params)
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        row(at: indexPath).runHandlers(.didHighlight, &params)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        var params: [ParamKey: Any] = [.indexPath: indexPath]
        row(at: indexPath).runHandlers(.didUnhighlight, &params)
    }
    
}

#endif
