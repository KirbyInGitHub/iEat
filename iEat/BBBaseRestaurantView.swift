//
//  BBBaseRestaurantView.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBBaseRestaurantView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.kBasis_Purple_Color()
        addSubview(closeBtn)
        addSubview(confirmBtn)
        addSubview(headerLine)
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showHeadTitle() -> String {
        return ""
    }
    
    lazy var closeBtn : UIButton = {
        
        let closeBtn = UIButton()
        closeBtn.frame = CGRectMake(20, 20, 30, 30)
        closeBtn.setImage(UIImage.init(named: "btn_close"), forState: .Normal)
        return closeBtn
    }()
    
    lazy var confirmBtn : UIButton = {
        
        let confirmBtn = UIButton()
        confirmBtn.frame = CGRectMake(self.width - 40, 20, 30, 30)
        confirmBtn.setImage(UIImage.init(named: "icon_confirm"), forState: .Normal)
        return confirmBtn
    }()
    
    lazy var headerLine : UIView = {
        
        let headerLine = UIView()
        headerLine.frame = CGRectMake(0, 60, self.width, 0.5)
        headerLine.backgroundColor = UIColor.whiteColor()
        return headerLine
    }()
    
    private lazy var titleLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.text = self.showHeadTitle()
        titleLabel.sizeToFit()
        titleLabel.left = (self.width - titleLabel.width) * 0.5
        titleLabel.centerY = self.closeBtn.centerY
        titleLabel.textColor = UIColor.whiteColor()
        return titleLabel
    }()
}
