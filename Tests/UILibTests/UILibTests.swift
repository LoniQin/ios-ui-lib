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
        firstView.constraints[0].firstAttribute.assert.equal(.width)
        firstView.constraints[1].firstAttribute.assert.equal(.height)
        
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
    #endif
    

    static var allTests = [
        ("testExample", testExample),
    ]
    
}
