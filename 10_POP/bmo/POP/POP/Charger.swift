//
//  Charger.swift
//  POP
//
//  Created by 비모 on 2023/07/14.
//

struct Charger: Chargeable {
    var maximumWattPerHour: WattPerHour
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        return maximumWattPerHour < chargeableWattPerHour ? maximumWattPerHour : chargeableWattPerHour
    }
}
