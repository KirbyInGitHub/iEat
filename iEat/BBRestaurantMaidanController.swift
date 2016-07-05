//
//  BBRestaurantMaidanController.swift
//  iEat
//
//  Created by wave on 16/7/5.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import ObjectMapper

class BBRestaurantMaidanController: UIViewController {

    var restaurantMaidanArray = [restaurantDataItem]()
    
    override func loadView() {
        super.loadView()
        
        view = self.restaurantMaidanView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "餐厅广场"
        
        let leftItem = UIBarButtonItem.init(image: UIImage.init(named: "btn-back"), style: .Done, target: self, action: #selector(BBRestaurantMaidanController.onClickGobackItem))
        leftItem.image = UIImage(named: "btn-back")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        navigationItem.leftBarButtonItem = leftItem

        BBDeliveryService.getRestaurantMaidanInfo({ (result) in
            
            print(result)
            
            if result != nil{
                let restaurantMaidanData = Mapper<BBRestaurantDataModel>().map(result)
                self.restaurantMaidanArray = (restaurantMaidanData?.result)!
                self.restaurantMaidanView.tableview.reloadData()
            }
            
            }) { (error) in
                
                print(error)
        }
        
        restaurantMaidanView.tableview.delegate = self
        restaurantMaidanView.tableview.dataSource = self
    }

    @objc private func onClickGobackItem(){
        self.navigationController?.popViewControllerAnimated(true)
    }

    private lazy var restaurantMaidanView : BBRestaurantMaidanView = {
        
        let restaurantMaidanView = BBRestaurantMaidanView.init(frame: self.view.bounds)
        return restaurantMaidanView
    }()

}

extension BBRestaurantMaidanController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantMaidanArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("restaurantMaidanCell") as? BBRestaurantMaidanCell
        if cell == nil {
            cell = BBRestaurantMaidanCell.init(style: .Default, reuseIdentifier: "restaurantMaidanCell")
        }
        
        cell?.restaurantMaidanDataItem = self.restaurantMaidanArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = BBDetailRestaurantController()
        let item = self.restaurantMaidanArray[indexPath.row]
        detailVC.resultItem = item
        BBSettings.defaultSettings.currentClickMaidanItem = true
        self.wxs_presentViewController(detailVC, animationType: .Cover, completion: nil)
    }
}
