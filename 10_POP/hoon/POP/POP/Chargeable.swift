//
//  Chargeable.swift
//  POP
//
//  Created by Daehoon Lee on 2023/07/14.
//

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get }
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}
