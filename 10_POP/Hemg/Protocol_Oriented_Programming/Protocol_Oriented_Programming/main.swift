//
//  main.swift
//  Protocol_Oriented_Programming
//
//  Created by 1 on 2023/07/15.
//

import Foundation

let 햄맥 = Charger(maximumWattPerHour: 5)
let 비맥 = Charger(maximumWattPerHour: 10)
let 훈맥 = Charger(maximumWattPerHour: 45)
let 세맥 = Charger(maximumWattPerHour: 70)

var macBook = MacBook(chargeWatt: 100, currentBattery: 0, maxBattery: 100)

macBook.chargeBattery(charger: 햄맥)
macBook.chargeBattery(charger: 비맥)
macBook.chargeBattery(charger: 훈맥)
macBook.chargeBattery(charger: 세맥)
