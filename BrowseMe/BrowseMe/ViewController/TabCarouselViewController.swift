//
//  TabCarouselViewController.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 07/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit

class TabCarouselViewController: UIViewController {

    var tabManger = TabManager()
    let cellScaling : CGFloat = 0.6
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewController()
        
        tabCollectionView?.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func setUpViewController() {
        blurEffect()
        roundCorner()
    }
    
    func blurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.insertSubview(blurEffectView, at: 0)
    }
    
    func roundCorner() {
        self.tabCollectionView.layer.cornerRadius = 12.0
        self.tabCollectionView.layer.masksToBounds = true
        self.tabCollectionView.layer.borderWidth = 1.0
        self.tabCollectionView.layer.borderColor = UIColor.clear.cgColor
    }
    
    
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}



extension TabCarouselViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCarouselCollectionViewCell", for: indexPath) as! TabCarouselCollectionViewCell

        let browseTab =  tabManger.tabAtIndex(index: indexPath.row)
        cell.tabTitial.text = browseTab.bTabWebView.url?.host
        cell.tabImage.image = browseTab.snapShotImage
        cell.roundCorner()
        cell.setCellShadow()
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return tabManger.count
    }
}
