//
//  BBNewRestaurantInfoCell.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBNewRestaurantInfoCell: BBBaseRestaurantCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(textField)
        addSubview(textFieldBottomLine)
    }
    
    private lazy var textField : UITextField = {
        
        let textField = UITextField()
        textField.tintColor = UIColor.redColor()
        textField.textColor = UIColor.whiteColor()
        textField.frame = CGRectMake(self.titleLbl.right + 0, self.titleLbl.top, self.width - self.titleLbl.right - 10, 30)
        textField.clearButtonMode = .WhileEditing;
        return textField
    }()
    
    private lazy var textFieldBottomLine : UIView = {
        
        let textFieldBottomLine = UIView()
        textFieldBottomLine.frame = CGRectMake(self.textField.left, self.textField.bottom, self.textField.width, 1)
        textFieldBottomLine.backgroundColor = UIColor.blackColor()
        return textFieldBottomLine
    }()
}
