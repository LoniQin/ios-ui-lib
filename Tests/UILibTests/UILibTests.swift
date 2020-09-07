import XCTest
@testable import UILib

final class UILibTests: XCTestCase {
    
    func testExample() {
        
    }
    
    #if canImport(UIKit)
    
    class TableViewCell: UITableViewCell {
        
    }
    class CollectonViewCell: UICollectionViewCell {
        
    }
    
    func testUIExtension() {
        let color = UIColor(0xffbbaa)
        color.toInt().assert.equal(0xffbbaa)
    }
    
    
    func testLayoutConstraints() {
        var firstView = UIView()
        var secondView = UIView()
        firstView.addSubview(secondView)
        secondView.makeLayout(.equalToSuperView())
        firstView.constraints.count.assert.equal(4)
    
        firstView = UIView()
        secondView = UIView()
        
        firstView.addSubview(secondView)
        secondView.makeLayout(.equalTo(CGSize(width: 100, height: 200)))
        firstView.constraints.count.assert.equal(2)
        firstView.constraints[0].firstAttribute.assert.equal(.width)
        firstView.constraints[1].firstAttribute.assert.equal(.height)
        
        
        var view = UIView()
        
        firstView = UIView()
        secondView = UIView()
        
        view.addSubview(firstView)
        view.addSubview(secondView)
        firstView.makeLayout(.equalToSuperView())
        secondView.makeLayout(.equalTo(view: firstView))
        view.constraints.count.assert.equal(8)
        
        view = UIView()
        firstView = UIView()
        view.addSubviews([firstView])
        firstView.makeLayout([
            .equalLeading(view, offset: 16),
            .equalTrailing(view, offset: 16),
            .equalTop(view, offset: 16),
            .equalBottom(view, offset: 16),
        ])
        view.constraints.count.assert.equal(4)
        
        view = UIView()
        firstView = UIView()
        secondView = UIView()
        view.addSubviews([firstView, secondView])
        firstView.makeLayout([
            .equalToSuperView()
        ])
        
        secondView.makeLayout([
            .equal(.leading, firstView, .trailing, constant: 16),
            .equal(.trailing, view, .trailing, constant: -16)
        ])
        view.constraints.count.assert.equal(6)
    }
    
    func testImportTableViewCell() {
        
        "\(TableViewCell.classForCoder())".assert.equal("TableViewCell")
        
        "\(CollectonViewCell.classForCoder())".assert.equal("CollectonViewCell")
        
        let tableView = UITableView()
        tableView.register(TableViewCell.self)
        let cell: TableViewCell = tableView.dequeueCell()
        print(cell)
    }
    
    func testImportCollectionCell() {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CollectonViewCell.classForCoder())
        let cell: CollectonViewCell = collectionView.dequeueCell(.init())
        print(cell)
    }
    
    func testTableViewController() {
        let controller = TableViewController()
        XCTAssert(controller.handlers.count == 1)
    }
    
    let tableView = UITableView()
    func testTableViewBuilder() {
        tableView.builder.append(.init(cell: { UITableViewCell() }))
        tableView.builder.sections.count.assert.equal(1)
        tableView.builder.sections.first?.rows.count.assert.equal(1)
        tableView.builder.value?.assert.equal(tableView)
        tableView.reloadData()
        tableView.numberOfSections.assert.equal(1)
        tableView.cellForRow(at: .init(row: 0, section: 0)).assert.notNil()
    }
    
    #endif
    

    static var allTests = [
        ("testExample", testExample),
    ]
    
}
