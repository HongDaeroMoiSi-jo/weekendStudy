//
//  Charger.swift
//  Protocol_Oriented_Programming
//
//  Created by 1 on 2023/07/15.
//

struct Charger: GiveCharger, Portable {
    var maximumWattPerHour: WattPerHour
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        if chargeableWattPerHour <= maximumWattPerHour {
            return chargeableWattPerHour
        } else {
            return maximumWattPerHour
        }
    }
}
