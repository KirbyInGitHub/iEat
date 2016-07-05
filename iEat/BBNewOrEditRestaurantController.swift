//
//  BBNewRestaurantController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import pop
import Qiniu
import ObjectMapper

class BBNewOrEditRestaurantController: BBBaseRestaurantController {
    
    //编辑餐厅的数据
    var resultItem : restaurantDataItem?
    
    deinit{
        print("BBNewOrEditRestaurantController释放了")
    }
    
    var currentSelectedCell : BBRestaurantCuisineCell?
    var addNewRestaurantItem = BBAddNewRestaurantItem()
    var restaurantCuisineArray = [BBRestaurantCuisineItem]()
    
    override func loadView() {
        super.loadView()
        
        view = newOrEditRestaurantView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newOrEditRestaurantView.closeBtn.addTarget(self, action: #selector(BBBaseRestaurantController.onClickCloseBtn), forControlEvents: .TouchUpInside)
        newOrEditRestaurantView.confirmBtn.addTarget(self, action: #selector(BBNewOrEditRestaurantController.onClcikConfirmBtn), forControlEvents: .TouchUpInside)
        
        newOrEditRestaurantView.selectedSpicyLeveView.selectedConfirmBtn.addTarget(self, action: #selector(BBNewOrEditRestaurantController.onClickSelectedConfirmBtn), forControlEvents: .TouchUpInside)
        
        newOrEditRestaurantView.tableview.delegate = self
        newOrEditRestaurantView.tableview.dataSource = self
        
        let path = NSBundle.mainBundle().pathForResource("restaurantCuisineList.plist", ofType: nil)
        let array = NSArray.init(contentsOfFile: path!)
        for dict in array! {
            let item = BBRestaurantCuisineItem.init(dict: dict as! [String : AnyObject])
            restaurantCuisineArray.append(item)
        }
        newOrEditRestaurantView.pickerView.dataSource = self
        newOrEditRestaurantView.pickerView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BBNewOrEditRestaurantController.acceptSelectedSpicyLevel(_:)), name: kSelectedSpicyLevelNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BBNewOrEditRestaurantController.acceptSelectedTakePhotoCell(_:)), name: kSelectedTakePhotoCollectionViewCellNotification, object: nil)
        
        
        //每次到这个界面都获取一个七牛token
        BBDeliveryService.getQiNiuToken({ (result) in
            
            //这里只是暂时使用BBSignupModel模型
            let userInfo = Mapper<BBSignupModel>().map(result)
            
            BBSettings.defaultSettings.qiniuToken = userInfo?.qiniu_token
            
        }) { (error) in
            print(error)
        }
        

    }
    
    @objc private func acceptSelectedSpicyLevel(not:NSNotification){
        
        let info = not.userInfo
        let selectedSpicyLevel = info![kSelectedSpicyLevelKey] as? String
        let spicyLevelCell = newOrEditRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 3, inSection: 0)) as? BBSpicyLevelCell
        spicyLevelCell?.selectedSpicyLevelLbl.text = spicyLevelTitleDict[selectedSpicyLevel!]
    }
    
    @objc private func acceptSelectedTakePhotoCell(not:NSNotification){
        
        let info = not.userInfo
        let selectedCell = info![kSelectedPhotoCollectionViewCellKey] as? String
        
        if selectedCell == "0" {
            
            openCamera()
        
        }else{
            
        }
    }

    private func openCamera(){
    
        let photoPicker = UIImagePickerController()
        photoPicker.sourceType = .Camera
        photoPicker.delegate = self
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    private lazy var newOrEditRestaurantView : BBNewOrEditRestaurantView = {
        
        let newOrEditRestaurantView = BBNewOrEditRestaurantView.init(frame: self.view.bounds)
        return newOrEditRestaurantView
    }()

    private lazy var spicyLevelTitleDict : [String:String] = {
        
        var spicyLevelTitleDict:Dictionary<String,String>=["0":"稍微辣","1":"一般辣","2":"很辣","3":"变态辣"];
        return spicyLevelTitleDict
    }()
    
    private lazy var spicyLevelTitleDictList : [String:String] = {
        
        var spicyLevelTitleDictList:Dictionary<String,String>=["稍微辣":"0","一般辣":"1","很辣":"2","变态辣":"3"];
        return spicyLevelTitleDictList
    }()

    private lazy var titleArray : [String] = {
        
        let titleArray = ["餐厅名称:","餐厅简介:","餐厅地址:"]
        return titleArray
    }()
    
    //七牛云图片ID数组
    private lazy var photoIdArray : [String] = {
        let photoIdArray = [String]()
        return photoIdArray
    }()
}

// MARK: - 点击事件
extension BBNewOrEditRestaurantController{
    
    @objc private func onClcikConfirmBtn(){
        
        var newRestaurantInfoCell = newOrEditRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 0, inSection: 0)) as? BBNewRestaurantInfoCell
        addNewRestaurantItem.restaurantName = newRestaurantInfoCell?.textFieldStr
        
        newRestaurantInfoCell = newOrEditRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 1, inSection: 0)) as? BBNewRestaurantInfoCell
        addNewRestaurantItem.restaurantContent = newRestaurantInfoCell?.textFieldStr
        
        newRestaurantInfoCell = newOrEditRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 2, inSection: 0)) as? BBNewRestaurantInfoCell
        addNewRestaurantItem.restaurantAddress = newRestaurantInfoCell?.textFieldStr
        
        let spicyLevelCell = newOrEditRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 3, inSection: 0)) as? BBSpicyLevelCell
        addNewRestaurantItem.restaurantSpicyLevel = spicyLevelTitleDictList[spicyLevelCell!.selectedSpicyLevelLbl.text!]
        
        let restaurantCuisineCell = newOrEditRestaurantView.tableview.cellForRowAtIndexPath(NSIndexPath.init(forItem: 4, inSection: 0)) as? BBRestaurantCuisineCell
        addNewRestaurantItem.restaurantCuisine = restaurantCuisineCell?.selectedRestaurantCuisineLbl.text
        
        //图片
        addNewRestaurantItem.restaurantImages = photoIdArray
        
        if resultItem?.restaurantId != nil {
            addNewRestaurantItem.restaurantId = resultItem?.restaurantId
        }
        
        if addNewRestaurantItem.restaurantName == "" {
            
            BBHud.defaultHud.showMessage("请务必填写饭店名称")
        }else{
            
            if BBSettings.defaultSettings.currentShowView == "newRestaurant" {
                BBDeliveryService.addNewRestaurant(addNewRestaurantItem, success: { (result) in
                    
                    if result == nil{
                        BBHud.defaultHud.showMessage("添加失败")
                    }else{
                        BBHud.defaultHud.showMessage("添加成功")
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }
                    
                }) { (error) in
                    
                    print(error)
                }
            }else if BBSettings.defaultSettings.currentShowView == "editRestaurant" {
                
                BBDeliveryService.updateRestaurantInfo(addNewRestaurantItem, success: { (result) in
                    
                    print(result)
                    
                    if result == nil{
                        BBHud.defaultHud.showMessage("更新失败")
                    }else{
                        BBHud.defaultHud.showMessage("更新成功")
                        self.presentationController?.presentingViewController.dismissViewControllerAnimated(true, completion: nil)
                    }
                    
                    }, failure: { (error) in
                        print(error)
                })
            }
        }
    }

    @objc private func onClickSelectedConfirmBtn(){
        
        newOrEditRestaurantView.maskTempView.hidden = true
        BBUseAnimation.defaultUseAnimation.changeSelectedStatusViewInPositionAnimation(newOrEditRestaurantView.selectedSpicyLeveView)
    }
}

// MARK: - UITableViewDelegate,UITableViewDataSource
extension BBNewOrEditRestaurantController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //餐厅名称 餐厅简介 餐厅地址
        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2  {
            
            var newRestaurantInfoCell = tableView.dequeueReusableCellWithIdentifier("newRestaurantInfoCell") as? BBNewRestaurantInfoCell
            
            if newRestaurantInfoCell == nil {
                newRestaurantInfoCell = BBNewRestaurantInfoCell(style: .Default,reuseIdentifier: "newRestaurantInfoCell")
            }
            
            //传递编辑餐厅的信息
            switch indexPath.row {
                
            case 0:
                newRestaurantInfoCell?.editRestaurant = resultItem?.name
                break
            
            case 1:
                newRestaurantInfoCell?.editRestaurant = resultItem?.content
                break
          
            case 2:
                newRestaurantInfoCell?.editRestaurant = resultItem?.address
                break
            
            default:
                break
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
            
            //传递辛辣程度数据
            spicyLevelCell?.spicyLevelStr = resultItem?.spicy_level
            
            return spicyLevelCell!
            
            //菜系
        }else if indexPath.row == 4{
            
            var restaurantCuisineCell = tableView.dequeueReusableCellWithIdentifier("restaurantCuisineCell") as? BBRestaurantCuisineCell
            
            if restaurantCuisineCell == nil {
                restaurantCuisineCell = BBRestaurantCuisineCell.init(style: .Default, reuseIdentifier: "restaurantCuisineCell")
            }
            
            restaurantCuisineCell?.titleLbl.text = "餐厅菜系:"
            
            restaurantCuisineCell?.restaurantCuisineStr = resultItem?.cuisine
            
            return restaurantCuisineCell!
        }else{
            
            var takePhotoCell = tableView.dequeueReusableCellWithIdentifier("takePhotoCell") as? BBTakePhotoCell
            
            if takePhotoCell == nil {
                takePhotoCell = BBTakePhotoCell.init(style: .Default, reuseIdentifier: "takePhotoCell")
            }
            
            return takePhotoCell!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return 250
        }else{
            return 54
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 3 {
            
            newOrEditRestaurantView.maskTempView.hidden = false
            BBUseAnimation.defaultUseAnimation.changeSelectedStatusViewInPositionAnimation(newOrEditRestaurantView.selectedSpicyLeveView)
            if newOrEditRestaurantView.pickerView.top != screenHeight {
               BBUseAnimation.defaultUseAnimation.changePickerViewInPosition(newOrEditRestaurantView.pickerView)
            }
        }else if indexPath.row == 4{
            
            currentSelectedCell = tableView.cellForRowAtIndexPath(indexPath) as? BBRestaurantCuisineCell
            BBUseAnimation.defaultUseAnimation.changePickerViewInPosition(newOrEditRestaurantView.pickerView)
        }
    }
}

// MARK: - UIPickerViewDelegate,UIPickerViewDataSource
extension BBNewOrEditRestaurantController : UIPickerViewDelegate,UIPickerViewDataSource{
    
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

// MARK: - UIImagePickerControllerDelegate,UINavigationControllerDelegate
extension BBNewOrEditRestaurantController : UIImagePickerControllerDelegate{
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        let resultImage = image?.imageByWidth(200)
        let resultData = UIImagePNGRepresentation(resultImage!)
        BBDeliveryService.putImageToQiNiu(resultData!) { (info, key, dict) in
            
            if dict == nil{
                BBHud.defaultHud.showMessage("添加图片失败")

            }else{
                let imageId = dict["hash"] as? String
                self.photoIdArray.insert(imageId!, atIndex: 0)
                print(self.photoIdArray)
                NSNotificationCenter.defaultCenter().postNotificationName(kTakePhotoDataNotificationName, object: nil, userInfo: {[kTakePhotoDataKey:image!]}())
            }
        }

        self.dismissViewControllerAnimated(true, completion: nil)
    }
}




