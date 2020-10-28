import XCTest
@testable import UILib

final class UILibTests: XCTestCase {
    
    func testExample() {
        
    }
    
    #if !os(macOS)
    
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
    
    func testAnimationKey() {
        AnimationKey.anchorPoint.rawValue.assert.equal("anchorPoint")
        AnimationKey.backgroundColor.rawValue.assert.equal("backgroundColor")
        AnimationKey.backgroundFilters.rawValue.assert.equal("backgroundFilters")
        AnimationKey.borderColor.rawValue.assert.equal("borderColor")
        AnimationKey.borderWidth.rawValue.assert.equal("borderWidth")
        AnimationKey.bounds.rawValue.assert.equal("bounds")
        AnimationKey.compositingFilter.rawValue.assert.equal("compositingFilter")
        AnimationKey.contents.rawValue.assert.equal("contents")
        AnimationKey.contentsRect.rawValue.assert.equal("contentsRect")
        AnimationKey.cornerRadius.rawValue.assert.equal("cornerRadius")
        AnimationKey.doubleSided.rawValue.assert.equal("doubleSided")
        AnimationKey.filters.rawValue.assert.equal("filters")
        AnimationKey.frame.rawValue.assert.equal("frame")
        AnimationKey.hidden.rawValue.assert.equal("hidden")
        AnimationKey.mask.rawValue.assert.equal("mask")
        AnimationKey.masksToBounds.rawValue.assert.equal("masksToBounds")
        AnimationKey.opacity.rawValue.assert.equal("opacity")
        AnimationKey.position.rawValue.assert.equal("position")
        AnimationKey.shadowColor.rawValue.assert.equal("shadowColor")
        AnimationKey.shadowOffset.rawValue.assert.equal("shadowOffset")
        AnimationKey.shadowOpacity.rawValue.assert.equal("shadowOpacity")
        AnimationKey.shadowPath.rawValue.assert.equal("shadowPath")
        AnimationKey.shadowRadius.rawValue.assert.equal("shadowRadius")
        AnimationKey.sublayers.rawValue.assert.equal("sublayers")
        AnimationKey.sublayerTransform.rawValue.assert.equal("sublayerTransform")
        AnimationKey.zPosition.rawValue.assert.equal("zPosition")
        AnimationKey.transform.scale.x.assert.equal("transform.scale.x")
        AnimationKey.transform.scale.y.assert.equal("transform.scale.y")
        AnimationKey.transform.scale.z.assert.equal("transform.scale.z")
        AnimationKey.transform.transation.x.assert.equal("transform.translation.x")
        AnimationKey.transform.transation.y.assert.equal("transform.translation.y")
        AnimationKey.transform.transation.z.assert.equal("transform.translation.z")
        AnimationKey.transform.rotation.x.assert.equal("transform.rotation.x")
        AnimationKey.transform.rotation.y.assert.equal("transform.rotation.y")
        AnimationKey.transform.rotation.z.assert.equal("transform.rotation.z")
    }
    
    #endif
    

    static var allTests = [
        ("testExample", testExample),
    ]
    
}
