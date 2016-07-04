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
        
        oldRestaurantView.oldRestaurantCollectionView.delegate = self
        oldRestaurantView.oldRestaurantCollectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oldRestaurantView.closeBtn.addTarget(self, action: #selector(BBBaseRestaurantController.onClickCloseBtn), forControlEvents: .TouchUpInside)
        
        BBDeliveryService.getRestaurantInfo({ (result) in
            
            if result != nil{

                let oldRestaurant = Mapper<BBOldRestaurantModel>().map(result)
                self.oldRestaurantData = oldRestaurant
                
                print(self.oldRestaurantData?.result?.count)
                
                self.oldRestaurantView.oldRestaurantCollectionView.reloadData()
                
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

extension BBOldRestaurantController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.oldRestaurantData?.result?.count == nil {
            return 0
        }else{
            return (self.oldRestaurantData?.result?.count)!
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("oldRestaurantCell", forIndexPath: indexPath) as? BBOldRestaurantCell
        
        cell?.restaurantInfoItem = oldRestaurantData?.result![indexPath.row]
        
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let resultItem = oldRestaurantData?.result![indexPath.row]
        
        let detailVC = BBDetailOldRestaurantController()
        detailVC.modalTransitionStyle = .CrossDissolve
        detailVC.resultItem = resultItem
        self.wxs_presentViewController(detailVC, animationType: .Cover, completion: nil)
    }
}
