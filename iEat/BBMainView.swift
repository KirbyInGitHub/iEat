//
//  BBMainView.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBMainView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.kBasis_lightOrange_Color()
        
        addSubview(addNewRestaurantView)
        addSubview(oldRestaurantView)
       
        addSubview(addBtnView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var addNewRestaurantView : UIView = {
        
        let h = (screenHeight - 80 - 20) * 0.5
        let addNewRestaurantView = UIView.init(frame: CGRectMake(10, 10, self.width - 20, h))
        addNewRestaurantView.backgroundColor = UIColor.whiteColor()
        addNewRestaurantView.tag = 1
        addNewRestaurantView.layer.cornerRadius = 10
        addNewRestaurantView.layer.masksToBounds = true
        return addNewRestaurantView
    }()
    
    private lazy var oldRestaurantView : UIView = {
        
        let oldRestaurantView = UIView.init(frame: CGRectMake(self.addNewRestaurantView.left, self.addNewRestaurantView.bottom + 10, self.addNewRestaurantView.width, self.addNewRestaurantView.height))
        oldRestaurantView.backgroundColor = UIColor.whiteColor()
        oldRestaurantView.tag = 2
        oldRestaurantView.layer.cornerRadius = 10
        oldRestaurantView.layer.masksToBounds = true
        return oldRestaurantView
    }()
 
    private lazy var addBtnView : BBAddView = {
        
        let w = 40
        let h = 40
        let addBtnView = BBAddView.init(frame:CGRectMake((screenWidth - CGFloat(w)) * 0.5, (self.addNewRestaurantView.height - CGFloat(h)) * 0.5, CGFloat(w), CGFloat(h)))
        addBtnView.layer.cornerRadius = CGFloat(w) * 0.5
        addBtnView.layer.masksToBounds = true
        return addBtnView
    }()
}
