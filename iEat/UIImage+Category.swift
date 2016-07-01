//
//  sa.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

extension UIImage {

    func scaleImage(image:UIImage,scale:CGFloat) -> UIImage{
        
        UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scale , image.size.height * scale))
        image .drawInRect(CGRectMake(0, 0, image.size.width * scale, image.size.height * scale))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage
    }
}
