//
//  BBNewHotelController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import pop

class BBNewHotelController: BBBaseHotelController {
    
    deinit{
        print("BBNewHotelController释放了")
    }
    
    var currentSelectedCell : BBHotelCuisineCell?
    var addNewRestaurantItem : BBAddNewRestaurantItem?
    
    override func loadView() {
        super.loadView()
        
        view = newHotelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newHotelView.closeBtn.addTarget(self, action: #selector(BBBaseHotelController.onClickCloseBtn), forControlEvents: .TouchUpInside)
        newHotelView.confirmBtn.addTarget(self, action: #selector(BBNewHotelController.onClcikConfirmBtn), forControlEvents: .TouchUpInside)
        
        newHotelView.selectedSpicyLeveView.selectedConfirmBtn.addTarget(self, action: #selector(BBNewHotelController.onClickSelectedConfirmBtn), forControlEvents: .TouchUpInside)
        
        newHotelView.tableview.delegate = self
        newHotelView.tableview.dataSource = self
        
        newHotelView.pickerView.dataSource = self
        newHotelView.pickerView.delegate = self
    }
    
    @objc private func onClcikConfirmBtn(){
        print("添加成功")
        
        print(addNewRestaurantItem)
    }
    
    @objc private func onClickSelectedConfirmBtn(){
        
        BBUseAnimation.defaultUseAnimation.changeSelectedStatusViewInPositionAnimation(newHotelView.selectedSpicyLeveView)
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

extension BBNewHotelController : UITableViewDelegate,UITableViewDataSource{
    
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
            spicyLevelCell?.selectedSpicyLevelLbl.text = "中辣"
            
            return spicyLevelCell!
            
            //菜系
        }else{
            
            var hotelCuisineCell = tableView.dequeueReusableCellWithIdentifier("hotelCuisineCell") as? BBHotelCuisineCell
            
            if hotelCuisineCell == nil {
                hotelCuisineCell = BBHotelCuisineCell.init(style: .Default, reuseIdentifier: "hotelCuisineCell")
            }
            
            hotelCuisineCell?.titleLbl.text = "餐厅菜系:"
            hotelCuisineCell?.selectedHotelCuisineLbl.text = "东北菜"
            
            return hotelCuisineCell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 3 {
            
            BBUseAnimation.defaultUseAnimation.changeSelectedStatusViewInPositionAnimation(newHotelView.selectedSpicyLeveView)
        }else if indexPath.row == 4{
            
            currentSelectedCell = tableView.cellForRowAtIndexPath(indexPath) as? BBHotelCuisineCell
            BBUseAnimation.defaultUseAnimation.changePickerViewInPosition(newHotelView.pickerView)
        }
    }
    
}

extension BBNewHotelController : UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titleArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        currentSelectedCell?.selectedHotelCuisineLbl.text = titleArray[row]
    }
}




