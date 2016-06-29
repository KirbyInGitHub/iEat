//
//  BBOldHotelController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBOldHotelController: BBBaseHotelController {

    deinit{
        print("BBOldHotelController释放了")
    }
    
    override func loadView() {
        super.loadView()
        
        view = oldHotelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oldHotelView.closeBtn.addTarget(self, action: #selector(BBBaseHotelController.onClickCloseBtn), forControlEvents: .TouchUpInside)
    }
    
    private lazy var oldHotelView : BBOldHotelView = {
        
        let addOldFoodView = BBOldHotelView.init(frame: self.view.bounds)
        return addOldFoodView
    }()

}
