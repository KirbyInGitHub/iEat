//
//  BBOldRestaurantController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBOldRestaurantController: BBBaseRestaurantController {

    deinit{
        print("BBOldRestaurantController释放了")
    }
    
    override func loadView() {
        super.loadView()
        
        view = oldRestaurantView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oldRestaurantView.closeBtn.addTarget(self, action: #selector(BBBaseRestaurantController.onClickCloseBtn), forControlEvents: .TouchUpInside)
    }
    
    private lazy var oldRestaurantView : BBOldRestaurantView = {
        
        let OldRestaurantView = BBOldRestaurantView.init(frame: self.view.bounds)
        return OldRestaurantView
    }()

}
