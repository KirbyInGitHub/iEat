//
//  BBTakePhotoCell.swift
//  iEat
//
//  Created by wave on 16/6/30.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBTakePhotoCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.whiteColor()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.itemSize = CGSizeMake(150, 250)
        
        let takePhotoCollectionView = UICollectionView.init(frame: CGRectMake(0, 0, self.frame.size.width, 250), collectionViewLayout: flowLayout)
        takePhotoCollectionView.backgroundColor = UIColor.whiteColor()
        takePhotoCollectionView.registerClass(BBTakePhotoCollectionViewCell.self, forCellWithReuseIdentifier: "takePhotoCollectionViewCell")
        self.addSubview(takePhotoCollectionView)
        
        takePhotoCollectionView.delegate = self
        takePhotoCollectionView.dataSource = self
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("takePhotoCollectionViewCell", forIndexPath: indexPath) as? BBTakePhotoCollectionViewCell
        
        cell?.backgroundColor = UIColor.blueColor()
        
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName(kSelectedTakePhotoCollectionViewCellNotification, object: nil)
    }

}
