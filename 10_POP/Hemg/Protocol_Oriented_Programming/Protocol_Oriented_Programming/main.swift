//
//  main.swift
//  Protocol_Oriented_Programming
//
//  Created by 1 on 2023/07/15.
//

import Foundation

let 햄지발전기 = Charger(maximumWattPerHour: 5)
let 비모발전기 = Charger(maximumWattPerHour: 10)
let 훈맥밥 = Charger(maximumWattPerHour: 45)
let 송발전기 = Charger(maximumWattPerHour: 70)

var macBook = MacBook(chargeWatt: 10, currentBattery: 0, maxBattery: 100)
var bag = Bag()

macBook.chargeBattery(charger: 햄지발전기)
macBook.chargeBattery(charger: 비모발전기)
macBook.chargeBattery(charger: 훈맥밥)
macBook.chargeBattery(charger: 송발전기)
bag.put(item: 햄지발전기)
bag.put(item: 비모발전기)
bag.put(item: 훈맥밥)
bag.put(item: 송발전기)
