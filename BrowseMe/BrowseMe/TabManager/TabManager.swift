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
   private(set) var selectedIndex : Int = -1
    
   
    
    
    func createTab(url : NSString) {
        let browserTab = BrowserTab(url: url)
        TabManager.allTabs.append(browserTab);
        selectedIndex = count-1
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
    
    func tabAtIndex(index : Int) -> BrowserTab? {
        if index < count {
             return TabManager.allTabs[index]
        } else {
            return nil;
        }
       
    }
    
    func removeTab(browserTab : BrowserTab) {
        let copy = TabManager.allTabs
        
        for i in 0..<copy.count {
            if copy[i] == browserTab {
                TabManager.allTabs[i].bTabWebView.removeFromSuperview()
                TabManager.allTabs.remove(at: i)
            }
        }
        
        selectedIndex = count-1
    }
    
    func addTabtotheView(view : UIView ,index : Int)  {
        if let tab = tabAtIndex(index: index) {
            selectedIndex = index
            addWebViewIntoVC(view: view)
        }
    }
    
    
}