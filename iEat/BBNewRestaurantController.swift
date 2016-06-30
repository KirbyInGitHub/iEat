//
//  BBNewRestaurantController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import pop

class BBNewRestaurantController: BBBaseRestaurantController {
    
    deinit{
        print("BBNewRestaurantController释放了")
    }
    
    var currentSelectedCell : BBRestaurantCuisineCell?
    var addNewRestaurantItem = BBAddNewRestaurantItem()
    var restaurantCuisineArray = [BBRestaurantCuisineItem]()
    
    override func loadView() {
        super.loadView()
        
        view = newRestaurantView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newRestaurantView.closeBtn.addTarget(self, action: #selector(BBBaseRestaurantController.onClickCloseBtn), forControlEvents: .TouchUpInside)
        newRestaurantView.confirmBtn.addTarget(self, action: #selector(BBNewRestaurantController.onClcikConfirmBtn), forControlEvents: .TouchUpInside)
        
        newRestaurantView.selectedSpicyLeveView.selectedConfirmBtn.addTarget(self, action: #selector(BBNewRestaurantController.onClickSelectedConfirmBtn), forControlEvents: .TouchUpInside)
        
        newRestaurantView.tableview.delegate = self
        newRestaurantView.tableview.dataSource = self
        
        let path = NSBundle.mainBundle().pathForResource("restaurantCuisineList.plist", ofType: nil)
        let array = NSArray.init(contentsOfFile: path!)
        for dict in array! {
            let item = BBRestaurantCuisineItem.init(dict: dict as! [String : AnyObject])
            restaurantCuisineArray.append(item)
        }
        newRestaurantView.pickerView.dataSource = self
        newRestaurantView.pickerView.delegate = self
    }

    private lazy var newRestaurantView : BBNewRestaurantView = {
        
        let addNewRestaurantView = BBNewRestaurantView.init(frame: self.view.bounds)
        return addNewRestaurantView
    }()

    private lazy var titleArray : [String] = {
        
        let titleArray = ["餐厅名称:","餐厅简介:","餐厅地址:"]
        return titleArray
    }()
}

// MARK: - 点击事件
extension BBNewRestaurantController{
    
    @objc private func onClcikConfirmBtn(){
        
        var newRestaurantInfoCell = newRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 0, inSection: 0)) as? BBNewRestaurantInfoCell
        addNewRestaurantItem.restaurantName = newRestaurantInfoCell?.textFieldStr
        
        newRestaurantInfoCell = newRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 1, inSection: 0)) as? BBNewRestaurantInfoCell
        addNewRestaurantItem.restaurantContent = newRestaurantInfoCell?.textFieldStr
        
        newRestaurantInfoCell = newRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 2, inSection: 0)) as? BBNewRestaurantInfoCell
        addNewRestaurantItem.restaurantAddress = newRestaurantInfoCell?.textFieldStr
        
        let spicyLevelCell = newRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 3, inSection: 0)) as? BBSpicyLevelCell
        addNewRestaurantItem.restaurantSpicyLevel = spicyLevelCell?.selectedSpicyLevelLbl.text
        
        let restaurantCuisineCell = newRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 4, inSection: 0)) as? BBRestaurantCuisineCell
        addNewRestaurantItem.restaurantCuisine = restaurantCuisineCell?.selectedRestaurantCuisineLbl.text
        
        print(addNewRestaurantItem.restaurantName)
        print(addNewRestaurantItem.restaurantContent)
        print(addNewRestaurantItem.restaurantAddress)
        print(addNewRestaurantItem.restaurantSpicyLevel)
        print(addNewRestaurantItem.restaurantCuisine)
    }

    @objc private func onClickSelectedConfirmBtn(){
        
        newRestaurantView.maskTempView.hidden = true
        BBUseAnimation.defaultUseAnimation.changeSelectedStatusViewInPositionAnimation(newRestaurantView.selectedSpicyLeveView)
    }
}

// MARK: - UITableViewDelegate,UITableViewDataSource
extension BBNewRestaurantController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //餐厅名称 餐厅简介 餐厅地址
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2  {
            
            var newRestaurantInfoCell = tableView.dequeueReusableCellWithIdentifier("newRestaurantInfoCell") as? BBNewRestaurantInfoCell
            
            if newRestaurantInfoCell == nil {
                newRestaurantInfoCell = BBNewRestaurantInfoCell(style: .Default,reuseIdentifier: "newRestaurantInfoCell")
            }
            
            newRestaurantInfoCell?.titleLbl.text = titleArray[indexPath.row]
            
            return newRestaurantInfoCell!
            
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
            
            var restaurantCuisineCell = tableView.dequeueReusableCellWithIdentifier("restaurantCuisineCell") as? BBRestaurantCuisineCell
            
            if restaurantCuisineCell == nil {
                restaurantCuisineCell = BBRestaurantCuisineCell.init(style: .Default, reuseIdentifier: "restaurantCuisineCell")
            }
            
            restaurantCuisineCell?.titleLbl.text = "餐厅菜系:"
            restaurantCuisineCell?.selectedRestaurantCuisineLbl.text = "未选择"
            
            return restaurantCuisineCell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 3 {
            
            newRestaurantView.maskTempView.hidden = false
            BBUseAnimation.defaultUseAnimation.changeSelectedStatusViewInPositionAnimation(newRestaurantView.selectedSpicyLeveView)
        }else if indexPath.row == 4{
            
            currentSelectedCell = tableView.cellForRowAtIndexPath(indexPath) as? BBRestaurantCuisineCell
            BBUseAnimation.defaultUseAnimation.changePickerViewInPosition(newRestaurantView.pickerView)
        }
    }
}

// MARK: - UIPickerViewDelegate,UIPickerViewDataSource
extension BBNewRestaurantController : UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return restaurantCuisineArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let restaurantCuisineItem = restaurantCuisineArray[row]
        return restaurantCuisineItem.name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        let restaurantCuisineItem = restaurantCuisineArray[row]
        currentSelectedCell?.selectedRestaurantCuisineLbl.text = restaurantCuisineItem.name
    }
}




