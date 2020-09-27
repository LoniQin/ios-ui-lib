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
        let app = App(window: UIWindow())
        app.builder.rootViewController(UITabBarController().set(\.viewControllers, Array {
            UILib.ViewController().set(\.handlers, [
                .init(event: .didLoad) { viewController, _ in
                    print("Did load")
                    let label = UILabel().set(\.text, "First")
                    viewController.view.addSubview(label)
                    label.makeLayout(.equalCenter())
                    viewController.contentLabel = label
                },
                .init(event: .willAppear) { viewController ,_ in
                    let label = viewController.contentLabel as? UILabel
                    label?.text.assert.equal("First")
                }
            ]).set(\.tabBarItem, UITabBarItem(title: "First", image: nil, selectedImage: nil))
            UILib.ViewController().set(\.handlers, [
                .init(event: .didLoad) { a, _ in
                    print("Did load")
                    a.view.backgroundColor = .systemBackground
                    let label = UILabel().set(\.text, "Second")
                    a.view.addSubview(label)
                    label.makeLayout(.equalCenter())
                },
                .init(event: .didAppear) { _ ,_ in
                    print("Did Appear")
                }
            ]).set(\.tabBarItem, UITabBarItem(title: "Second", image: nil, selectedImage: nil))
        }))
        let vc = app.window?.rootViewController as? UITabBarController
        vc?.viewControllers?.count.assert.equal(2)
    }
}
