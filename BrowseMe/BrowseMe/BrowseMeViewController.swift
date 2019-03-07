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

    
    @IBOutlet weak var searchBarTextField: UITextField!
    
    var tabManger = TabManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarCustomization()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func newTab(_ sender: Any) {
        createTabWebView(url: "https://duckduckgo.com/")
        searchBarTextField.text = ""
    }
    
    @IBAction func allTabs(_ sender: Any) {
        tabManger.selectedTab?.takeSnapShot()
        print("allTabs")
        
        
        var temp = UIView.init(frame: CGRect(x: 0, y: 0, width: 420, height: 420))
        var tempimage = tabManger.selectedTab?.snapShotImage
        var tempView = UIImageView(image: tempimage)
        tempView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        
        self.view.addSubview(tempView)
    }
    
    func createTabWebView(url : NSString) {
        tabManger.createTab(url: url)
        tabManger.addWebViewIntoVC(view: self.view)
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

