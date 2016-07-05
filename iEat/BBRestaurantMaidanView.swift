//
//  BBRestaurantMaidanView.swift
//  iEat
//
//  Created by wave on 16/7/5.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBRestaurantMaidanView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.kBasis_lightLightOrange_Color()
        addSubview(tableview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var tableview : UITableView = {
        
        let tableview = UITableView.init(frame: self.bounds)
        tableview.tableFooterView = UIView()
        tableview.backgroundColor = UIColor.kBasis_lightLightOrange_Color()
        tableview.separatorStyle = .None
        return tableview
    }()
}
