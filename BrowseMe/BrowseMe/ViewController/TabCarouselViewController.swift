//
//  TabCarouselViewController.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 07/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit

class TabCarouselViewController: UIViewController , TabCarouselCollectionViewCellDelegate{

    var tabManger = TabManager()
    let cellScaling : CGFloat = 0.6
    var TabCarouselVCDelegate: TabCarouselVCDelegate?
    
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
    
    // MARK:- CarouselCollectionViewCellDelegate
    func CarouselCollectionViewCell(closeTab CarouselCollectionViewCell: TabCarouselCollectionViewCell) {
         let indexPath = tabCollectionView.indexPath(for: CarouselCollectionViewCell)?.row
        TabCarouselVCDelegate?.TabCarouselVC!(self, closeTabWebView: tabManger.tabAtIndex(index: indexPath!)!)
        self.tabCollectionView.reloadData()
    }
    func CarouselCollectionViewCell(openTabWebview CarouselCollectionViewCell: TabCarouselCollectionViewCell) {
        
    }

}



extension TabCarouselViewController : UICollectionViewDataSource , UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCarouselCollectionViewCell", for: indexPath) as! TabCarouselCollectionViewCell
        cell.TabCarouselCollectionViewCellDelegate = (self as TabCarouselCollectionViewCellDelegate)
        let browseTab =  tabManger.tabAtIndex(index: indexPath.row)
        cell.tabTitial.text = browseTab?.bTabWebView.url?.host
        cell.tabImage.image = browseTab?.snapShotImage
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        TabCarouselVCDelegate?.TabCarouselVC!(self, selectedTabIndex: indexPath.row)
        dismiss(animated: true, completion: nil)
    }

}



@objc
protocol TabCarouselVCDelegate {
    @objc optional  func TabCarouselVC(_ TabCarouselVC: TabCarouselViewController, closeTabWebView webView : BrowserTab)
    @objc optional  func TabCarouselVC(_ TabCarouselVC: TabCarouselViewController , selectedTabIndex : Int)
}


//- (IBAction)actionAddToCart:(id)sender {
//    NSIndexPath *indexPath;
//    indexPath = [self.collectionView indexPathForItemAtPoint:[self.collectionView convertPoint:sender.center fromView:sender.superview]];
//    ...
//}
