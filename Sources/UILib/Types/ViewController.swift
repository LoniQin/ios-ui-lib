//
//  ViewController.swift
//  
//
//  Created by lonnie on 2020/9/6.
//
#if canImport(UIKit)
import UIKit
public class ViewController: UIViewController {
    
    public struct Handler {
        
        enum Key: String {
            case animated
        }
        
        enum Event {
            
            case load
            
            case didLoad
            
            case willAppear
            
            case didAppear
            
            case willDisappear
            
            case didDisappear
            
            case willLayoutSubviews
            
            case didLayoutSubviews
            
        }
        
        var event: Event
        
        var block: (ViewController, [Key: Any])->Void
        
        init(event: Event, block: @escaping (ViewController, [Key: Any])->Void) {
            self.event = event
            self.block = block
        }
    }
    
    public var parameters: [String: Any] = [:]
    
    public var handlers: [Handler] = []
    
    public func add(_ handler: Handler) {
        handlers.append(handler)
    }
    
    public override func loadView() {
        super.loadView()
        runHandlers(event: .load)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        runHandlers(event: .didLoad)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        runHandlers(event: .willAppear, params: [.animated: animated])
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        runHandlers(event: .didAppear, params: [.animated: animated])
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        runHandlers(event: .willDisappear, params: [.animated: animated])
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        runHandlers(event: .didDisappear, params: [.animated: animated])
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        runHandlers(event: .willLayoutSubviews)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        runHandlers(event: .didLayoutSubviews)
    }
    
    func runHandlers(event: Handler.Event, params: [Handler.Key: Any] = [:]) {
        handlers.filter { $0.event == event }.forEach { [unowned self] in
            $0.block(self, params)
        }
    }
    
}
#endif
