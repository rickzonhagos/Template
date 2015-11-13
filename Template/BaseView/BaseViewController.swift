//
//  BaseViewController.swift
//  Template
//
//  Created by Cirrena on 13/11/2015.
//  Copyright © 2015 Rickzon Hagos. All rights reserved.
//

import UIKit
import MBProgressHUD
import Flurry_iOS_SDK
class BaseViewController: UIViewController {
    
    private var progressIndicator : MBProgressHUD?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initProgressIndicator()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    deinit{
        print("de init \(self)")
    }
    
    
    // MARK: Init Methods
    private func initProgressIndicator(){
        progressIndicator = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
    }
}

extension BaseViewController : MBProgressHUDDelegate{
    func hudWasHidden(hud: MBProgressHUD!) {
        if progressIndicator != nil {
            progressIndicator!.removeFromSuperview()
            progressIndicator = nil
        }
    }
}