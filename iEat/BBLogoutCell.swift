//
//  BBLogoutCell.swift
//  iEat
//
//  Created by wave on 16/6/30.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBLogoutCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLbl)
        addSubview(bottomLine)
        self.selectionStyle = .None
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLbl : UILabel = {
        
        let titleLbl = UILabel()
        titleLbl.frame = CGRectMake(0, (self.height - 30) * 0.5, screenWidth, 30)
        titleLbl.textAlignment = .Center
        titleLbl.textColor = UIColor.blackColor()
        return titleLbl
    }()
    
    private lazy var bottomLine : UIView = {
        
        let bottomLine = UIView.init(frame: CGRectMake(0, self.bottom - 1, screenWidth, 1))
        bottomLine.backgroundColor = UIColor.blackColor()
        return bottomLine
    }()

}
