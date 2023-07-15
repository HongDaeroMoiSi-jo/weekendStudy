//
//  GiveCharger.swift
//  Protocol_Oriented_Programming
//
//  Created by 1 on 2023/07/15.
//

protocol GiveCharger {
    typealias Watt = Int
    typealias WattPerHour = Int
    
    var maximumWattPerHour: WattPerHour { get set }
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}
