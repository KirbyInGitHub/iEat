//
//  BBInputMessageController.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import ObjectMapper

class BBInputMessageController: BBBaseController {

    override func loadView() {
        super.loadView()
        
        view = inputMessageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputMessageView.nextActionBtn.addTarget(self, action: #selector(BBInputMessageController.onClickNextBtn), forControlEvents: .TouchUpInside)
    }
    
    @objc private func onClickNextBtn(){
        
        if isTelNumber((inputMessageView.phoneStr)!){

            BBDeliveryService.getUserInfo(inputMessageView.phoneStr, success: { (result) in
                
//                    let userInfo = Mapper<BBUserInfo>().map(result)
//                    
//                    if userInfo?.phone == nil{
//                        
//                        self.inputMessageView.showRemindLabel()
//                    }else{
                
                self.inputMessageView.showRemindLabel(true)
//                        let mainVC = BBMainController()
//                        let nav = UINavigationController.init(rootViewController: mainVC)
//                        nav.modalTransitionStyle = .FlipHorizontal
//                        self.presentViewController(nav, animated: true, completion: nil)
//                    }
                
                }, failure: { (error) in
                    print(error)
            })
            
        }else{
            
            inputMessageView.showRemindLabel(false)
        }
    }
    
    private lazy var inputMessageView : BBInputMessageView = {
        
        let inputMessageView = BBInputMessageView.init(frame: self.view.bounds)
        return inputMessageView
    }()
}
