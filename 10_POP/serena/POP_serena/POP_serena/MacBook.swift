//
//  MacBook.swift
//  POP_serena
//
//  Created by Serena on 2023/07/15.
//

import Foundation

struct MacBook {
    let mackBookWattPerHour: WattPerHour
    let currentBatteryHour: WattPerHour
    let maximumWattPerHour: WattPerHour = 100
    
    mutating func chargeBattery(charger: Chargeable) {
        let chargeHour = Double(maximumWattPerHour - currentBatteryHour)/Double(charger.convert(chargeableWattPerHour: mackBookWattPerHour))
        let formattedChargerHour: String = String(format: "%.2f", chargeHour)
        print("베터리 완충까지 걸린시간은 \(formattedChargerHour)입니다")
    }
}
