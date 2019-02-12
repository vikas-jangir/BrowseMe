//
//  ViewController.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 10/02/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit
import WebKit

class BrowseMeViewController: UIViewController  {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webViewApp: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webViewApp.navigationDelegate = self
        webViewApp.load(URLRequest(url: URL(string: "https://www.google.com")!))
        webViewApp.allowsBackForwardNavigationGestures = true
    }

    @IBAction func back(_ sender: Any) {
        if webViewApp.canGoBack {
            webViewApp.goBack();
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        webViewApp.reload()
    }
    
    @IBAction func next(_ sender: Any) {
        if webViewApp.canGoForward {
            webViewApp.goForward()
        }
    }
    
}

