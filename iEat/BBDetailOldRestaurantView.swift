//
//  BBDetailOldRestaurantView.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBDetailOldRestaurantView: BBBaseRestaurantView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(editBtn)
        
        addSubview(backgroundView)
        addSubview(restaurantName)
        addSubview(restaurantContent)
        addSubview(restaurantAddress)
        addSubview(holderView)
        holderView.addSubview(detailImageCollectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var restaurantName : UILabel = {
        
        let restaurantName = UILabel.init(frame: CGRectMake(0, 20, self.width, 30))
        restaurantName.textAlignment = .Center
        restaurantName.textColor = UIColor.whiteColor()
        restaurantName.font = UIFont.zz_lightSystemFontToFitHeight(18)
        return restaurantName
    }()
    
    lazy var restaurantContent : UILabel = {
        let restaurantContent = UILabel.init(frame: CGRectMake(10, self.headerLine.bottom + 3, self.width - 20, 30))
        restaurantContent.textAlignment = .Center
        restaurantContent.numberOfLines = 0
        restaurantContent.textColor = UIColor.kBasis_DeepGray_COLOR()
        restaurantContent.font = UIFont.zz_lightSystemFontToFitHeight(14)
        return restaurantContent
    }()
    
    lazy var restaurantAddress : UILabel = {
        let restaurantAddress = UILabel.init(frame: CGRectMake(10, self.restaurantContent.bottom + 3, self.width - 20, 30))
        restaurantAddress.textAlignment = .Center
        restaurantAddress.numberOfLines = 0
        restaurantAddress.textColor = UIColor.kBasis_DeepGray_COLOR()
        restaurantAddress.font = UIFont.zz_lightSystemFontToFitHeight(14)
        return restaurantAddress
    }()
    
    private lazy var holderView : UIView = {
        
        let holderView = UIView.init(frame: CGRectMake(0, self.restaurantAddress.bottom , self.width, 300))
        return holderView
    }()
    
    lazy var detailImageCollectionView : UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSizeMake(self.holderView.width, self.holderView.height)
        
        let detailImageCollectionView = UICollectionView.init(frame: CGRectMake(0, 0, self.holderView.width, self.holderView.height), collectionViewLayout: flowLayout)
        detailImageCollectionView.backgroundColor = UIColor.whiteColor()
        detailImageCollectionView.registerClass(BBDetailPhotoCell.self, forCellWithReuseIdentifier: "detailImageCollectionView")
        detailImageCollectionView.pagingEnabled = true
        detailImageCollectionView.backgroundColor = UIColor.kBasis_lightLightOrange_Color()
        return detailImageCollectionView
    }()

    private lazy var backgroundView : UIView = {
        
        let backgroundView = UIView.init(frame: CGRectMake(0, self.headerLine.bottom, self.width, self.height - self.headerLine.bottom))
        backgroundView.backgroundColor = UIColor.kBasis_lightLightOrange_Color()
        return backgroundView
    }()
    
    lazy var editBtn : UIButton = {
        
        let editBtn = UIButton.init(frame: CGRectMake(self.width - 40, 20, 30, 30))
        editBtn.setImage(UIImage.init(named: "editorIcon"), forState: .Normal)
        return editBtn
    }()
}
