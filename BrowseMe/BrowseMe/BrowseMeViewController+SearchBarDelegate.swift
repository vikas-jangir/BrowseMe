//
//  BrowseMeViewController+SearchBarDelegate.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 12/02/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import UIKit

extension BrowseMeViewController : UISearchBarDelegate {
    
    
    // Implement UISearchBarDelegate delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let searchString = searchBar.text!
        if searchString.count > 0 {
            let encodedSeachTerm = searchString.replacingOccurrences(of: " ", with: "+")
            let webURL = URL(string: "https://duckduckgo.com/?q=\(encodedSeachTerm)&ia=about")
            webViewApp.load(URLRequest(url: webURL!))
        }
        //        var urlString = searchBar.text
        //
        //        if (!(urlString!.hasPrefix("http://"))) && !(urlString!.hasPrefix("https://")) {
        //            urlString = "http://"+(urlString!)
        //        }
        //
        //        if let url = URL(string: urlString!) {
        //            webViewApp.load(URLRequest(url: url))
        //        } else {
        //            print("Error")
        //        }
    }
    // https://duckduckgo.com/?q=vikas&ia=about
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let searchString = searchBar.text!
        if searchString.count > 0 {
            let encodedSeachTerm = searchString.replacingOccurrences(of: " ", with: "+")
            let webURL = URL(string: "https://duckduckgo.com/?q=\(encodedSeachTerm)&ia=about")
            webViewApp.load(URLRequest(url: webURL!))
        }
        
    }
    
    
    
    
    
    
    
    
    
//    // Implement UISearchBarDelegate delegate
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//
//        var urlString = searchBar.text
//
//        if (!(urlString!.hasPrefix("http://"))) && !(urlString!.hasPrefix("https://")) {
//            urlString = "http://"+(urlString!)
//        }
//
//        if let url = URL(string: urlString!) {
//            webViewApp.load(URLRequest(url: url))
//        } else {
//            print("Error")
//        }
//    }
    
}
