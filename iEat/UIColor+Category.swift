//
//  UIColor+Category.swift
//  zhiyou_teacher_swift
//
//  Created by wave on 16/6/13.
//  Copyright © 2016年 wave. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    //随机颜色
    class func kRandomColor() -> UIColor{
        return UIColor(red:CGFloat(arc4random_uniform(256))/255.0, green: CGFloat(arc4random_uniform(256))/255.0, blue: CGFloat(arc4random_uniform(256))/255.0, alpha: 1.0)
    }

    //ios WaveColor
    class func kBasis_Wave_Color() -> UIColor{
        return UIColor(red: 0/255.0, green: 171/255.0, blue: 165/255.0, alpha: 1.0)
    }
    
    //let颜色
    class func kBasis_Let_Color() -> UIColor{
        return UIColor(red: 180/255.0, green: 60/255.0, blue: 147/255.0, alpha: 1.0)
    }

    
    //基本紫色
    class func kBasis_Purple_Color() -> UIColor{
        return UIColor(red: 67/255.0, green: 46/255.0, blue: 94/255.0, alpha: 1.0)
    }
    
    //登录底线颜色
    class func kBasis_BottomLine_Color() -> UIColor{
        return UIColor(red: 147/255.0, green: 141/255.0, blue: 154/255.0, alpha: 1.0)
    }
    
    //致优蓝色
    class func kBasis_Blue_Color() -> UIColor{
        return UIColor(red: 0/255.0, green: 204/255.0, blue: 214/255.0, alpha: 1.0)
    }

    //橙色
    class func kBasis_Orange_COLOR() -> UIColor{
        return UIColor(red: 255/255.0, green: 154/255.0, blue: 43/255.0, alpha: 1.0)
    }

    //浅玫
    class func kBasis_LightRoseRed_COLOR() -> UIColor{
        return UIColor(red: 255/255.0, green: 82/255.0, blue: 115/255.0, alpha: 1.0)
    }
    
    //粉绿
    class func kBasis_DarkGreen_COLOR() -> UIColor{
        return UIColor(red: 101/255.0, green: 191/255.0, blue: 140/255.0, alpha: 1.0)
    }
    
    //暗紫色
    class func kBasis_DarkViolet_COLOR() -> UIColor{
        return UIColor(red: 112/255.0, green: 86/255.0, blue: 163/255.0, alpha: 1.0)
    }
    
    //明黄
    class func kBasis_BrightYellow_COLOR() -> UIColor{
        return UIColor(red: 248/255.0, green: 224/255.0, blue: 28/255.0, alpha: 1.0)
    }
    
    //草绿
    class func kBasis_GrassGreen_COLOR() -> UIColor{
        return UIColor(red: 139/255.0, green: 195/255.0, blue: 78/255.0, alpha: 1.0)
    }
    
    //浅浅粉
    class func kBasis_LightLightPink_COLOR() -> UIColor{
        return UIColor(red: 255/255.0, green: 244/255.0, blue: 247/255.0, alpha: 1.0)
    }
    
    //浅粉
    class func kBasis_LightPink_COLOR() -> UIColor{
        return UIColor(red: 247/255.0, green: 209/255.0, blue: 220/255.0, alpha: 1.0)
    }
    
    //浅浅蓝
    class func kBasis_LightLightBlue_COLOR() -> UIColor{
        return UIColor(red: 243/255.0, green: 249/255.0, blue: 254/255.0, alpha: 1.0)
    }
    
    //浅蓝
    class func kBasis_LightBlue_COLOR() -> UIColor{
        return UIColor(red: 193/255.0, green: 231/255.0, blue: 246/255.0, alpha: 1.0)
    }
    
    //纯黑
    class func kBasis_PureBlack_COLOR() -> UIColor{
        return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
    }
    
    //黑色
    class func kBasis_Black_COLOR() -> UIColor{
        return UIColor(red: 41/255.0, green: 47/255.0, blue: 56/255.0, alpha: 1.0)
    }
    
    //深灰
    class func kBasis_DeepGray_COLOR() -> UIColor{
        return UIColor(red: 108/255.0, green: 119/255.0, blue: 127/255.0, alpha: 1.0)
    }
 
    //中灰
    class func kBasis_MiddleGray_COLOR() -> UIColor{
        return UIColor(red: 186/255.0, green: 190/255.0, blue: 194/255.0, alpha: 1.0)
    }
    
    //浅灰
    class func kBasis_LightGray_COLOR() -> UIColor{
        return UIColor(red: 230/255.0, green: 231/255.0, blue: 231/255.0, alpha: 1.0)
    }
    
    //浅浅灰
    class func kBasis_LightLightGray_COLOR() -> UIColor{
        return UIColor(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
    }
    
    //白色
    class func kBasis_PureWhite_COLOR() -> UIColor{
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
    }
}

