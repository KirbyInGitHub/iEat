//
//  BBDetailPhotoCell.swift
//  iEat
//
//  Created by wave on 16/7/4.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBDetailPhotoCell: UICollectionViewCell {
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(photoImageView)
    }
    
    lazy var photoImageView : UIImageView = {
        
        let photoImageView = UIImageView.init(frame: CGRectMake(10, 10, self.width - 20, self.height - 20))
        return photoImageView
    }()
}
