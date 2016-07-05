//
//  BBRestaurantMaidanController.swift
//  iEat
//
//  Created by wave on 16/7/5.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBRestaurantMaidanController: UIViewController {

    override func loadView() {
        super.loadView()
        
        view = self.restaurantMaidanView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "餐厅广场"
        
        let leftItem = UIBarButtonItem.init(image: UIImage.init(named: "btn-back"), style: .Done, target: self, action: #selector(BBRestaurantMaidanController.onClickGobackItem))
        leftItem.image = UIImage(named: "btn-back")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        navigationItem.leftBarButtonItem = leftItem

        BBDeliveryService.getRestaurantMaidanInfo({ (result) in
            print(result)
            
            }) { (error) in
                
                print(error)
        }
    }

    @objc private func onClickGobackItem(){
        self.navigationController?.popViewControllerAnimated(true)
    }

    private lazy var restaurantMaidanView : BBRestaurantMaidanView = {
        
        let restaurantMaidanView = BBRestaurantMaidanView.init(frame: self.view.bounds)
        return restaurantMaidanView
    }()

}
