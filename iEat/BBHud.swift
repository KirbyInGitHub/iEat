//
//  BBHud.swift
//  iEat
//
//  Created by wave on 16/6/30.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBHud: UIView {
    
    static let defaultHud = BBHud();

    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, -75, screenWidth, 75))
        
        backgroundColor = UIColor.kBasis_Blue_Color()
       
        addSubview(messageLabel)
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showMessage(message:String?){
        
        let hud = BBHud()
        hud.showMessageStr(message)
    }
    
    private func showMessageStr(message:String?){
        
        messageLabel.text = message
        
        UIView.animateWithDuration(0.25) {
            self.top = 0
        }
        
        let time: NSTimeInterval = 1.5
        let delay = dispatch_time(DISPATCH_TIME_NOW,Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) {
            
            UIView.animateWithDuration(0.25, animations: {
                self.top = -75
                }, completion: { (isDismiss) in
                    self.removeFromSuperview()
            })
        }
    }
    
    private lazy var messageLabel : UILabel = {
        
        let messageLabel = UILabel.init(frame: CGRectMake(0, (self.height - 30) * 0.5, screenWidth, 30))
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.blackColor()
        return messageLabel
    }()
}
