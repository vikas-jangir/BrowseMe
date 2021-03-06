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
    
    public var bTabWebView : WKWebView = WKWebView()
    var bTabuserActivity: NSUserActivity?
    var bTabWebViewUrl: URL?
    var bTabSearchItem : NSString?
    
    var snapShotImage : UIImage?
    var error : NSError?

    
    init(url : NSString , browseMeVCDelegate : BrowseMeViewController) {
        super.init()
        createWebviewWithUrl(url: url , browseMeVCDelegate : browseMeVCDelegate )
    }
    
    
    func createWebviewWithUrl(url : NSString , browseMeVCDelegate : BrowseMeViewController) {

        
        bTabWebViewUrl = URL(string: url as String)
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsPictureInPictureMediaPlayback = true
        
        bTabWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), configuration: webConfiguration)
        bTabWebView.navigationDelegate = browseMeVCDelegate as WKNavigationDelegate
        
        bTabWebView.allowsBackForwardNavigationGestures = true

        bTabWebView.load(URLRequest(url: bTabWebViewUrl!))

    }
    
    func loadUrlInWebview(url : NSString ) {
        bTabWebViewUrl = URL(string: url as String)
        bTabWebView.load(URLRequest(url: bTabWebViewUrl!))
    }
    
    // MARK: Navigation function
    func goBack() {
        if bTabWebView.canGoBack {
            bTabWebView.goBack()
        }
    }
    
    func goForward() {
        if bTabWebView.canGoForward {
            bTabWebView.goForward()
        }
    }
    
    func refresh() {
        bTabWebView.reload()
    }
    
    func takeSnapShot() {
        let snapshotConfiguration = WKSnapshotConfiguration()
        snapshotConfiguration.rect = CGRect(x: bTabWebView.frame.origin.x, y:  bTabWebView.frame.origin.y, width:  bTabWebView.frame.size.width, height:  bTabWebView.frame.size.height)
        
        bTabWebView.takeSnapshot(with: snapshotConfiguration) { (image, error) in
            
            if let image = image,error == nil {
                self.snapShotImage = image
            } else {
                return
            }
        }
    }

}
