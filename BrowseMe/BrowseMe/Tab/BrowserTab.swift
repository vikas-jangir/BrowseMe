//
//  Tabber.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 04/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import WebKit

class BrowserTab: NSObject {
    
    public var webViewTab : WKWebView = WKWebView()
    var userActivity: NSUserActivity?
    var webViewUrl: URL?
    
    override init() {
        super.init()
        createWebView()
    }
    
    
    func createWebView() {
        self.webViewTab.frame = CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 700)
        self.webViewTab.navigationDelegate = self
        self.webViewTab.load(URLRequest(url: URL(string: "https://www.google.com")!))
    }
    
    func loadWebviewWithURL(url : NSString ) {
        self.webViewUrl = URL(string: url as String)
        self.webViewTab.load(URLRequest(url: self.webViewUrl!))
    }
    
}
