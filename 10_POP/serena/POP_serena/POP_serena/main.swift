//
//  main.swift
//  POP_serena
//
//  Created by Serena on 2023/07/15.
//

let chargerForAppleWatch = Charger(maximumWattPerHour: 5)
let chargerForIPhone = Charger(maximumWattPerHour: 18)
let chargerForIPad = Charger(maximumWattPerHour: 30)
let chargerForMacBookAir = Charger(maximumWattPerHour: 96)
let chargerForMacBookPro = Charger(maximumWattPerHour: 106)
var macBook = MacBook(name: "macBook", mackBookWatt: 35, currentBatteryHour: 11)
var serenaMacBook = MacBook(name: "serena's MacBook", mackBookWatt: 10, currentBatteryHour: 30)
var bmoMacBook = MacBook(name: "bmo's MacBook", mackBookWatt: 10, currentBatteryHour: 30)
var hoonMacBook = MacBook(name: "hoon's MacBook", mackBookWatt: 10, currentBatteryHour: 30)
var hemgMacBook = MacBook(name: "hemg's MacBook", mackBookWatt: 10, currentBatteryHour: 30)

macBook.chargeBattery(charger: chargerForAppleWatch)
macBook.chargeBattery(charger: chargerForIPhone)
macBook.chargeBattery(charger: chargerForIPad)
macBook.chargeBattery(charger: chargerForMacBookAir)
macBook.chargeBattery(charger: chargerForMacBookPro)

var serenaBag = Bag()
serenaBag.put(item: serenaMacBook)
serenaBag.put(item: bmoMacBook)
serenaBag.put(item: hoonMacBook)
serenaBag.put(item: hemgMacBook)
serenaBag.whatsInMyBag()
