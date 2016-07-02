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
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func showHeadTitle() -> String {
        return "详细信息"
    }
}
