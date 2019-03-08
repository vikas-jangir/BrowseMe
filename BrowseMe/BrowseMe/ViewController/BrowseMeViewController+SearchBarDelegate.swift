//
//  BrowseMeViewController+SearchBarDelegate.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 12/02/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import UIKit

extension BrowseMeViewController : UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchBarTextField.text = tabManger.selectedTab?.bTabSearchItem == nil ? "" : tabManger.selectedTab?.bTabSearchItem as! String
        self.searchBarAnimation(y_axis: view.safeAreaInsets.top+5)
        
         self.hideKeyboardWhenTappedAround()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
                let searchString = textField.text!
                if searchString.count > 0 {
                    let encodedSeachTerm = searchString.replacingOccurrences(of: " ", with: "+")
                    let webURL = URL(string: "https://duckduckgo.com/?q=\(encodedSeachTerm)&ia=about")
                    //webViewApp.load(URLRequest(url: webURL!))
                    //_ = createTabWebView(url: webURL?.absoluteString! as NSString)
                //    browser.loadWebviewWithURL(url: webURL!)
                    var urlString = "https://duckduckgo.com/?q=\(encodedSeachTerm)&ia=about"
                    
                    
                    if tabManger.selectedTab != nil {
                        tabManger.selectedTab?.loadUrlInWebview(url: urlString as NSString)
                    } else {
                        _ = createTabWebView(url: urlString as NSString)
                    }
                    tabManger.selectedTab?.bTabSearchItem = searchString as NSString
                    searchBarTextField.text = urlString;
                }

        
        
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         print("textFieldShouldReturn")
        self.dismissKeyboard()
        return true;
       
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
     //   self.searchBarAnimation(y_axis: view.safeAreaLayoutGuide.layoutFrame.size.height/2)
        return true;
    }
   
    
    
    
    // MARK: Healper methods
    
    func searchBarCustomization() {
        let padding = UIView.init(frame: CGRect(x: 0, y: 0, width: self.searchBarTextField.frame.height+5, height: self.searchBarTextField.frame.height));
        let searchIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.searchBarTextField.frame.height, height: self.searchBarTextField.frame.height))
        let searchIcon = UIImage(named: "duckduckgo")
        searchIconView.image = searchIcon
        padding.addSubview(searchIconView)
        searchBarTextField.leftView = padding

        searchBarTextField.leftViewMode = UITextField.ViewMode.always
        
        searchBarTextField.layer.cornerRadius = 15.0
        searchBarTextField.layer.borderWidth = 1.0
        searchBarTextField.layer.borderColor = UIColor.gray.cgColor
    }
    
    func searchBarAnimation(y_axis : CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            () -> Void in
            self.searchBarTextField.frame.origin.y = CGFloat(y_axis)
        }, completion: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


































    // Implement UISearchBarDelegate delegate
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//        let searchString = searchBar.text!
//        if searchString.count > 0 {
//            let encodedSeachTerm = searchString.replacingOccurrences(of: " ", with: "+")
//            let webURL = URL(string: "https://duckduckgo.com/?q=\(encodedSeachTerm)&ia=about")
//            webViewApp.load(URLRequest(url: webURL!))
//        }
//        //        var urlString = searchBar.text
//        //
//        //        if (!(urlString!.hasPrefix("http://"))) && !(urlString!.hasPrefix("https://")) {
//        //            urlString = "http://"+(urlString!)
//        //        }
//        //
//        //        if let url = URL(string: urlString!) {
//        //            webViewApp.load(URLRequest(url: url))
//        //        } else {
//        //            print("Error")
//        //        }
//    }
//    // https://duckduckgo.com/?q=vikas&ia=about
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        let searchString = searchBar.text!
//        if searchString.count > 0 {
//            let encodedSeachTerm = searchString.replacingOccurrences(of: " ", with: "+")
//            let webURL = URL(string: "https://duckduckgo.com/?q=\(encodedSeachTerm)&ia=about")
//            webViewApp.load(URLRequest(url: webURL!))
//        }
    
 //   }
    
    
    
    
    
    
    
    
    
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
    

