//
//  BBRestaurantCuisineCell.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBRestaurantCuisineCell: BBBaseRestaurantCell {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(selectedRestaurantCuisineLbl)
    }
    
    lazy var selectedRestaurantCuisineLbl : UILabel = {
        
        let selectedRestaurantCuisineLbl = UILabel()
        selectedRestaurantCuisineLbl.textColor = UIColor.kBasis_DeepGray_COLOR()
        selectedRestaurantCuisineLbl.frame = CGRectMake(self.width - 110, (self.height - 30) * 0.5, 100, 30)
        selectedRestaurantCuisineLbl.textAlignment = .Center
        return selectedRestaurantCuisineLbl
    }()

}
