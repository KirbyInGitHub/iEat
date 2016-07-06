//
//  BBaa.swift
//  iEat
//
//  Created by wave on 16/7/6.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

extension NSURL {
    
    public func queryDictionary() -> [String:String] {
        
        var queries = [String: String]()
        
        if let queryItems = NSURLComponents(URL: self, resolvingAgainstBaseURL: false)?.queryItems {
            queryItems.forEach { queries[$0.name] = $0.value }
        }
        return queries
    }
    
}