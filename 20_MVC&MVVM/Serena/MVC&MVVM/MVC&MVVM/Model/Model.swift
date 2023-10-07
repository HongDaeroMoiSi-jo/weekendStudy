//
//  Model.swift
//  MVC&MVVM
//
//  Created by Hyun A Song on 2023/10/07.
//

import Foundation

struct Model {
    let userDefaults = UserDefaults.standard
    
    enum text: String {
        case macBook = "뼈속까지 개발자입니다!"
        case food = "뼈속까지 먹보입니다!"
    }
}
