//
//  AppDelegate.swift
//  iEat
//
//  Created by wave on 16/6/28.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

let appId = "wxa4c1f543121db27f"
let appSecret = "2349d6210d7f034dd3452380ff75c979"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,WXApiDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        
        let vc : UIViewController;
        
        if BBSettings.defaultSettings.userId != nil{
            vc = BBMainController()
            let nav = UINavigationController.init(rootViewController: vc)
            window?.rootViewController = nav
        }else{
            BBSettings.defaultSettings.isSelectedSettingsLogout = false
            vc = BBInputMessageController()
            window?.rootViewController = vc
        }
        
        window?.makeKeyAndVisible()
        
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
        
        WXApi.registerApp("wx290eaf175354a048")
        
        return true
    }
    
    //openURL
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return WXApi.handleOpenURL(url, delegate: self)
    }

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return WXApi.handleOpenURL(url, delegate: self)
    }
    
    /**
     * onReq微信终端向第三方程序发起请求，要求第三方程序响应。第三方程序响应完后必须调用
     * sendRsp返回。在调用sendRsp返回时，会切回到微信终端程序界面。
     */
    func onReq(req: BaseReq!) {
        
    }
    
    
    /**
     *  如果第三方程序向微信发送了sendReq的请求，那么onResp会被回调。sendReq请求调用后，
     *  会切到微信终端程序界面。
     */
    func onResp(resp: BaseResp!) {
        
        let aresp = resp as? SendAuthResp
        if aresp!.errCode == 0 { //用户同意

            let urlStr = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appId + "&secret=" + appSecret + "&code=" + aresp!.code + "&grant_type=authorization_code"
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
                let zoneUrl = NSURL(string: urlStr)
                
                print(zoneUrl)
//                do {
//                    
//                    let components = NSURLComponents.init(URL: zoneUrl!, resolvingAgainstBaseURL: false)
//                    let queryItems = components?.queryItems
//                    
//                    let zoneStr = try String.init(contentsOfURL: zoneUrl!, encoding: NSUTF8StringEncoding)
//                    let data = zoneStr.dataUsingEncoding(NSUTF8StringEncoding)
//                    
//                    dispatch_async(dispatch_get_main_queue(), { 
//                        
//                        
//                        
//                        print(data)
//                        if data != nil{
//                            
//                        }
//                    })
//                    
//                } catch {
//                    
//                }
                
            })
            
            
        } else if aresp!.errCode == -2 { //取消登录
            print("用户取消登录")
        } else if aresp!.errCode == -4 { //用户拒绝登录
            print("用户拒绝登录")
        } else{
            print(aresp?.errCode)
            print(aresp?.code)
        }
        
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}






















