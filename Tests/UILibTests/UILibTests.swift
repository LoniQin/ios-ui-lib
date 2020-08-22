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
        XCTAssertEqual(color.toInt(), 0xffbbaa)
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
