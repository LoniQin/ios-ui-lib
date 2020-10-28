import XCTest
@testable import UILib

final class LoadingViewTests: XCTestCase {
    #if !os(macOS)
    func testLoadingView() {
        let style = LoadingView.Style.default
            .with(\.radius, 10)
            .with(\.ringColor, .red)
            .with(\.ringWidth, 2)
        let loadingView = LoadingView(
            style: style
        )
        loadingView.style.radius.assert.equal(10)
        loadingView.style.ringColor.assert.equal(.red)
        loadingView.style.ringWidth.assert.equal(2)
    }
    #endif
}
