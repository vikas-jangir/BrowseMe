//
//  TabCarouselCollectionViewCell.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 07/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit

class TabCarouselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tabImage: UIImageView!
    @IBOutlet weak var tabTitial: UILabel!
    var TabCarouselCollectionViewCellDelegate: TabCarouselCollectionViewCellDelegate?
    @IBAction func tabClose(_ sender: Any) {
        TabCarouselCollectionViewCellDelegate?.CarouselCollectionViewCell!(closeTab: self)
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
              //  TabCarouselCollectionViewCellDelegate?.CarouselCollectionViewCell!(self, openTabWebview: self)
//                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//                self.contentView.backgroundColor = UIColor.red
            }
            else
            {
//                self.transform = CGAffineTransform.identity
//                self.contentView.backgroundColor = UIColor.gray
            }
        }
    }
    
    func roundCorner() {
        self.contentView.layer.cornerRadius = 12.0
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setCellShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 3
        self.clipsToBounds = false
    }
}



@objc
protocol TabCarouselCollectionViewCellDelegate {
    @objc optional  func CarouselCollectionViewCell(closeTab CarouselCollectionViewCell: TabCarouselCollectionViewCell)
    @objc optional  func CarouselCollectionViewCell(openTabWebview CarouselCollectionViewCell: TabCarouselCollectionViewCell)
}
