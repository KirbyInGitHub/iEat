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
    var addNewRestaurantItem : BBAddNewRestaurantItem?
    
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
        
        newRestaurantView.pickerView.dataSource = self
        newRestaurantView.pickerView.delegate = self
    }
    
    @objc private func onClcikConfirmBtn(){
        print("添加成功")
        
        print(addNewRestaurantItem)
    }
    
    @objc private func onClickSelectedConfirmBtn(){
        
        BBUseAnimation.defaultUseAnimation.changeSelectedStatusViewInPositionAnimation(newRestaurantView.selectedSpicyLeveView)
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
            restaurantCuisineCell?.selectedRestaurantCuisineLbl.text = "东北菜"
            
            return restaurantCuisineCell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 3 {
            
            BBUseAnimation.defaultUseAnimation.changeSelectedStatusViewInPositionAnimation(newRestaurantView.selectedSpicyLeveView)
        }else if indexPath.row == 4{
            
            currentSelectedCell = tableView.cellForRowAtIndexPath(indexPath) as? BBRestaurantCuisineCell
            BBUseAnimation.defaultUseAnimation.changePickerViewInPosition(newRestaurantView.pickerView)
        }
    }
    
}

extension BBNewRestaurantController : UIPickerViewDelegate,UIPickerViewDataSource{
    
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
        
        currentSelectedCell?.selectedRestaurantCuisineLbl.text = titleArray[row]
    }
}




