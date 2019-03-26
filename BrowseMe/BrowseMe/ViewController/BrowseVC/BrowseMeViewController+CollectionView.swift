//
//  BrowseMeViewController+CollectionView.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 27/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import Foundation
import UIKit

extension BrowseMeViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePageDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCollectionViewCell", for: indexPath) as! HomePageCollectionViewCell
        
        let dataDict = homePageDataArray[indexPath.row]
        
        let name = dataDict["name"]! as NSString
        let image = dataDict["image"]! as NSString
        
        let searchIcon = UIImage(named: image as String)
        cell.cellImageView.image = searchIcon
        cell.cellLabel.text = name as String
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataDict = homePageDataArray[indexPath.row]
        
        let urlString = dataDict["url"]! as NSString
        
        _ = createTabWebView(url: urlString as NSString)
    tabManger.selectedTab?.bTabSearchItem = urlString as NSString
    searchBarTextField.text = urlString as String;
        
    }
    
}
