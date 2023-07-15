//
//  MacBook.swift
//  Protocol_Oriented_Programming
//
//  Created by 1 on 2023/07/15.
//

struct MacBook {
    let chargeWatt: Charger.Watt
    var currentBattery: Charger.WattPerHour
    let maxBattery: Charger.WattPerHour
    
    mutating func chargeBattery(charger: GiveCharger) {
        var time: Double = 0.0
        currentBattery = 0
        while currentBattery < maxBattery {
            currentBattery += charger.convert(chargeableWattPerHour: charger.maximumWattPerHour)
            time += 1.0
        }
        print("난 몇초야?\(time)")
    }
}

