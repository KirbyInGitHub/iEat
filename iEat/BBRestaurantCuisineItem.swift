//
//  BBRestaurantCuisineItem.swift
//  iEat
//
//  Created by wave on 16/6/30.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBRestaurantCuisineItem: NSObject {

    var name : String?
    var idstr : String?
    
    init(dict:[String:AnyObject]) {
        super.init();
        
        setValuesForKeysWithDictionary(dict);
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}
