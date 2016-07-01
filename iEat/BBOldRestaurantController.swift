//
//  BBOldRestaurantController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import ObjectMapper

class BBOldRestaurantController: BBBaseRestaurantController {

    var oldRestaurantData : BBOldRestaurantModel?
    
    deinit{
        print("BBOldRestaurantController释放了")
    }
    
    override func loadView() {
        super.loadView()
        
        view = oldRestaurantView
        
        oldRestaurantView.tableview.delegate = self
        oldRestaurantView.tableview.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oldRestaurantView.closeBtn.addTarget(self, action: #selector(BBBaseRestaurantController.onClickCloseBtn), forControlEvents: .TouchUpInside)
        
        BBDeliveryService.getRestaurantInfo({ (result) in
            
            print(result)
            
            if result != nil{

                let oldRestaurant = Mapper<BBOldRestaurantModel>().map(result)
                self.oldRestaurantData = oldRestaurant
                
                self.oldRestaurantView.tableview.reloadData()
                
            }else{
                
            }
            
            }) { (error) in
                
                print(error)
        }
    }
    
    private lazy var oldRestaurantView : BBOldRestaurantView = {
        
        let OldRestaurantView = BBOldRestaurantView.init(frame: self.view.bounds)
        return OldRestaurantView
    }()
}

extension BBOldRestaurantController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if oldRestaurantData?.result?.count == nil {
            return 0
        }else{
            return (oldRestaurantData?.result?.count)!
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var oldRestaurantCell = tableView.dequeueReusableCellWithIdentifier("oldRestaurantCell") as? BBOldRestaurantCell
        
        if oldRestaurantCell == nil {
            oldRestaurantCell = BBOldRestaurantCell.init(style: .Default, reuseIdentifier: "oldRestaurantCell")
        }
        
        return oldRestaurantCell!
    }
}