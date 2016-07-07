//
//  BBMainController.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBMainController: UIViewController {

    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavBar()
    }
    
    //navBarStyle
    private func setNavBar(){
        title = "今天吃什么?"
        
        navigationController?.navigationBar.applyNavigationBarStyleAppearance()
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "btn_settings"), style: UIBarButtonItemStyle.Done, target: self, action: #selector(BBMainController.onClickSettingsItem))
        self.navigationItem.rightBarButtonItem = rightItem
        
        let leftItem = UIBarButtonItem(image: UIImage(named: "restaurantMaidanIcon"), style: UIBarButtonItemStyle.Done, target: self, action: #selector(BBMainController.onClickRestaurantMaidanItem))
        self.navigationItem.leftBarButtonItem = leftItem
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
    @objc private func onClickSettingsItem(){
        let settingsVC = BBSettingsController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc private func onClickRestaurantMaidanItem(){
        
        let vc = BBRestaurantMaidanController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = (touches as NSSet).anyObject()
        if touch?.view.tag == 1 || (touch?.view.isKindOfClass(BBAddView))!{
            
            let vc = BBNewOrEditRestaurantController()
            BBSettings.defaultSettings.currentShowView = "newRestaurant"
            self.wxs_presentViewController(vc, animationType: .PointSpreadPresent, completion: nil)
        }else if touch?.view.tag == 2{
            
            let vc = BBOldRestaurantController()
            self.wxs_presentViewController(vc, animationType: .PointSpreadPresent, completion: nil)
        }
    }

    private lazy var mainView: BBMainView = {
        
        let mainView = BBMainView.init(frame: self.view.bounds)
        return mainView
    }()
}
