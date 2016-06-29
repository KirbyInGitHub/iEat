//
//  BBDeliveryService.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

//BaseUrl
let API_BASE_URL     = "http://123.57.132.228:8800/api/"

//UserInfo
let API_USERINFO_URL = "login/"

class BBDeliveryService: NSObject {

    //UserInfo
    class func getUserInfo(userPhone:String?,success:(result:AnyObject?) -> (),failure:((error:NSError) -> ())? = nil){
        
        let api = NSURL(string: API_BASE_URL + API_USERINFO_URL + userPhone!);
        BBNetworkManager.sharedNetworkTools.requestJSON(.GET, URLString: api, parameters: nil, success: success, failure: failure)
    }
    
    
}
