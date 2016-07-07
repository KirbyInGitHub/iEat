//
//  BBBaseRestaurantController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBBaseRestaurantController: UIViewController {

    override func loadView() {
        super.loadView()
        
        view = baseRestaurantView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func onClickCloseBtn(){
        
        self.transitioningDelegate = self
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private lazy var baseRestaurantView : BBBaseRestaurantView = {
        
        let baseFoodView = BBBaseRestaurantView.init(frame: self.view.bounds)
        return baseFoodView
    }()
}

