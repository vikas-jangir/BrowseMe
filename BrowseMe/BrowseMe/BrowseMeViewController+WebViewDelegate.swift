//
//  BrowseMeViewController+WebViewDelegate.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 12/02/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import WebKit

extension BrowseMeViewController : WKNavigationDelegate {
    
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
//
//    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        
//    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
//    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
//
//    }
//    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//
//    }
//    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//
//    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("my data")
        decisionHandler(.allow)
    }
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//
//    }
//    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
//
//    }
    
}
