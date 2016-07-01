//
//  BBSettings.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.mainScreen().bounds.size.width
let screenHeight = UIScreen.mainScreen().bounds.size.height

//notificationKey
let kSelectedSpicyLevelKey              = "selectedSpicyLevelKey"
let kSelectedPhotoCollectionViewCellKey = "selectedPhotoCollectionViewCellKey"
let kTakePhotoDataKey                   = "takePhotoDataKey"

//notificationName
let kSelectedSpicyLevelNotification                  = "selectedSpicyLevelNotification"
let kSelectedTakePhotoCollectionViewCellNotification = "selectedTakePhotoCollectionViewCellNotification"
let kTakePhotoDataNotificationName                   = "takePhotoDataNotificationName"

//NSUserDefaultsKey
let kIsSelectedSettingsLogout = "isSelectedSettingsLogout"
let kUserId                   = "userId"
let kToekn                    = "toekn"


class BBSettings: NSObject {

    static let defaultSettings = BBSettings();
    
    //isSelectedSettingsLogout
    var isSelectedSettingsLogout : Bool?{
        get{
            return NSUserDefaults.standardUserDefaults().boolForKey(kIsSelectedSettingsLogout)
        }
        set{
            NSUserDefaults.standardUserDefaults().setBool(newValue!, forKey: kIsSelectedSettingsLogout)
        }
    }
    
    //token
    var token : String?{
        get{
            return NSUserDefaults.standardUserDefaults().stringForKey(kToekn)
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: kToekn)
        }
    }
    
    //userId
    var userId : String?{
        get{
            return NSUserDefaults.standardUserDefaults().stringForKey(kUserId)
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: kUserId)
        }
    }
    
}
