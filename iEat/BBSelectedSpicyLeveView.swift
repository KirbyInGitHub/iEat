//
//  BBSelectedSpicyLeveView.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBSelectedSpicyLeveView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
     
        addSubview(selectedConfirmBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.whiteColor()
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        selectedConfirmBtn.frame = CGRectMake(0, self.height - 50, self.width, 50)
    }
    
    lazy var selectedConfirmBtn : UIButton = {
        
        let selectedConfirmBtn = UIButton()
        selectedConfirmBtn.setTitle("确定", forState: .Normal)
        selectedConfirmBtn.backgroundColor = UIColor.kBasis_Orange_COLOR()
        return selectedConfirmBtn
    }()
}
