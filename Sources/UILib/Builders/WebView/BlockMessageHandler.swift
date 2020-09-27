//
//  BlockMessageHandler.swift
//  
//
//  Created by lonnie on 2020/9/6.
//
#if canImport(WebKit)

import Foundation
import WebKit

public class BlockMessageHandler: NSObject, WKScriptMessageHandler {
    
    public var block: (WKScriptMessage) -> Void
    
    public init(_ block: @escaping (WKScriptMessage) -> Void) {
        self.block = block
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        block(message)
    }
    
}
#endif
