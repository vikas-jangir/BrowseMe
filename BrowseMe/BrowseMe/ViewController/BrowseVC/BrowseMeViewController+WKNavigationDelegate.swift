//
//  BrowseMeViewController+WKNavigationDelegate.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 26/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import WebKit

extension BrowseMeViewController : WKNavigationDelegate {

    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        
        print("vikas jangir")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         stopProgressBar()
        tabManger.selectedTab?.takeSnapShot()
        print("vikas jangir")
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        startProgressBar()
        print("vikas jangir")
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("vikas jangir")
    }
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("vikas jangir")
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("vikas jangir")
    }
    //    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
    //         print("vikas")
    //    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        
        if Blocker.shouldBlock(url) {
            decisionHandler(.cancel)
            print("This URL is blacklisted \(url)")
            return
        }
        
        print("vikas jangir")
        decisionHandler(.allow)
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print("vikas jangir")
        decisionHandler(.allow)
    }
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("vikas jangir")
    }
    
    
    func startProgressBar() {
        progressBar.progress = 0.0
        progressBar.isHidden = false
        isprogressBarActive = false
        progressBarTimer = Timer.scheduledTimer(timeInterval: 0.01667, target: self, selector:  #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    func stopProgressBar() {
        isprogressBarActive = true
    }
    
    @objc func timerCallback() {
        if isprogressBarActive {
            if progressBar.progress >= 1 {
                progressBar.isHidden = true
                progressBarTimer.invalidate()
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
