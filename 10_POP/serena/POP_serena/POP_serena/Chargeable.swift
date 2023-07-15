//
//  Chargeable.swift
//  POP_serena
//
//  Created by Serena on 2023/07/15.
//

// Int 대신 WattPerHour라는 이름을 쓸 수 있다
typealias WattPerHour = Int
typealias Watt = Int

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get set }
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}
