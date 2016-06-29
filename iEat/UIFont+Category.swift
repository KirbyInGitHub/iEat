//
//  UIFont+Category.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

extension UIFont{
    
    class func zz_regularSystemFontToFitHeight(fontSize:CGFloat) -> UIFont{
        
        return UIFont.init(name: "PingFangSC-Regular", size: fontSize)!
    }
    
    class func zz_lightSystemFontToFitHeight(fontSize:CGFloat) -> UIFont{
        
        return UIFont.init(name: "PingFangSC-Light", size: fontSize)!
    }

    class func zz_mediumSystemFontToFitHeight(fontSize:CGFloat) -> UIFont{
        
        return UIFont.init(name: "PingFangSC-Medium", size: fontSize)!
    }

}
