import XCTest
@testable import UILib

final class LoadingViewTests: XCTestCase {
    func testLoadingView() {
        let style = LoadingView.Style.default
            .set(\.radius, 10)
            .set(\.ringColor, .red)
            .set(\.ringWidth, 2)
        let loadingView = LoadingView(
            style: style
        )
        loadingView.style.radius.assert.equal(10)
        loadingView.style.ringColor.assert.equal(.red)
        loadingView.style.ringWidth.assert.equal(2)
    }
}
