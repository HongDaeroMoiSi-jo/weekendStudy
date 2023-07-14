//
//  MacBook.swift
//  POP_serena
//
//  Created by Serena on 2023/07/15.
//

struct MacBook {
    let mackBookWattPerHour: WattPerHour
    let currentBatteryHour: WattPerHour
    let maximumWattPerHour: WattPerHour
    
    private func chargeBattery(charger: Chargeable) {
        print("배러리 완충까지 걸린시간은 \(charger)입니다")
    }
}
