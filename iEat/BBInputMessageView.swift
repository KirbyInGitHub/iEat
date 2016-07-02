//
//  BBInputMessageView.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import AFViewShaker

class BBInputMessageView: UIView {

    var userPhoneOriginalPoint : CGPoint?
    var userPasswordOriginalPoint : CGPoint?
    
    var phoneStr : String?{
        get{
            return userPhone.textField.text
        }
    }
    
    var passwordStr : String?{
        get{
            return userPassword.textField.text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backgroundImage)
        backgroundImage.addSubview(userPhone)
        backgroundImage.addSubview(userPassword)
        backgroundImage.addSubview(loginBtn)
        backgroundImage.addSubview(signupBtn)
        backgroundImage.addSubview(remindLabel)
        
        backgroundImage.addSubview(createAccountBtn)
        
        //代码view
        backgroundImage.addSubview(iOSMan)
        backgroundImage.addSubview(pythonMan)
        
        let time: NSTimeInterval = 0.5
        let delay = dispatch_time(DISPATCH_TIME_NOW,Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) {
            
            self.updateFrame()
        }
        
        //监听键盘动态
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BBInputMessageView.keyboardWasShown(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BBInputMessageView.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    //showKeyboard
    @objc private func keyboardWasShown(aNotification:NSNotification){

        let info = aNotification.userInfo
        let kbSize = info![UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size
        
        let kbTop = self.height - (kbSize?.height)!
        userPassword.bottom = kbTop - 15
        userPhone.bottom = userPassword.top - 5
        remindLabel.bottom = userPhone.top - 5
    }
    
    //hiddenKeyboard
    @objc private func keyboardWillBeHidden(aNotification:NSNotification){
        userPhone.origin = userPhoneOriginalPoint!
        userPassword.origin = userPasswordOriginalPoint!
        remindLabel.bottom = userPhone.top - 5
    }
    
    private func updateFrame(){
    
        UIView.animateWithDuration(2.0) {
            
            self.backgroundImage.alpha = 1
            self.userPhone.alpha = 1
            self.userPhone.left = (self.width - self.userPhone.width) * 0.5
            self.userPassword.alpha = 1
            self.userPassword.left = self.userPhone.left
            self.iOSMan.left = (self.width - self.iOSMan.width) * 0.5
            self.pythonMan.left = (self.width - self.pythonMan.width) * 0.5
        }
        
        userPasswordOriginalPoint = userPassword.origin
        userPhoneOriginalPoint = userPhone.origin
    }
    
    func showRemindLabel(isPasswordMistake : Bool){
        
        remindLabel.hidden = false
        
        if isPasswordMistake {
            let viewShaker = AFViewShaker.init(view: userPassword)
            viewShaker.shake()
        }else{
            let viewShaker = AFViewShaker.init(view: userPhone)
            viewShaker.shake()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        userPhone.textField.resignFirstResponder()
        userPassword.textField.resignFirstResponder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //用户电话cell
    private lazy var userPhone : BBTextField = {
        
        let userPhone = BBTextField.init(frame: CGRectMake(self.width - 210, self.height * 0.6, 200, 30))
        userPhone.textField.placeholder = "Phone"
        userPhone.iconString = "phoneIcon"
        userPhone.alpha = 0
        return userPhone
    }()
    
    //用户密码cell
    private lazy var userPassword : BBTextField = {
        
        let userPassword = BBTextField.init(frame: CGRectMake(0, self.userPhone.bottom + 5, self.userPhone.width, self.userPhone.height))
        userPassword.textField.placeholder = "Password"
        userPassword.iconString = "passwordIcon"
        userPassword.alpha = 0
        return userPassword
    }()
    
    //输入错时hidden为false
    private lazy var remindLabel : UILabel = {
        
        let remindLabel = UILabel()
        remindLabel.text = "Please check the phone number"
        remindLabel.sizeToFit()
        remindLabel.left = (self.width - remindLabel.width) * 0.5
        remindLabel.top = self.userPhone.top - remindLabel.height - 5
        remindLabel.textColor = UIColor.redColor()
        remindLabel.hidden = true
        return remindLabel
    }()

    //背景imageView
    private lazy var backgroundImage : UIImageView = {
        
        let backgroundImage = UIImageView.init(frame: self.bounds)
        backgroundImage.backgroundColor = UIColor.kBasis_lightLightOrange_Color()
        backgroundImage.alpha = 0
        backgroundImage.userInteractionEnabled = true
        return backgroundImage
    }()
    
    //创建账户
    lazy var createAccountBtn : UIButton = {
        
        let createAccountBtn = UIButton()
        createAccountBtn.setTitle("Create Account", forState: .Normal)
        createAccountBtn.setTitleColor(UIColor.kBasis_deepOrange_Color(), forState: .Normal)
        createAccountBtn.sizeToFit()
        createAccountBtn.left = (self.width - createAccountBtn.width) * 0.5
        createAccountBtn.top = self.userPassword.bottom + 5
        return createAccountBtn
    }()
    
    //登录按钮
    lazy var loginBtn : UIButton = {
        
        let loginBtn = UIButton.init(frame: CGRectMake(0, self.height - 50, self.width, 50))
        loginBtn.setTitle("Login", forState:.Normal)
        loginBtn.backgroundColor = UIColor.kBasis_deepBlue_Color()
        return loginBtn
    }()
    
    //注册按钮
    lazy var signupBtn : UIButton = {
        
        let signupBtn = UIButton.init(frame: CGRectMake(0, self.height, self.width, 50))
        signupBtn.setTitle("Signup", forState:.Normal)
        signupBtn.backgroundColor = UIColor.kBasis_deepOrange_Color()
        return signupBtn
    }()
    
    //iOS攻城狮:
    private lazy var iOSMan : UILabel = {
        
        let iOSMan = UILabel()
        iOSMan.text = "let iOSMan = Wave"
        iOSMan.sizeToFit()
        iOSMan.left = 0
        iOSMan.top = self.pythonMan.bottom + 5
        
        let str = NSMutableAttributedString.init(string: iOSMan.text!)
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.kBasis_Let_Color(), range: NSMakeRange(0, 3))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(4, 8))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.kBasis_deepBlue_Color(), range: NSMakeRange(12,5))
        //        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:20.0] range:NSMakeRange(10, 6)];
        iOSMan.attributedText = str
        
        return iOSMan
    }()
    
    //python攻城狮:
    private lazy var pythonMan : UILabel = {
        
        let pythonMan = UILabel()
        pythonMan.text = "let pythonMan = Zack"
        pythonMan.sizeToFit()
        pythonMan.left = self.width - pythonMan.width
        pythonMan.top = self.height * 0.2
        
        let str = NSMutableAttributedString.init(string: pythonMan.text!)
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.kBasis_Let_Color(), range: NSMakeRange(0, 3))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(4, 11))
        str.addAttribute(NSForegroundColorAttributeName, value: UIColor.kBasis_deepOrange_Color(), range: NSMakeRange(16, 4))
        pythonMan.attributedText = str
        
        return pythonMan
    }()
    
    
}
