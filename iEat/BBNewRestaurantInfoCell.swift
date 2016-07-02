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
        
        //给textField添加完成
        let numberToolbar = UIToolbar.init(frame: CGRectMake(0, 0, self.width, 50))
        let toolbarConfirmButton = UIBarButtonItem.init(title: "完成", style: .Done, target: self, action: #selector(BBNewRestaurantInfoCell.onClickKeyboardConfirmBtn))
        numberToolbar.items = [UIBarButtonItem.init(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil),toolbarConfirmButton]
        numberToolbar.sizeToFit()
        toolbarConfirmButton.tintColor = UIColor.blackColor()
        textField.inputAccessoryView = numberToolbar
    }
    
    @objc private func onClickKeyboardConfirmBtn(){
        textField.resignFirstResponder()
    }
    
    var textFieldStr : String?{
        get{
            return self.textField.text
        }
    }
    
    private lazy var textField : UITextField = {
        
        let textField = UITextField()
        textField.tintColor = UIColor.redColor()
        textField.textColor = UIColor.kBasis_Black_COLOR()
        textField.frame = CGRectMake(self.titleLbl.right + 0, self.titleLbl.top, self.width - self.titleLbl.right - 10, 30)
        textField.clearButtonMode = .WhileEditing;
        return textField
    }()
    
    private lazy var textFieldBottomLine : UIView = {
        
        let textFieldBottomLine = UIView()
        textFieldBottomLine.frame = CGRectMake(self.textField.left, self.textField.bottom, self.textField.width, 1)
        textFieldBottomLine.backgroundColor = UIColor.kBasis_MiddleGray_COLOR()
        return textFieldBottomLine
    }()
}
