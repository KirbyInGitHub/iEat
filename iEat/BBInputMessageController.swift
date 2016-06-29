//
//  BBInputMessageController.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

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
        
        print(isTelNumber((inputMessageView.phoneStr)!))
        
        if isTelNumber((inputMessageView.phoneStr)!){
            
            let mainVC = BBMainController()
            let nav = UINavigationController.init(rootViewController: mainVC)
            nav.modalTransitionStyle = .FlipHorizontal
            self.presentViewController(nav, animated: true, completion: nil)
        }else{
            
            inputMessageView.showRemindLabel()
        }
    }
    
    private lazy var inputMessageView : BBInputMessageView = {
        
        let inputMessageView = BBInputMessageView.init(frame: self.view.bounds)
        return inputMessageView
    }()
}
