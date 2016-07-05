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

    var restaurantInfoItem : restaurantDataItem?{
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
        
//        let maskPath = UIBezierPath(roundedRect: containerView.bounds,byRoundingCorners: [.BottomLeft,.BottomRight],cornerRadii: CGSizeMake(10, 10))
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = containerView.bounds
//        maskLayer.path = maskPath.CGPath
//        containerView.layer.mask = maskLayer

        addSubview(containerView)
        containerView.addSubview(photoView)
        addSubview(restaurantNmaeLbl)
    }
    
    private lazy var photoView : UIImageView = {
        
        let photoView = UIImageView.init(frame: CGRectMake(0, 0,self.containerView.width , self.containerView.height - 30))
        return photoView
    }()
    
    private lazy var containerView : UIView = {
        
        let containerView = UIView.init(frame: CGRectMake(5, 5, self.width - 10, self.height))
        containerView.backgroundColor = UIColor.whiteColor()
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
        return containerView
    }()
    
    private lazy var restaurantNmaeLbl : UILabel = {
        
        let restaurantNmaeLbl = UILabel.init(frame: CGRectMake(8, self.photoView.bottom + 3, self.width, 30))
        restaurantNmaeLbl.textColor = UIColor.kBasis_DeepGray_COLOR()
        restaurantNmaeLbl.font = UIFont.zz_lightSystemFontToFitHeight(14)
        return restaurantNmaeLbl
    }()
}

