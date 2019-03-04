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

    
    var BrowserTabsArray : [BrowserTab] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func newTab(_ sender: Any) {
    
        let newtab = createTabWebView()
        BrowserTabsArray.append(newtab)
        
    }
    
    @IBAction func allTabs(_ sender: Any) {
        print("allTabs")
        
    }
    
    func createTabWebView() -> BrowserTab {
        let tab = BrowserTab()
        self.view.addSubview(tab.webViewTab)
        return tab;
    }
    
    
    
    
    
    
    
    
    //    @IBAction func back(_ sender: Any) {
//        if webViewApp.canGoBack {
//            webViewApp.goBack();
//        }
//    }
//
//    @IBAction func refresh(_ sender: Any) {
//        webViewApp.reload()
//    }
//
//    @IBAction func next(_ sender: Any) {
//        if webViewApp.canGoForward {
//            webViewApp.goForward()
//        }
//    }
    
}

