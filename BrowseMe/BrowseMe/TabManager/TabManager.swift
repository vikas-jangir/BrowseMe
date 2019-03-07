//
//  TabManager.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 06/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import UIKit

class TabManager: NSObject {
    static var allTabs : [BrowserTab] = []
    var selectedIndex : Int = -1
    
   
    
    
    func createTab(url : NSString) {
        let browserTab = BrowserTab(url: url)
        TabManager.allTabs.append(browserTab);
        selectedIndex += 1
    }
    
    func addWebViewIntoVC(view : UIView)  {
        if selectedIndex != -1 {
            removeWebViewFromVC(view: view)
            view.addSubview(TabManager.allTabs[selectedIndex].bTabWebView)
        }
    }
    
    func removeWebViewFromVC(view : UIView) {
        if selectedIndex != -1 {
            TabManager.allTabs[selectedIndex].bTabWebView.removeFromSuperview()
//            view.willRemoveSubview(TabManager.tabs[selectedTab].bTabWebView)
        }
    }
    
    func loadUrl(url : NSString ) {
        TabManager.allTabs[selectedIndex].loadUrlInWebview(url: url)
    }
    
    var count: Int {
        return TabManager.allTabs.count
    }
    
    var selectedTab: BrowserTab? {
        if !(0..<count ~= selectedIndex) {
            return nil
        }
        
        return TabManager.allTabs[selectedIndex]
    }
    
}
