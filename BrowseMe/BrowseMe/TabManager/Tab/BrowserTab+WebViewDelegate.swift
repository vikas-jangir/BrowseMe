//
//  BrowseMeViewController+WebViewDelegate.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 12/02/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import WebKit

extension BrowserTab : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        
        print("vikas")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopProgressBar()
        takeSnapShot()
        print("vikas")
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        startProgressBar()
        print("vikas")
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("vikas")
    }
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("vikas")
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("vikas")
    }
    //    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    //
    //    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        print("vikas")
        decisionHandler(.allow)
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        stopProgressBar()
        print("vikas")
    }
    
    
    
    
    
    // progress bar logic
    
    func resetProgressBarUI()  {
        
    }
    
    
    func startProgressBar() {
    progressBar.progress = 0.0
    progressBar.isHidden = false
    theBool = false
        myTimer = Timer.scheduledTimer(timeInterval: 0.01667, target: self, selector:  #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    func stopProgressBar() {
        theBool = true
    }
    
    @objc func timerCallback() {
        if theBool {
            if progressBar.progress >= 1 {
                progressBar.isHidden = true
                myTimer.invalidate()
            } else {
                progressBar.progress += 0.1
            }
        } else {
            progressBar.progress += 0.05
            if progressBar.progress >= 0.95 {
               progressBar.progress = 0.95
            }
        }
    }
    
    
    
}
