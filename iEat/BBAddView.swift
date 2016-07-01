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
        
        backgroundColor = UIColor.kBasis_Purple_Color()
    }
    
    override func drawRect(rect: CGRect) {
        
        //获得上下文
        let contextOne = UIGraphicsGetCurrentContext()
        
        //设置线条样式
        CGContextSetLineCap(contextOne, .Square)
        
        //设置线条宽度
        CGContextSetLineWidth(contextOne, 1.0)

        //设置颜色
        CGContextSetRGBStrokeColor(contextOne, 255/255.0, 255/255.0, 255/255.0, 1.0)
        
        //开始一个起始路径
        CGContextBeginPath(contextOne)
        
        //起点设置为0,0
        CGContextMoveToPoint(contextOne, 0, self.height * 0.5)
        
        //设置下一个坐标点
        CGContextAddLineToPoint(contextOne, self.width, self.height * 0.5)
        
        //连接上面定义的坐标点
        CGContextStrokePath(contextOne);
        
        
        //第二条线
        let contextTwo = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(contextTwo, .Square)
        CGContextSetLineWidth(contextTwo, 1.0)
        CGContextSetRGBStrokeColor(contextTwo, 255/255.0, 255/255.0, 255/255.0, 1.0)
        CGContextBeginPath(contextTwo)
        CGContextMoveToPoint(contextTwo, self.width * 0.5, 0)
        CGContextAddLineToPoint(contextTwo, self.width * 0.5 , self.height)
        CGContextStrokePath(contextTwo);

    }
    
}
