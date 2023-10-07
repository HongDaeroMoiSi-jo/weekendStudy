//
//  ViewModel.swift
//  MVC&MVVM
//
//  Created by Hyun A Song on 2023/10/07.
//

class ViewModel {
    private let model = Model()
    
    func toggleValue() {
        if model.userDefaults.string(forKey: "result") == "뼈속까지 개발자입니다!" {
            model.userDefaults.set(Model.text.food.rawValue, forKey: "result")
        } else {
            model.userDefaults.set(Model.text.macBook.rawValue, forKey: "result")
        }
    }
    
    func binding() -> String? {
        return model.userDefaults.string(forKey: "result")
    }
}
