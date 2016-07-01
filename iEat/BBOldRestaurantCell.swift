//
//  BBOldRestaurantCell.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import SDWebImage

class BBOldRestaurantCell: UICollectionViewCell {

    var restaurantInfoItem : Result?{
        didSet{
            
            restaurantNmaeLbl.text = restaurantInfoItem?.name
            
            if restaurantInfoItem?.images?.count != 0 {
                
                photoView.sd_setImageWithURL(NSURL(string: (restaurantInfoItem?.images![0])!))
            }else{
                
                photoView.image = UIImage.init(named: "noPhoto")
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
     
        addSubview(photoView)
        addSubview(containerView)
        addSubview(restaurantNmaeLbl)
    }
    
    private lazy var photoView : UIImageView = {
        
        let photoView = UIImageView.init(frame: CGRectMake(0, 5, self.width, self.height - 5))
        return photoView
    }()
    
    private lazy var containerView : UIView = {
        
        let containerView = UIView.init(frame: CGRectMake(self.photoView.left, self.height * 0.8, self.photoView.width, self.height * 0.2))
        containerView.backgroundColor = UIColor.kBasis_LightGray_COLOR()
        containerView.alpha = 0.7
        return containerView
    }()
    
    private lazy var restaurantNmaeLbl : UILabel = {
        
        let restaurantNmaeLbl = UILabel.init(frame: CGRectMake(8, self.containerView.top, self.width, 30))
        restaurantNmaeLbl.textColor = UIColor.kBasis_Orange_COLOR()
        restaurantNmaeLbl.font = UIFont.zz_lightSystemFontToFitHeight(14)
        return restaurantNmaeLbl
    }()
}

