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

    var isLoginStatus : Bool?
    
    override func loadView() {
        super.loadView()
        
        view = inputMessageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputMessageView.signupBtn.addTarget(self, action: #selector(BBInputMessageController.onClickSignupAction), forControlEvents: .TouchUpInside)
        
        inputMessageView.loginBtn.addTarget(self, action: #selector(BBInputMessageController.onClickLoginAction), forControlEvents: .TouchUpInside)
        
        inputMessageView.createAccountBtn.addTarget(self, action: #selector(BBInputMessageController.onClickCreateAccountAction), forControlEvents: .TouchUpInside)
    }
    
    private lazy var inputMessageView : BBInputMessageView = {
        
        let inputMessageView = BBInputMessageView.init(frame: self.view.bounds)
        return inputMessageView
    }()
    
}

//点击创建账户
extension BBInputMessageController{

    @objc private func onClickCreateAccountAction(){
        
        UIView.animateWithDuration(0.8, delay: 0, options: .CurveEaseOut, animations: {
            
            if self.isLoginStatus == true{
                
                self.inputMessageView.createAccountBtn.setTitle("Create Account", forState: .Normal)
                self.inputMessageView.signupBtn.top = screenHeight
                self.isLoginStatus = false
            }else{
                
                self.inputMessageView.createAccountBtn.setTitle("Login Account", forState: .Normal)
                self.inputMessageView.signupBtn.top = screenHeight - 50
                self.isLoginStatus = true
            }
        }, completion: nil)
    }

}

//注册
extension BBInputMessageController{
    
    @objc private func onClickSignupAction(){
        
        if isTelNumber((inputMessageView.phoneStr)!){
            
            BBDeliveryService.userSignup(inputMessageView.phoneStr, userPassword: inputMessageView.passwordStr, success: { (result) in
                
                let userInfo = Mapper<BBSignupModel>().map(result)
                
                if userInfo?.name != nil{
                    
                    let mainVC = BBMainController()
                    let nav = UINavigationController.init(rootViewController: mainVC)
                    nav.modalTransitionStyle = .FlipHorizontal
                    self.presentViewController(nav, animated: true, completion: nil)
                }
            
                }, failure: { (error) in
                    
                    print(error)
            })
            
        }else{
            
            inputMessageView.showRemindLabel(false)
        }
    }
}

//登录
extension BBInputMessageController{
    
    @objc private func onClickLoginAction(){
    
        if isTelNumber((inputMessageView.phoneStr)!){
            
            BBDeliveryService.userLogin(inputMessageView.phoneStr, userPassword: inputMessageView.passwordStr, success: { (result) in
                
                let userInfo = Mapper<BBLoginModel>().map(result)
                
                if userInfo?.name != nil{
                    
                    let mainVC = BBMainController()
                    let nav = UINavigationController.init(rootViewController: mainVC)
                    nav.modalTransitionStyle = .FlipHorizontal
                    self.presentViewController(nav, animated: true, completion: nil)
                }else{
                    
                    self.inputMessageView.showRemindLabel(true)
                }
                
            }) { (error) in
                
                print(error)
            }
            
        }else{
            inputMessageView.showRemindLabel(false)
        }
    }
}



