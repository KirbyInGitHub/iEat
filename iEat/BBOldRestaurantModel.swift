//
//  BBOldRestaurantModel.swift
//  iEat
//
//  Created by wave on 16/7/1.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import ObjectMapper

class BBOldRestaurantModel: Mappable {

    var result: [Result]?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        result <- map["result"]
    }
}

class Result: Mappable {

    var content: String?

    var spicy_level: String?

    var cuisine: String?

    var name: String?

    var address: String?

    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        content <- map["content"]
        spicy_level <- map["spicy_level"]
        cuisine <- map["cuisine"]
        name <- map["name"]
        address <- map["address"]
    }
}

