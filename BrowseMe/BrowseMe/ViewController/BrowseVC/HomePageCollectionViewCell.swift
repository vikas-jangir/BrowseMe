//
//  HomePageCollectionViewCell.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 27/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
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
    
}
