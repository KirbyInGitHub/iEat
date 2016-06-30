//
//  BBSignupModel.swift
//  iEat
//
//  Created by wave on 16/6/30.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import ObjectMapper

class BBSignupModel: Mappable {

    var content : String?
    
    var name : String?
    
    var phone : String?
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    func mapping(map: Map) {
        content <- map["content"]
        name <- map["name"]
        phone <- map["phone"]
    }
}
