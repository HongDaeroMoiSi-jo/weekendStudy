//
//  ViewModel.swift
//  MVC&MVVM
//
//  Created by BMO on 2023/10/07.
//

import Foundation

enum PlayerType: String {
    case book = "책"
    case meat = "고기"
    case none = "없음"
}

class ViewModel {
    var bind: ((ViewModel) -> Void)?
    
    var playerType: PlayerType {
        didSet {
            UserDefaults.standard.setValue(playerType.rawValue, forKey: "playerType")
            bind?(self)
        }
    }
    
    init() {
        self.playerType = PlayerType.none
        setPlayerType()
    }
    
    private func setPlayerType() {
        guard let userDefaultsValue = UserDefaults.standard.string(forKey: "playerType"),
              let playerType = PlayerType(rawValue: userDefaultsValue)
        else {
            self.playerType = .none
            return
        }
        
        self.playerType = playerType
    }
}
