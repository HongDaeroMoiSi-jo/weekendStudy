//
//  main.swift
//  POP
//
//  Created by Daehoon Lee on 2023/07/14.
//

typealias WattPerHour = Int
typealias Watt = Int

struct MacBook: Portable {
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

struct Charger: Chargeable, Portable {
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

//MARK: - STEP 2
let 맥북 = MacBook(currentBattery: 50)
맥북.chargeBattery(charger: 애플워치충전기)
맥북.chargeBattery(charger: 아이폰고속충전기)
맥북.chargeBattery(charger: 아이패드충전기)
맥북.chargeBattery(charger: 맥북충전기1)
맥북.chargeBattery(charger: 맥북충전기2)

//MARK: - STEP 3
protocol Portable {}

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
}

var gucciBag = Bag()
gucciBag.put(item: 맥북)
gucciBag.put(item: 맥북충전기1)
