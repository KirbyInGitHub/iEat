//
//  BBSelectedSpicyLevelCell.swift
//  iEat
//
//  Created by wave on 16/6/30.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBSelectedSpicyLevelCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLbl)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLbl.frame = CGRectMake(10, (self.height - 20) * 0.5, 80, 20)
    }
    
    lazy var titleLbl : UILabel = {
        
        let titleLbl = UILabel()
        titleLbl.textColor = UIColor.blackColor()
        return titleLbl
    }()
    

}
