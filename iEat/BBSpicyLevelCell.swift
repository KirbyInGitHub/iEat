//
//  BBSpicyLevelCell.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBSpicyLevelCell: BBBaseRestaurantCell {

    //编辑辛辣程度数据
    var spicyLevelStr : String?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        selectedSpicyLevelLbl.text = spicyLevelStr == nil ? "请选择" : spicyLevelStr
        
        addSubview(selectedSpicyLevelLbl)
    }
    
    lazy var selectedSpicyLevelLbl : UILabel = {
        
        let selectedSpicyLevelLbl = UILabel()
        selectedSpicyLevelLbl.textColor = UIColor.kBasis_DeepGray_COLOR()
        selectedSpicyLevelLbl.frame = CGRectMake(self.width - 110, (self.height - 30) * 0.5, 100, 30)
        selectedSpicyLevelLbl.textAlignment = .Center
        return selectedSpicyLevelLbl
    }()
}
