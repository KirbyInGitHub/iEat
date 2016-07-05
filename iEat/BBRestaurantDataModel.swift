//
//  BBOldRestaurantModel.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import ObjectMapper

class BBRestaurantDataModel: Mappable {

    var result: [restaurantDataItem]?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        result <- map["result"]
    }
}

class restaurantDataItem: Mappable {

    var content: String?

    var spicy_level: String?

    var cuisine: String?
    
    var restaurantId : String?

    var name: String?

    var address: String?
    
    var images : [String]?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        content <- map["content"]
        spicy_level <- map["spicy_level"]
        cuisine <- map["cuisine"]
        restaurantId <- map["id"]
        name <- map["name"]
        address <- map["address"]
        images <- map["images"]
    }
}

