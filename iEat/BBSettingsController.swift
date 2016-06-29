//
//  BBSettingsController.swift
//  iEat
//
//  Created by wave on 16/6/29.
//  Copyright © 2016年 wave. All rights reserved.
//

import UIKit

class BBSettingsController: BBBaseController {

    override func loadView() {
        super.loadView()
        
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        
        let leftItem = UIBarButtonItem.init(image: UIImage.init(named: "btn-back"), style: .Done, target: self, action: #selector(BBSettingsController.onClickGobackBtn))
        leftItem.image = UIImage(named: "btn-back")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc private func onClickGobackBtn(){
        self.navigationController?.popViewControllerAnimated(true)
    }

    private lazy var settingsView : BBSettingsView = {
        
        let settingsView = BBSettingsView.init(frame: self.view.bounds)
        return settingsView
    }()

}

//