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
        app.builder.rootViewController(UITabBarController().with(\.viewControllers, Array<ViewController> {
            ViewController().with(\.handlers, Array {
                ViewController.Handler(event: .didLoad) { viewController, _ in
                    print("Did load")
                    viewController.contentLabel = UILabel().with(\.text, "First").with({ (label) in
                        viewController.view.addSubview(label)
                        label.makeLayout(.equalCenter())
                    })
                    let contentLabel: UILabel = viewController.contentLabel
                    contentLabel.text?.assert.equal("First")
                }
                ViewController.Handler(event: .willAppear) { viewController ,_ in
                    let label = viewController.contentLabel as? UILabel
                    label?.text.assert.equal("First")
                    
                }
            }).with(\.tabBarItem, UITabBarItem(title: "First", image: nil, selectedImage: nil))
            ViewController().with(\.handlers, Array {
                ViewController.Handler(event: .didLoad) { a, _ in
                    print("Did load")
                    a.view.backgroundColor = .systemBackground
                    let label = UILabel().with(\.text, "Second")
                    a.view.addSubview(label)
                    label.makeLayout(.equalCenter())
                }
                ViewController.Handler(event: .didAppear) { _ ,_ in
                    print("Did Appear")
                }
            }).with(\.tabBarItem, UITabBarItem(title: "Second", image: nil, selectedImage: nil))
        }))
        let vc = app.window?.rootViewController as? UITabBarController
        vc?.viewControllers?.count.assert.equal(2)
    }
}
