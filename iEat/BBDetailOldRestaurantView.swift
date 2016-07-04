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
        
        addSubview(backgroundView)
        addSubview(holderView)
        holderView.addSubview(detailImageCollectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func showHeadTitle() -> String {
        return "详细信息"
    }
    
    private lazy var holderView : UIView = {
        
        let holderView = UIView.init(frame: CGRectMake(0, 120, self.width, 350))
        return holderView
    }()
    
    lazy var detailImageCollectionView : UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSizeMake(self.holderView.width, self.holderView.height - 50)
        
        let detailImageCollectionView = UICollectionView.init(frame: CGRectMake(0, 50, self.holderView.width, self.holderView.height - 50), collectionViewLayout: flowLayout)
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
}
