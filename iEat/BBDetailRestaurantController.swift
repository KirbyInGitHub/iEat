//
//  BBDetailOldRestaurantController.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBDetailRestaurantController: BBBaseRestaurantController {

    var resultItem : Result?
    
    override func loadView() {
        super.loadView()
        
        view = detailOldRestaurantView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailOldRestaurantView.closeBtn.addTarget(self, action: #selector(BBBaseRestaurantController.onClickCloseBtn), forControlEvents: .TouchUpInside)
        detailOldRestaurantView.editBtn.addTarget(self, action: #selector(BBDetailRestaurantController.onClickEditBtnAction), forControlEvents: .TouchUpInside)
        
        detailOldRestaurantView.detailImageCollectionView.delegate = self
        detailOldRestaurantView.detailImageCollectionView.dataSource = self
        
        if resultItem!.cuisine == nil {
            detailOldRestaurantView.restaurantName.text = resultItem!.name!
        }else{
            let str = resultItem!.name! + " (" + resultItem!.cuisine! + ")"
            detailOldRestaurantView.restaurantName.text = str
        }
        
        detailOldRestaurantView.restaurantAddress.text = resultItem?.address == nil ? "" : resultItem?.address
        detailOldRestaurantView.restaurantContent.text = resultItem?.content == nil ? "" : resultItem?.content
    }
    
    @objc private func onClickEditBtnAction(){
        
        let vc = BBNewOrEditRestaurantController()
        BBSettings.defaultSettings.currentShowView = "editRestaurant"
        vc.resultItem = resultItem
        self.wxs_presentViewController(vc, animationType: .Cover, completion: nil)
    }
    
    private lazy var detailOldRestaurantView : BBDetailRestaurantView = {
        
        let detailOldRestaurantView = BBDetailRestaurantView.init(frame: self.view.bounds)
        return detailOldRestaurantView
    }()
}

extension BBDetailRestaurantController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (resultItem?.images?.count)! == 0 ? 1 : (resultItem?.images?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("detailImageCollectionView", forIndexPath: indexPath) as? BBDetailPhotoCell
        
        if resultItem?.images?.count == 0 {
             cell?.photoImageView.image = UIImage.init(named: "noPhoto")
        }else{
            let url = NSURL(string: resultItem!.images![indexPath.row])
            cell?.photoImageView.sd_setImageWithURL(url)
        }
        
        return cell!
    }
}