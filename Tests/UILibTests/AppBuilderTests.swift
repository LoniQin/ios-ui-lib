//
//  AppBuilderTests.swift
//  
//
//  Created by lonnie on 2020/9/27.
//
import XCTest
@testable import UILib
final class AppBuilderTests: XCTestCase {
    @available(iOS 13.0, *)
    func testAppBuilder() {
        let app = App(window: nil)
        app.builder.rootViewController(UITabBarController().with(\.viewControllers, Array {
            UILib.ViewController().with(\.handlers, [
                .init(event: .didLoad) { viewController, _ in
                    print("Did load")
                    let label = UILabel().with(\.text, "First")
                    viewController.view.addSubview(label)
                    label.makeLayout(.equalCenter())
                    viewController.contentLabel = label
                },
                .init(event: .willAppear) { viewController ,_ in
                    let label = viewController.contentLabel as? UILabel
                    label?.text.assert.equal("First")
                }
            ]).with(\.tabBarItem, UITabBarItem(title: "First", image: nil, selectedImage: nil))
            UILib.ViewController().with(\.handlers, [
                .init(event: .didLoad) { a, _ in
                    print("Did load")
                    a.view.backgroundColor = .systemBackground
                    let label = UILabel().with(\.text, "Second")
                    a.view.addSubview(label)
                    label.makeLayout(.equalCenter())
                },
                .init(event: .didAppear) { _ ,_ in
                    print("Did Appear")
                }
            ]).with(\.tabBarItem, UITabBarItem(title: "Second", image: nil, selectedImage: nil))
        }))
        let vc = app.window?.rootViewController as? UITabBarController
        vc?.viewControllers?.count.assert.equal(2)
    }
}
