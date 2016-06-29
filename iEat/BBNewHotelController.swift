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
        return 5
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //餐厅名称 餐厅简介 餐厅地址
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2  {
        
            var newHotelInfoCell = tableView.dequeueReusableCellWithIdentifier("newHotelInfoCell") as? BBNewHotelInfoCell
            
            if newHotelInfoCell == nil {
                newHotelInfoCell = BBNewHotelInfoCell(style: .Default,reuseIdentifier: "newHotelInfoCell")
            }
        
            newHotelInfoCell?.titleLbl.text = titleArray[indexPath.row]
            
            return newHotelInfoCell!
            
            //辛辣程度
        }else if indexPath.row == 3{
            
            var spicyLevelCell = tableView.dequeueReusableCellWithIdentifier("spicyLevelCell") as? BBSpicyLevelCell
            
            if spicyLevelCell == nil {
                spicyLevelCell = BBSpicyLevelCell.init(style: .Default, reuseIdentifier: "spicyLevelCell")
            }
            
            spicyLevelCell?.titleLbl.text = "辛辣程度:"

            return spicyLevelCell!

            //菜系
        }else{
            
            var hotelCuisineCell = tableView.dequeueReusableCellWithIdentifier("hotelCuisineCell") as? BBHotelCuisineCell
            
            if hotelCuisineCell == nil {
                hotelCuisineCell = BBHotelCuisineCell.init(style: .Default, reuseIdentifier: "hotelCuisineCell")
            }
            
            hotelCuisineCell?.titleLbl.text = "餐厅菜系:"
            
            return hotelCuisineCell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }
    
    private lazy var newHotelView : BBNewHotelView = {
        
        let addNewFoodView = BBNewHotelView.init(frame: self.view.bounds)
        return addNewFoodView
    }()

    private lazy var titleArray : [String] = {
        
        let titleArray = ["餐厅名称:","餐厅简介:","餐厅地址:"]
        return titleArray
    }()
}
