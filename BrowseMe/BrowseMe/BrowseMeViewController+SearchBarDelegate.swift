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
        
        var urlString = searchBar.text
        
        if (!(urlString!.hasPrefix("http://"))) && !(urlString!.hasPrefix("https://")) {
            urlString = "http://"+(urlString!)
        }
        
        if let url = URL(string: urlString!) {
            webViewApp.load(URLRequest(url: url))
        } else {
            print("Error")
        }
    }
    
}
