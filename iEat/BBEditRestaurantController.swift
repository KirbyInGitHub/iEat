//
//  BBEditRestaurantController.swift
//  iEat
//
//  Created by wave on 16/7/4.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBEditRestaurantController: BBBaseRestaurantInfoController {

    override func loadView() {
        super.loadView()
        
        view = editRestaurantView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editRestaurantView.closeBtn.addTarget(self, action: #selector(BBBaseRestaurantController.onClickCloseBtn), forControlEvents: .TouchUpInside)
    }

    private lazy var editRestaurantView : BBEditRestaurantView = {
        
        let editRestaurantView = BBEditRestaurantView.init(frame: self.view.bounds)
        return editRestaurantView
    }()

}
