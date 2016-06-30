//
//  BBSelectedSpicyLevelView.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBSelectedSpicyLevelView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
     
        addSubview(selectedConfirmBtn)
        
        addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.whiteColor()
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        selectedConfirmBtn.frame = CGRectMake(0, self.height - 50, self.width, 50)
        tableview.frame = CGRectMake(0, 0, self.width, self.height - self.selectedConfirmBtn.height)
    }
    
    lazy var selectedConfirmBtn : UIButton = {
        
        let selectedConfirmBtn = UIButton()
        selectedConfirmBtn.setTitle("确定", forState: .Normal)
        selectedConfirmBtn.backgroundColor = UIColor.kBasis_Orange_COLOR()
        return selectedConfirmBtn
    }()
    
    lazy var tableview : UITableView = {
        
        let tableview = UITableView()
        return tableview
    }()
    
    private lazy var titleArray : [String] = {
        
        let titleArray = ["稍微辣","一般辣","很辣","变态辣"]
        return titleArray
    }()
}

extension BBSelectedSpicyLevelView : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var selectedSpicyLevelCell = tableview.dequeueReusableCellWithIdentifier("cell") as? BBSelectedSpicyLevelCell
        
        if selectedSpicyLevelCell == nil {
            selectedSpicyLevelCell = BBSelectedSpicyLevelCell.init(style: .Default, reuseIdentifier: "cell")
        }
        
        selectedSpicyLevelCell?.titleLbl.text = titleArray[indexPath.row]
        
        for index in 0..<indexPath.row + 1{
            let spicyImage = UIImageView()
            spicyImage.width = 35
            spicyImage.height = 35
            spicyImage.left = 80 + CGFloat(index) * spicyImage.width + CGFloat(index) * 5
            spicyImage.top = ((selectedSpicyLevelCell?.height)! - 35) * 0.5 + 8
            spicyImage.image = UIImage.init(named: "chilliIcon")
            selectedSpicyLevelCell?.addSubview(spicyImage)
        }
        
        
        return selectedSpicyLevelCell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName(kSelectedSpicyLevelNotification, object: nil, userInfo: {[kSelectedSpicyLevelKey:String(indexPath.row)]}())
    }
    
}
