//
//  main.swift
//  POP
//
//  Created by 비모 on 2023/07/14.
//

let appleWatchCharger = Charger(maximumWattPerHour: 5)
let iPhoneFastCharger = Charger(maximumWattPerHour: 18)
let iPadCharger = Charger(maximumWattPerHour: 30)
let macBookCharger = Charger(maximumWattPerHour: 96)
let macBookFastCharger = Charger(maximumWattPerHour: 106)

var macBook = MacBook(allowChargeWatt: 65, currentBatteryCapacity: 30)

macBook.chargeBattery(charger: appleWatchCharger)
//macBook.chargeBattery(charger: iPhoneFastCharger)
//macBook.chargeBattery(charger: iPadCharger)
//macBook.chargeBattery(charger: macBookCharger)
//macBook.chargeBattery(charger: macBookFastCharger)

var bmoBag = Bag()
bmoBag.put(item: macBook)
//bmoBag.put(item: appleWatchCharger)
//bmoBag.put(item: iPhoneFastCharger)
//bmoBag.put(item: iPadCharger)
bmoBag.put(item: macBookCharger)
//bmoBag.put(item: macBookFastCharger)
print(bmoBag.whatsInMyBag())
