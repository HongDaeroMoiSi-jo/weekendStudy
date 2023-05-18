//
//  NotificationCenter.swift
//  Experiment_MVC
//
//  Created by Hyun A Song on 2023/05/13.
//

import Foundation

class tfType: NSObject {
    @objc dynamic var name: String = ""
    @objc dynamic var phoneNumber: Int = 0
}

class Observer {
    let observed = tfType()
    var tfname: NSKeyValueObservation
    var tfString: NSKeyValueObservation
    
    init() {
        tfname = observed.observe(\tfType.name, options: [.new, .old]) { observed, change in
            
        }
    }
}
