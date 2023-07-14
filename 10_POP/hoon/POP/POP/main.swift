//
//  main.swift
//  POP
//
//  Created by Daehoon Lee on 2023/07/14.
//

typealias WattPerHour = Int
typealias Watt = Int

struct Charger: Chargeable {
    var maximumWattPerHour: WattPerHour
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        return chargeableWattPerHour < maximumWattPerHour ? chargeableWattPerHour : maximumWattPerHour
    }
}

let 애플워치충전기 = Charger(maximumWattPerHour: 5)
let 아이폰고속충전기 = Charger(maximumWattPerHour: 18)
let 아이패드충전기 = Charger(maximumWattPerHour: 30)
let 맥북충전기1 = Charger(maximumWattPerHour: 96)
let 맥북충전기2 = Charger(maximumWattPerHour: 106)
