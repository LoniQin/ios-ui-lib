//
//  WebViewAlertHandler.swift
//  
//
//  Created by lonnie on 2020/9/6.
//

import Foundation

public struct WebViewAlertHandler {
    
    var alert: (String)->Void
    
    var completion: ()->Void
    
    public init(alert: @escaping (String)->Void, completion: @escaping ()->Void) {
        self.alert = alert
        self.completion = completion
    }
    
}
