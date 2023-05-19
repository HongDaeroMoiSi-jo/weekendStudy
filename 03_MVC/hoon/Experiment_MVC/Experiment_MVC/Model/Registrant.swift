//
//  Registrant.swift
//  Experiment_MVC
//
//  Created by Daehoon Lee on 2023/05/13.
//

import Foundation

class Registrant: NSObject {
    @objc dynamic var name: String
    @objc dynamic var phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
