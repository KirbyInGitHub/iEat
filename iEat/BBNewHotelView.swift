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
    
    override func showHeadTitle() -> String {
        return "Add a new hotel"
    }
    
    lazy var tableview : UITableView = {
        
        let tableview = UITableView.init(frame: CGRectMake(0, self.headerLine.bottom + 5, self.width, self.height - 60))
        tableview.tableFooterView = UIView()
        tableview.separatorStyle = .None
        tableview.backgroundColor = UIColor.kBasis_Purple_Color()
        return tableview
    }()
}
