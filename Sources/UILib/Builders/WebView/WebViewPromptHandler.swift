//
//  WebViewPromptHandler.swift
//  
//
//  Created by lonnie on 2020/9/6.
//

import Foundation

public struct WebViewPromptHandler {
    
    public var prompt: (String, String)->Void
    
    public var completion: (String)->Void
    
}
