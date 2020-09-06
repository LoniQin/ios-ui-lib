//
//  TableViewController.swift
//  
//
//  Created by lonnie on 2020/9/7.
//
#if canImport(UIKit)

import Foundation
import UIKit

public class TableViewController: ViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    lazy var bulder = TableViewBuilder(tableView)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        add(.init(event: .didLoad, block: { [weak self] (viewController, params) in
            guard let self = self else { return }
            viewController.view.addSubview(self.tableView)
            self.tableView.builder.build {
                $0.makeLayout(.equalToSuperView())
            }
        }))
    }
}
#endif
