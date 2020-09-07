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
    
    public var alertHandler: WebViewAlertHandler?
    
    public var confirmHanlder: WebViewConfirmHandler?
    
    public var promptHanlder: WebViewPromptHandler?
    
    public required init(_ webView: WKWebView) {
        super.init(webView)
        self.value?.navigationDelegate = self
        self.value?.uiDelegate = self
    }
    
    public func add(_ messageHandler: WKScriptMessageHandler, name: String) {
        value?.configuration.userContentController.add(messageHandler, name: name)
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    public func webViewDidClose(_ webView: WKWebView) {
        
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        alertHandler?.completion = completionHandler
        alertHandler?.alert(message)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        confirmHanlder?.completion = completionHandler
        confirmHanlder?.confirm(message)
    }
    
    public func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        promptHanlder?.completion = completionHandler
        promptHanlder?.prompt(prompt, defaultText ?? "")
    }
    
    deinit {
        value?.configuration.userContentController.removeAllUserScripts()
    }
    
}

#endif
