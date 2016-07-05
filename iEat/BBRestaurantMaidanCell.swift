//
//  BBRestaurantMaidanCell.swift
//  iEat
//
//  Created by wave on 16/7/5.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBRestaurantMaidanCell: UITableViewCell {

    var restaurantMaidanDataItem : restaurantDataItem?{
        didSet{
            
            if restaurantMaidanDataItem?.images?.count == 0 {
                
                restaurantImageView.image = UIImage.init(named: "noPhoto")
            }else{
                let url = NSURL(string: (restaurantMaidanDataItem?.images![0])!)
                restaurantImageView.sd_setImageWithURL(url)
            }
            
            if restaurantMaidanDataItem?.cuisine == nil {
                restaurantName.text = restaurantMaidanDataItem?.name
            }else{
                restaurantName.text = (restaurantMaidanDataItem?.name)! + " (" + (restaurantMaidanDataItem?.cuisine)! + ")"
            }
            
            restaurantContent.text = restaurantMaidanDataItem?.content
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.kBasis_lightLightOrange_Color()
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        selectionStyle = .None
        
        addSubview(holderView)
        holderView.addSubview(restaurantImageView)
        holderView.addSubview(restaurantName)
        holderView.addSubview(restaurantContent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        holderView.frame = CGRectMake(5, 5, self.width - 10, self.height - 10)
        restaurantImageView.frame = CGRectMake(5, 5, 130, 130)
        restaurantName.frame = CGRectMake(restaurantImageView.right + 3, 5, self.width - restaurantImageView.right - 3, 30)
        restaurantContent.frame = CGRectMake(restaurantName.left, restaurantName.bottom + 3, restaurantName.width, restaurantName.height)
    }
    
    private lazy var holderView : UIView = {
    
        let holderView = UIView()
        holderView.backgroundColor = UIColor.whiteColor()
        return holderView
    }()
    
    private lazy var restaurantImageView : UIImageView = {
        
        let restaurantImageView = UIImageView()
        return restaurantImageView
    }()
    
    private lazy var restaurantName : UILabel = {
        
        let restaurantName = UILabel()
        restaurantName.textColor = UIColor.kBasis_DeepGray_COLOR()
        restaurantName.font = UIFont.zz_lightSystemFontToFitHeight(16)
        return restaurantName
    }()
    
    private lazy var restaurantContent : UILabel = {
        
        let restaurantContent = UILabel()
        restaurantContent.textColor = UIColor.kBasis_DeepGray_COLOR()
        restaurantContent.font = UIFont.zz_lightSystemFontToFitHeight(14)
        return restaurantContent
    }()
}
