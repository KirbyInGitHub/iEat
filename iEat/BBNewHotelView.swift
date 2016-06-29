//
//  BBNewHotelView.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBNewHotelView: BBBaseHotelView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //饭店id  id
    //饭店名称 name
    //饭店描述 content
    //饭店地址 address
    //饭店食物辛辣程度 spicy_level
    //饭店菜系 cuisine
    
    override func showHeadTitle() -> String {
        return "Add a new hotel"
    }
    
    lazy var tableview : UITableView = {
        
        let tableview = UITableView.init(frame: CGRectMake(0, 60, self.width, self.height - 60))
        tableview.tableFooterView = UIView()
        tableview.separatorStyle = .None
        return tableview
    }()

}
