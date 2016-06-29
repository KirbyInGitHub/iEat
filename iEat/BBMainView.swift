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
        
        backgroundColor = UIColor.kBasis_Purple_Color()
        
        addSubview(addNewFoodView)
        addSubview(addOldFoodView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var addNewFoodView : UIView = {
        
        let h = (screenHeight - 80 - 20) * 0.5
        let addNewFoodView = UIView.init(frame: CGRectMake(10, 10, self.width - 20, h))
        addNewFoodView.backgroundColor = UIColor.whiteColor()
        addNewFoodView.tag = 1
        return addNewFoodView
    }()
    
    private lazy var addOldFoodView : UIView = {
        
        let addOldFoodView = UIView.init(frame: CGRectMake(self.addNewFoodView.left, self.addNewFoodView.bottom + 10, self.addNewFoodView.width, self.addNewFoodView.height))
        addOldFoodView.backgroundColor = UIColor.whiteColor()
        addOldFoodView.tag = 2
        return addOldFoodView
    }()
    
}
