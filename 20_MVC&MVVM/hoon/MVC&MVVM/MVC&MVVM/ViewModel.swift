//
//  ViewModel.swift
//  MVC&MVVM
//
//  Created by Daehoon Lee on 2023/10/07.
//

import Foundation

class ViewModel {
    var changeMessage: ((ViewModel) -> Void)?
    
    var message: String {
        didSet {
            changeMessage?(self)
        }
    }
    
    init(message: String) {
        self.message = message
    }
    
    func saveUserDefaults(data: String) {
        UserDefaults.standard.setValue(data, forKey: "choose")
        message = UserDefaults.standard.string(forKey: "choose")!
    }
}
