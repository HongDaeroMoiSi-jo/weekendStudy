//
//  MacBook.swift
//  POP
//
//  Created by 비모 on 2023/07/14.
//

struct MacBook {
    private let allowChargeWatt: Watt
    private var currentBatteryCapacity: WattPerHour
    private let maximumBatteryCapacity: WattPerHour = 100
    
    init(allowChargeWatt: Watt, currentBatteryCapacity: WattPerHour) {
        self.allowChargeWatt = allowChargeWatt
        
        if currentBatteryCapacity > maximumBatteryCapacity {
            self.currentBatteryCapacity = maximumBatteryCapacity
        } else {
            self.currentBatteryCapacity = currentBatteryCapacity
        }
    }
    
    mutating func chargeBattery(charger: Chargeable) {
        let chargeableCapacity = Double(maximumBatteryCapacity - currentBatteryCapacity)
        let chargingWatt = Double(charger.convert(chargeableWattPerHour: allowChargeWatt))
        let chargingTime = chargeableCapacity / chargingWatt
        currentBatteryCapacity = 100
        
        print("충전까지 \(chargingTime)시간 소요되었습니다.")
    }
}
