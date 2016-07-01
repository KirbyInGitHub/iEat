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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BBTakePhotoCell.acceptTakePhotoData(_:)), name: kTakePhotoDataNotificationName, object: nil)
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
        
        takePhotoCollectionView = UICollectionView.init(frame: CGRectMake(0, 0, self.frame.size.width, 250), collectionViewLayout: flowLayout)
        takePhotoCollectionView.backgroundColor = UIColor.whiteColor()
        takePhotoCollectionView.registerClass(BBTakePhotoCollectionViewCell.self, forCellWithReuseIdentifier: "takePhotoCollectionViewCell")
        takePhotoCollectionView.registerClass(BBPhotoCollectionViewCell.self, forCellWithReuseIdentifier: "photoCollectionViewCell")
        self.addSubview(takePhotoCollectionView)
        
        takePhotoCollectionView.delegate = self
        takePhotoCollectionView.dataSource = self
    }
    
    @objc private func acceptTakePhotoData(not:NSNotification){
        
        let info = not.userInfo
        let photo = info![kTakePhotoDataKey] as? UIImage
        
        photoArray.insert(photo!, atIndex: 0)
        
        takePhotoCollectionView.reloadData()
    }
    
    private lazy var takePhotoCollectionView : UICollectionView = {
        
        let takePhotoCollectionView = UICollectionView()
        return takePhotoCollectionView
    }()
    
    private lazy var photoArray : [UIImage] = {
        
        let photoArray = [UIImage]()
        return photoArray
    }()
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count + 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0{
        
            let takePhotoCell = collectionView.dequeueReusableCellWithReuseIdentifier("takePhotoCollectionViewCell", forIndexPath: indexPath) as? BBTakePhotoCollectionViewCell
            
            return takePhotoCell!
        }else{
            
            let photoCell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCollectionViewCell", forIndexPath: indexPath) as? BBPhotoCollectionViewCell
            
            photoCell?.photoView.image = photoArray[indexPath.row - 1]
            
            return photoCell!
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName(kSelectedTakePhotoCollectionViewCellNotification, object: nil, userInfo: {[kSelectedPhotoCollectionViewCellKey:String(indexPath.row)]}())
    }

}
