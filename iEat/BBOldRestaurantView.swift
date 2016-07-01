//
//  BBOldRestaurantView.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBOldRestaurantView: BBBaseRestaurantView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.kBasis_Purple_Color()
        addSubview(tableview)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func showHeadTitle() -> String {
        return "查看餐厅"
    }
    
    lazy var tableview : UITableView = {
        
        let tableview = UITableView.init(frame: CGRectMake(0, self.headerLine.bottom, self.width, self.height - self.headerLine.bottom))
        tableview.backgroundColor = UIColor.kBasis_Purple_Color()
        tableview.tableFooterView = UIView()
        return tableview
    }()
}
