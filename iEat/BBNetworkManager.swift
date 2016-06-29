
//  BBNetworkManager.swift
//  zhiyou_teacher_swift
//
//  Created by wave on 16/6/13.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit
import Alamofire

enum Method:String {
    case GET  = "GET"
    case POST = "POST"
}

class BBNetworkManager {
    
    static let sharedNetworkTools = BBNetworkManager();

    func requestJSON(method:Method,URLString: NSURL!,parameters: [String:AnyObject]?,success:(result:AnyObject?) -> (), failure:((error:NSError) -> ())? = nil ) {
        
        if method == .GET {
            
            Alamofire.request(.GET, URLString, parameters: parameters, encoding: .URL, headers: nil).validate(contentType: ["text/html","text/plain","application/json"]).responseJSON { (response) -> Void in
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                // isFailure
                if response.result.isFailure {
                    print("网络请求失败 \(response.result.error)")
                    failure?(error: response.result.error!)
                }
                // callback
                success(result: response.result.value)
            }
        } else if method == .POST {
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            Alamofire.request(.POST,URLString, parameters: parameters, encoding: .URL, headers: nil).validate(contentType: ["text/html","text/plain","application/json"]).responseJSON { (response) -> Void in
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                // isFailure
                if response.result.isFailure {
                    print("网络请求失败 \(response.result.error)")
                    failure?(error: response.result.error!)
                }
                // callback
                success(result: response.result.value)
            }
        }
    }
    
//    func fileUpload(urlString:NSURL!,data:NSData,completion:(result:[String:AnyObject]) -> ()) {
//        
//        let parameter:[String:AnyObject] = ["accessToken":BBSettings.defaultSettings.token!]
//        
//        Alamofire.upload(.POST, urlString, multipartFormData: { (formData) -> Void in
//            
//            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//            
//            formData.appendBodyPart(data: data, name: "filename", fileName: "image", mimeType: "image/jpeg")
//            
//            for (k, v) in parameter {
//                let str = v as! String
//                let strData = str.dataUsingEncoding(NSUTF8StringEncoding)!
//                
//                formData.appendBodyPart(data: strData, name: k)
//            }
//        }, encodingMemoryThreshold: 5 * 1024 * 1024) { (encodingResult) -> Void in
//            
//            switch encodingResult {
//            case .Success(let upload, _, _):
//                upload.responseJSON(completionHandler: { (response) -> Void in
//                    
//                    if response.result.isFailure {
//                        print("网络请求失败 \(response.result.error)")
//                    }
//                    guard let json = response.result.value as? [String:AnyObject] else {
//                        return
//                    }
//                    
//                    completion(result: json);
//                })
//            case .Failure(let error):
//                print("上传文件编码错误 \(error)")
//            }
//        }
//    }
}

