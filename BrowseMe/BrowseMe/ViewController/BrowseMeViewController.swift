//
//  ViewController.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 10/02/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit
import WebKit

class BrowseMeViewController: UIViewController , TabCarouselVCDelegate  {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var numberOfTabs: UILabel!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var webViewBrowseVC: UIView!
    @IBOutlet weak var settingBtn: UIButton!
    
    var tabManger = TabManager()
    var widthOfSearchBar : CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func newTab(_ sender: Any) {
        createTabWebView(url: "https://duckduckgo.com/")
        searchBarTextField.text = ""
        updateNumberOfTabsLabel()
    }
    
    @IBAction func allTabs(_ sender: Any) {
        print("allTabs")
        
    }
    
    @IBAction func settingButton(_ sender: Any) {
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        tabManger.selectedTab?.refresh()
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        tabManger.selectedTab?.goForward()
    }
    
    @IBAction func backWardButton(_ sender: Any) {
        tabManger.selectedTab?.goBack()
    }
    
    @IBAction func homeButton(_ sender: Any) {
        searchMe(urlString: "https://duckduckgo.com/", searchString: "https://duckduckgo.com/")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is TabCarouselViewController {
            let vc = segue.destination as? TabCarouselViewController
            vc?.tabManger = self.tabManger
            vc?.TabCarouselVCDelegate = self as TabCarouselVCDelegate
        }
    }
    
    func createTabWebView(url : NSString) {
        tabManger.createTab(url: url)
        tabManger.addWebViewIntoVC(view: self.webViewBrowseVC)
        updateNumberOfTabsLabel()
    }
    
    func searchMe(urlString : NSString , searchString : NSString) {
        if tabManger.selectedTab != nil {
            tabManger.selectedTab?.loadUrlInWebview(url: urlString as NSString)
        } else {
            _ = createTabWebView(url: urlString as NSString)
        }
        tabManger.selectedTab?.bTabSearchItem = searchString as NSString
        searchBarTextField.text = urlString as String;
    }
    
    // MARK:- impliment TabCarouselVCDelegate
    
    func TabCarouselVC(_ TabCarouselVC: TabCarouselViewController, closeTabWebView webView: BrowserTab) {
        tabManger.removeTab(browserTab: webView)
        updateNumberOfTabsLabel()
    }
    func TabCarouselVC(_ TabCarouselVC: TabCarouselViewController, selectedTabIndex: Int) {
        tabManger.addTabtotheView(view: self.webViewBrowseVC, index: selectedTabIndex)
    }
    
    // MARK:- SetUpVC
    func setUpVC() {
        searchBarUI()
    }
    
    func updateNumberOfTabsLabel() {
        numberOfTabs.text = String(TabManager.allTabs.count)
    }
    
}

//@objc
//protocol BrowseMeVCDelegate {
//    @objc optional  func BrowserVC(_ browserVC: BrowseMeViewController, closeTabWebView webView : BrowserTab)
//    @objc optional  func BrowserVC(_ browserVC: BrowseMeViewController, openTabWebview webView : BrowserTab)
//    @objc optional  func BrowserVC(_ browserVC: BrowseMeViewController, urlChangeinWebView webView : BrowserTab)
//}









//
//protocol TabDelegate {
//    func tab(_ tab: Tab, didAddSnackbar bar: SnackBar)
//    func tab(_ tab: Tab, didRemoveSnackbar bar: SnackBar)
//    func tab(_ tab: Tab, didSelectFindInPageForSelection selection: String)
//    @objc optional func tab(_ tab: Tab, didCreateWebView webView: WKWebView)
//    @objc optional func tab(_ tab: Tab, willDeleteWebView webView: WKWebView)
//}
