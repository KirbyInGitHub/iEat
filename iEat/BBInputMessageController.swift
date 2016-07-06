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
        
        inputMessageView.weChatLoginBtn.addTarget(self, action: #selector(BBInputMessageController.onClickWeChatBtnAction), forControlEvents: .TouchUpInside)
    }
    
    @objc private func onClickWeChatBtnAction(){
        
        let req = SendAuthReq()
        req.scope = "snsapi_userinfo"
        req.state = "123"
        WXApi.sendReq(req)
        
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
                self.inputMessageView.createAccountBtn.setTitleColor(UIColor.kBasis_deepOrange_Color(), forState: .Normal)
                self.inputMessageView.signupBtn.top = screenHeight
                self.isLoginStatus = false
            }else{
                
                self.inputMessageView.createAccountBtn.setTitle("Login Account", forState: .Normal)
                self.inputMessageView.createAccountBtn.setTitleColor(UIColor.kBasis_deepBlue_Color(), forState: .Normal)
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
                
                print(result)
                
                let userInfo = Mapper<BBSignupModel>().map(result)
                
                if userInfo?.userId != nil{
                    
                    BBSettings.defaultSettings.userId = userInfo?.userId
                    BBSettings.defaultSettings.qiniuToken = userInfo?.qiniu_token
                    
                    //这里判断是否是从设置里边退出登录
                    if BBSettings.defaultSettings.isSelectedSettingsLogout == true{
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }else{
                        let mainVC = BBMainController()
                        let nav = UINavigationController.init(rootViewController: mainVC)
                        self.wxs_presentViewController(nav, animationType: .SysRippleEffect, completion: nil)
                    }
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
                
                print(result)
                
                let userInfo = Mapper<BBLoginModel>().map(result)
                
                if userInfo?.userId != nil{
                    
                    BBSettings.defaultSettings.userId = userInfo?.userId
                    BBSettings.defaultSettings.qiniuToken = userInfo?.qiniu_token
                    
                    //这里判断是否是从设置里边退出登录
                    if BBSettings.defaultSettings.isSelectedSettingsLogout == true{
                    
                        self.dismissViewControllerAnimated(true, completion: nil)
                    }else{
                        let mainVC = BBMainController()
                        let nav = UINavigationController.init(rootViewController: mainVC)
                        self.wxs_presentViewController(nav, animationType: .SysRippleEffect, completion: nil)
                    }

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



