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

public class WebViewBuilder: NSObject, WKNavigationDelegate, WKUIDelegate {
    
    public var webView: WKWebView?
    
    public var alertHandler: WebViewAlertHandler?
    
    public var confirmHanlder: WebViewConfirmHandler?
    
    public var promptHanlder: WebViewPromptHandler?
    
    public init(_ webView: WKWebView) {
        self.webView = webView
        super.init()
        self.webView?.navigationDelegate = self
        self.webView?.uiDelegate = self
    }
    
    public func add(_ messageHandler: WKScriptMessageHandler, name: String) {
        webView?.configuration.userContentController.add(messageHandler, name: name)
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
        webView?.configuration.userContentController.removeAllUserScripts()
    }
    
}

#endif
