//
//  BBSettingsController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBSettingsController: UIViewController {

    deinit{
        print("BBSettingsController释放了")
    }

    override func loadView() {
        super.loadView()
        
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "设置"
        
        settingsView.tableview.delegate = self
        settingsView.tableview.dataSource = self
    }
    
    @objc private func onClickGobackBtn(){
        self.navigationController?.popViewControllerAnimated(true)
    }

    private lazy var settingsView : BBSettingsView = {
        
        let settingsView = BBSettingsView.init(frame: self.view.bounds)
        return settingsView
    }()

}

extension BBSettingsController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var logoutCell = tableView.dequeueReusableCellWithIdentifier("logoutCell") as? BBLogoutCell
        
        if logoutCell == nil {
            logoutCell = BBLogoutCell(style: .Default,reuseIdentifier: "logoutCell")
        }
        
        logoutCell?.titleLbl.text = "退出登录"
        
        return logoutCell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc = BBInputMessageController()
        BBSettings.defaultSettings.userId = nil
        vc.modalTransitionStyle = .CoverVertical
        BBSettings.defaultSettings.isSelectedSettingsLogout = true
        self.wxs_presentViewController(vc, animationType: .SysRippleEffect, completion: nil)
    }

}

