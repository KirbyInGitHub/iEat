//
//  BBDeliveryService.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBDeliveryService: NSObject {

    //userInfo
    class func getUserInfo(userPhone:String?,success:(result:AnyObject?) -> (),failure:((error:NSError) -> ())? = nil){
        
        let api            = NSURL(string: "http://123.57.132.228:8800/api/login/" + userPhone!);
        BBNetworkManager.sharedNetworkTools.requestJSON(.GET, URLString: api, parameters: nil, success: success, failure: failure)
    }
    
    
}
