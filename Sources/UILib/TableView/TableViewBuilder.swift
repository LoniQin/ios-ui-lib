//
//  TableViewBuilder.swift
//  
//
//  Created by lonnie on 2020/9/6.
//
#if canImport(UIKit)
import UIKit
import FoundationLib
import Foundation
class TableViewBuilder: NSObject, UITableViewDelegate, UITableViewDataSource {
 
    public struct Section: Buildable {
        
        public var rows = [Row]()
        
        public var header: () -> UIView? = { nil }
        
        public var headerHeight: () -> CGFloat = { 0 }
        
        public var footer: () -> UIView? = { nil }
        
        public var footerHeight: () -> CGFloat = { 0 }
        
    }
    
    public struct Row: Buildable {
        
        public var cell: () -> UITableViewCell
        
        public var height: () -> CGFloat = { UITableView.automaticDimension }
        
        public var didSelect: ()->Void = {}
        
        public var didDeselect: ()->Void = {}
        
        public var didEndDisplay: ()->Void = {}
        
        public var didHighlight: ()->Void = {}
        
        public var didUnHighlight: ()->Void = {}
        
    }
    
    weak var tableView: UITableView?
    
    public var sections = [Section]()

    
    /// Init method
    /// - Parameter tableView: TableView
    public init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sections[section].header()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sections[section].headerHeight()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sections[section].footer()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        sections[section].footerHeight()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        row(at: indexPath).cell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        row(at: indexPath).height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        row(at: indexPath).didSelect()
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        row(at: indexPath).didEndDisplay()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        row(at: indexPath).didDeselect()
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        row(at: indexPath).didHighlight()
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        row(at: indexPath).didUnHighlight()
    }
    
}

#endif
