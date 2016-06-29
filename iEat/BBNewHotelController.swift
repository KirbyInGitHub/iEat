//
//  BBNewHotelController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBNewHotelController: BBBaseHotelController,UITableViewDataSource,UITableViewDelegate {

    override func loadView() {
        super.loadView()
        
        view = newHotelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newHotelView.closeBtn.addTarget(self, action: #selector(BBBaseHotelController.onClickCloseBtn), forControlEvents: .TouchUpInside)
        
        newHotelView.tableview.delegate = self
        newHotelView.tableview.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("NewHotelCell");
        
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: "NewHotelCell")
        }
        
        cell?.selectionStyle = .None
        
        cell?.backgroundColor = UIColor.kRandomColor()
        
        return cell!
    }
    
    
    private lazy var newHotelView : BBNewHotelView = {
        
        let addNewFoodView = BBNewHotelView.init(frame: self.view.bounds)
        return addNewFoodView
    }()

}
