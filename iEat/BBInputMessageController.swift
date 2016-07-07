//
//  BBInputMessageController.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import ObjectMapper

class BBInputMessageController: UIViewController {

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
        
        if inputMessageView.phoneStr?.isTelNumber() == true {
            
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
    
        if inputMessageView.phoneStr?.isTelNumber() == true {
            
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

extension UINavigationBar {
    
    func applyNavigationBarStyleAppearance() {
        
        translucent = false
        barTintColor = UIColor.kBasis_lightOrange_Color()
        tintColor = UIColor.whiteColor()
        setBackgroundImage(nil, forBarMetrics: .Default)
        self.shadowImage = UIImage()
        titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        removeNavigationBarShadow()
    }
    
    func removeNavigationBarShadow(){
        
        subviews.forEach { $0.subviews.forEach { $0.isKindOfClass(UIImageView) && $0.frame.size.width == self.width ? $0.removeFromSuperview() : () }}
    }
}


extension String {
    
    func isTelNumber()->Bool
    {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluateWithObject(self) == true)
            || (regextestcm.evaluateWithObject(self)  == true)
            || (regextestct.evaluateWithObject(self) == true)
            || (regextestcu.evaluateWithObject(self) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }
}

