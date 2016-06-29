//
//  BBBaseHotelController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBBaseHotelController: BBBaseController {

    override func loadView() {
        super.loadView()
        
        view = baseHotelView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func onClickCloseBtn(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private lazy var baseHotelView : BBBaseHotelView = {
        
        let baseFoodView = BBBaseHotelView.init(frame: self.view.bounds)
        return baseFoodView
    }()

}
