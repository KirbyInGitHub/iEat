//
//  BBDeliveryService.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

//BaseUrl
let API_BASE_URL          = "http://123.57.132.228:8800/api/"

//signup
let API_SIGNUP_URL        = "signup"

//login
let API_LOGIN_URL         = "login"

//logout
let API_LOGOUT_URL        = "logout"

//addNewRestaurant
let API_ADDRESTAURANT_URL = "newrestaurant?token="

//getRestaurantInfo
let API_GETRESTAURANTINFO_URL = "myrestaurants?token="

class BBDeliveryService: NSObject {

    //signup
    class func userSignup(userPhone:String?,userPassword:String?,success:(result:AnyObject?) -> (),failure:((error:NSError) -> ())? = nil){
        
        let api = NSURL(string: API_BASE_URL + API_SIGNUP_URL)
        var params         = [String: AnyObject]()
        params["phone"] = userPhone
        params["password"] = userPassword
        BBNetworkManager.sharedNetworkTools.requestJSON(.POST, URLString: api, parameters: params, success: success, failure: failure)
    }
    
    //login
    class func userLogin(userPhone:String?,userPassword:String?,success:(result:AnyObject?) -> (),failure:((error:NSError) -> ())? = nil){
        
        let api = NSURL(string: API_BASE_URL + API_LOGIN_URL)
        var params         = [String: AnyObject]()
        params["phone"] = userPhone
        params["password"] = userPassword
        BBNetworkManager.sharedNetworkTools.requestJSON(.POST, URLString: api, parameters: params, success: success, failure: failure)
    }
    
    //logout
//    class func userLogout(success:(result:AnyObject?) -> (),failure:((error:NSError) -> ())? = nil){
//        let api = NSURL(string: API_BASE_URL + API_LOGOUT_URL)
//    }
    
    //addNewRestaurant
    class func addNewRestaurant(restaurantItem:BBAddNewRestaurantItem,success:(result:AnyObject?) -> (),failure:((error:NSError) -> ())? = nil){
        
        let api = NSURL(string: API_BASE_URL + API_ADDRESTAURANT_URL + BBSettings.defaultSettings.userId!)
        var params         = [String: AnyObject]();
        
        params["name"] = restaurantItem.restaurantName
        params["content"] = restaurantItem.restaurantContent
        params["address"] = restaurantItem.restaurantAddress
        if restaurantItem.restaurantSpicyLevel != "请选择" {
            params["spicy_level"] = restaurantItem.restaurantSpicyLevel
        }
        if restaurantItem.restaurantCuisine != "请选择"{
            params["cuisine"] = restaurantItem.restaurantCuisine
        }
        
        print(params)
        
        BBNetworkManager.sharedNetworkTools.requestJSON(.POST, URLString: api, parameters: params, success: success, failure: failure)
    }
    
    class func getRestaurantInfo(success:(result:AnyObject?) -> (),failure:((error:NSError) -> ())? = nil){
        
//        let api = NSURL(string: API_BASE_URL + API_GETRESTAURANTINFO_URL + BBSettings.defaultSettings.userId!)
//        BBNetworkManager.sharedNetworkTools.requestJSON(.GET, URLString: api, parameters: nil, success: success, failure: failure)
    }
    
    
}
