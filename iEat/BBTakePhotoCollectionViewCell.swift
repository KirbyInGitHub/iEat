//
//  BBTakePhotoCollectionViewCell.swift
//  iEat
//
//  Created by wave on 16/6/30.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBTakePhotoCollectionViewCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = UIColor.kBasis_LightGray_COLOR()
        addSubview(addPhotoIcon)
    }

    private lazy var addPhotoIcon : UIImageView = {
        
        let addPhotoIcon = UIImageView.init(frame: CGRectMake((self.width - 30) * 0.5, (self.height - 30) * 0.5, 30, 30))
        addPhotoIcon.image = UIImage.init(named: "takePhotoIcon")
        return addPhotoIcon
    }()
}
