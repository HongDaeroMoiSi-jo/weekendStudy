//
//  Bag.swift
//  POP_serena
//
//  Created by Serena on 2023/07/15.
//

protocol Portable {
    var name: String { get }
}

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
    
    func whatsInMyBag() {
        items.forEach {
            print("\($0.name)는 제거입니다")
        }
    }
}
