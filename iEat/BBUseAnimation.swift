//
//  BBUseAnimation.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import pop

class BBUseAnimation: NSObject {

    static let defaultUseAnimation = BBUseAnimation();

    //放大变小
    func changeSelectedStatusViewInSizeAnimation(view:UIView?){
        
        let springAnimation = POPSpringAnimation.init(propertyNamed: kPOPLayerSize)
        let rect = view!.frame
        if rect.size.width == 0 {
            springAnimation.toValue = NSValue.init(CGSize: CGSizeMake(300, 300))
        }else{
            springAnimation.toValue = NSValue.init(CGSize: CGSizeMake(0, 0))
        }
        
        springAnimation.springBounciness = 20.0
        springAnimation.springSpeed = 20.0
        view!.layer.pop_addAnimation(springAnimation, forKey: "changeSize")
    }
    
    //从上往下
    func changeSelectedStatusViewInPositionAnimation(view:UIView?){

        let springAnimation = POPSpringAnimation.init(propertyNamed: kPOPLayerPosition)
        let point = view?.center
        
        if point?.y == 250 {
            springAnimation.toValue = NSValue.init(CGSize: CGSizeMake((point?.x)!, -230))
            view?.hidden = true
        }else{
            springAnimation.toValue = NSValue.init(CGSize: CGSizeMake((point?.x)!, 250))
            view?.hidden = false
        }
        
        springAnimation.springBounciness = 15.0
        springAnimation.springSpeed = 20.0
        view?.pop_addAnimation(springAnimation, forKey: "changePosition")
    }
    
    //选择菜系的pickerview动画
    func changePickerViewInPosition(view:UIView?) {
        UIView.animateWithDuration(0.25) { 
            
            if view?.top == screenHeight{
                
                view?.top = screenHeight - 200
            }else{
                view?.top = screenHeight
            }
        }
    }
}
