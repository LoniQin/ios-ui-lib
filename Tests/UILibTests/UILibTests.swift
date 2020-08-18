import XCTest
@testable import UILib

final class UILibTests: XCTestCase {
    
    func testExample() {
        
    }
    
    func testUIExtension() {
        let color = UIColor(0xffbbaa)
        XCTAssertEqual(color.toInt(), 0xffbbaa)
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
