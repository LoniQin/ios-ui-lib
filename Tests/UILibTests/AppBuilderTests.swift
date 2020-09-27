//
//  AppBuilderTests.swift
//  
//
//  Created by lonnie on 2020/9/27.
//
import XCTest
@testable import UILib
final class AppBuilderTests: XCTestCase {
    func testAppBuilder() {
        let app = App(window: UIWindow())
        let tab = UITabBarController()
        app.builder.rootViewController(tab.set(\.viewControllers, Array<UIViewController> {
            ViewController().set(\.handlers, Array {
                ViewController.Handler(event: .didLoad) { _ ,_ in
                    print("Did load")
                }
                ViewController.Handler(event: .didAppear) { _ ,_ in
                    print("Did Appear")
                }
            }).set(\.tabBarItem, UITabBarItem(title: "First", image: UIImage(), tag: 1))
            ViewController().set(\.handlers, Array {
                ViewController.Handler(event: .didLoad) { _ ,_ in
                    print("Did load")
                }
                ViewController.Handler(event: .didAppear) { _ ,_ in
                    print("Did Appear")
                }
            }).set(\.tabBarItem, UITabBarItem(title: "Second", image: UIImage(), tag: 1))
        }))
        app.window?.rootViewController.assert.equal(tab)
    }
}
