//
//  Chargeable.swift
//  POP_serena
//
//  Created by Serena on 2023/07/15.
//

typealias WattPerHour = Int
typealias Watt = Int

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get set }
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}
