//
//  main.swift
//  POP
//
//  Created by Daehoon Lee on 2023/07/14.
//

typealias WattPerHour = Int
typealias Watt = Int

struct MacBook {
    let wattPerHour: WattPerHour = 65
    var currentBattery: WattPerHour
    let maxBattery: WattPerHour = 100
    
    func chargeBattery(charger: Chargeable) {
        let currentWattPerHour = charger.convert(chargeableWattPerHour: wattPerHour)
        let needBattery = maxBattery - currentBattery
        let time = needBattery / currentWattPerHour
        
        print("걸린 시간: \(time)")
    }
}
