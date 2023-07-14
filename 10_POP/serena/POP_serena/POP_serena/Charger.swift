//
//  Charger.swift
//  POP_serena
//
//  Created by Serena on 2023/07/15.
//

struct Charger: Chargeable {
    var maximumWattPerHour: WattPerHour
    
    mutating func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        if maximumWattPerHour > chargeableWattPerHour {
            maximumWattPerHour = chargeableWattPerHour
        }
        return maximumWattPerHour
    }
}
