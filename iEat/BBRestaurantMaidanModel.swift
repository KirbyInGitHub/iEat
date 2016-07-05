//
//  BBRestaurantMaidanModel.swift
//  iEat
//
//  Created by wave on 16/7/5.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import ObjectMapper

class BBRestaurantMaidanModel: Mappable {

    var result: [restaurantMaidanItem]?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        result <- map["result"]
    }

}

class restaurantMaidanItem: Mappable {

    var address: String?

    var content: String?

    var images: [String]?

    var restaurantId: String?

    var spicy_level: String?

    var cuisine: String?

    var name: String?

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

