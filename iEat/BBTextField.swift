//
//  BBTextField.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBTextField: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        
        addSubview(icon)
        addSubview(textField)
        addSubview(bottomLine)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var iconString : String?{
        didSet{
            icon.image = UIImage.init(named: iconString!)
        }
    }
    
    private lazy var icon : UIImageView = {
        
        let icon = UIImageView()
        icon.frame = CGRectMake(0, (self.height - 30) * 0.5, 30, 30)
        return icon
    }()
    
    lazy var textField : UITextField = {
        
        let textField = UITextField()
        textField.frame = CGRectMake(self.icon.right, self.icon.top, self.width - self.icon.width, 30)
        textField.backgroundColor = UIColor.clearColor()
        textField.keyboardType = .NumbersAndPunctuation;
        textField.clearButtonMode = .WhileEditing;
        return textField
    }()
    
    private lazy var bottomLine : UIView = {
        
        let bottomLine = UIView.init(frame: CGRectMake(self.textField.left, self.textField.bottom, self.textField.width, 0.5))
        bottomLine.backgroundColor = UIColor.kBasis_BottomLine_Color()
        return bottomLine
    }()
}
