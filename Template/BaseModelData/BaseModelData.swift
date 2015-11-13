//
//  BaseModelData.swift
//  Template
//
//  Created by Cirrena on 13/11/2015.
//  Copyright © 2015 Rickzon Hagos. All rights reserved.
//

import UIKit

class BaseModelData: NSObject {
    var isSucess : Bool = false
    var message : String?
    var returnParams : [String : AnyObject]?
    
    
    required init(data : [String : AnyObject]?, returnParams : [String : AnyObject]?) {
    
    }
}
