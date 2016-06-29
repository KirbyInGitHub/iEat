//
//  BBHotelCuisineCell.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBHotelCuisineCell: BBBaseHotelCell {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(selectedHotelCuisineLbl)
    }
    
    lazy var selectedHotelCuisineLbl : UILabel = {
        
        let selectedHotelCuisineLbl = UILabel()
        selectedHotelCuisineLbl.textColor = UIColor.whiteColor()
        selectedHotelCuisineLbl.frame = CGRectMake(self.width - 110, (self.height - 30) * 0.5, 100, 30)
        selectedHotelCuisineLbl.textAlignment = .Center
        return selectedHotelCuisineLbl
    }()

}
