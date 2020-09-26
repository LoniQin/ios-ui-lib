//
//  WebViewBuilder.swift
//  
//
//  Created by lonnie on 2020/9/6.
//
#if canImport(WebKit)

import Foundation
import FoundationLib
import WebKit

extension WKWebView: Buildable {
    public typealias BuilderClass = WebViewBuilder
}

public class WebViewBuilder: Builder<WKWebView>, WKNavigationDelegate, WKUIDelegate {
    
    public struct Handler {
        
        public enum Key: String {
            
            case message
            
            case defaultText
            
            case navigation
            
            case completion
            
            case error
            
        }
        
        public enum Event {
            
            case didCommitNavigation
            
            case didFinishNavigation
            
            case didFailNavigation
            
            case didClose
            
            case alert
            
            case confirm
            
            case prompt
            
        }
        
        public let event: Event
        
        public let block: ([Key: Any])->Void
        
        public init(event: Event, block: @escaping ([Key: Any])->Void) {
            self.event = event
            self.block = block
        }
    }
    
    var handlers: [Handler] = []
    
    public required init(_ webView: WKWebView) {
        super.init(webView)
        self.value?.navigationDelegate = self
        self.value?.uiDelegate = self
    }
    
    func runHandlers(_ event: Handler.Event, _ params: [Handler.Key: Any] = [:]) {
        handlers.filter{ $0.event == event }.forEach { (handler) in
            handler.block(params)
        }
    }
    
    public func addHandler(_ handler: Handler) -> Self {
        handlers.append(handler)
        return self
    }
    
    public func add(_ messageHandler: WKScriptMessageHandler, name: String) -> Self {
        value?.configuration.userContentController.add(messageHandler, name: name)
        return self
    }
    
    @available(iOS 11.0, *)
    public func set(_ handler: WKURLSchemeHandler, for scheme: String) -> Self {
        value?.configuration.setURLSchemeHandler(handler, forURLScheme: scheme)
        return self
    }
    
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        runHandlers(.didCommitNavigation, [
            .navigation: navigation as Any
        ])
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        runHandlers(.didFinishNavigation, [
            .navigation: navigation as Any
        ])
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        runHandlers(.didFailNavigation, [
            .navigation: navigation as Any
        ])
    }
    
    public func webViewDidClose(_ webView: WKWebView) {
        runHandlers(.didClose)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        runHandlers(.alert, [
            .completion: completionHandler, .message: message
        ])
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        runHandlers(.confirm, [
            .completion: completionHandler, .message: message
        ])
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        runHandlers(.prompt, [
            .completion: completionHandler, .message: prompt, .defaultText: defaultText.unwrapped
        ])
    }
    
    deinit {
        value?.configuration.userContentController.removeAllUserScripts()
    }
    
}

#endif
