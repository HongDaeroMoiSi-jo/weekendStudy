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
var macBook = MacBook(mackBookWattPerHour: 35, currentBatteryHour: 11)

macBook.chargeBattery(charger: chargerForAppleWatch)
macBook.chargeBattery(charger: chargerForIPhone)
macBook.chargeBattery(charger: chargerForIPad)
macBook.chargeBattery(charger: chargerForMacBookAir)
macBook.chargeBattery(charger: chargerForMacBookPro)
