//
//  BBPhotoCollectionViewCell.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBPhotoCollectionViewCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(photoView)
    }
    
    lazy var photoView : UIImageView = {
        
        let photoView = UIImageView.init(frame: self.bounds)
        return photoView
    }()
}

