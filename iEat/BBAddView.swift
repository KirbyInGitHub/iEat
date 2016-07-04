//
//  BBAddView.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBAddView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.kBasis_deepOrange_Color()
    }
    
    override func drawRect(rect: CGRect) {
        
        //第一条线
        let contextOne = UIGraphicsGetCurrentContext()
        
        //设置线条样式
        CGContextSetLineCap(contextOne, .Square)
        CGContextSetLineWidth(contextOne, 1.0)
        CGContextSetRGBStrokeColor(contextOne, 186/255.0, 190/255.0, 194/255.0, 1.0)
        CGContextBeginPath(contextOne)
        CGContextMoveToPoint(contextOne, 0, self.height * 0.5)
        CGContextAddLineToPoint(contextOne, self.width, self.height * 0.5)
        //连接上面定义的坐标点
        CGContextStrokePath(contextOne);
        
        //第二条线
        let contextTwo = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(contextTwo, .Square)
        CGContextSetLineWidth(contextTwo, 1.0)
        CGContextSetRGBStrokeColor(contextTwo, 186/255.0, 190/255.0, 194/255.0, 1.0)
        CGContextBeginPath(contextTwo)
        CGContextMoveToPoint(contextTwo, self.width * 0.5, 0)
        CGContextAddLineToPoint(contextTwo, self.width * 0.5 , self.height)
        CGContextStrokePath(contextTwo);

    }
    
}
