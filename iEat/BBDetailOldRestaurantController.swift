//
//  BBDetailOldRestaurantController.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBDetailOldRestaurantController: BBBaseRestaurantController {

    override func loadView() {
        super.loadView()
        
        view = detailOldRestaurantView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailOldRestaurantView.closeBtn.addTarget(self, action: #selector(BBBaseRestaurantController.onClickCloseBtn), forControlEvents: .TouchUpInside)
    }
    
    private lazy var detailOldRestaurantView : BBDetailOldRestaurantView = {
        
        let detailOldRestaurantView = BBDetailOldRestaurantView.init(frame: self.view.bounds)
        return detailOldRestaurantView
    }()

}
