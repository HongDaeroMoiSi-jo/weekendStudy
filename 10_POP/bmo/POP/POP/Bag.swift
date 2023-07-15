//
//  Bag.swift
//  POP
//
//  Created by 비모 on 2023/07/15.
//

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
    
    func whatsInMyBag() {
        print(items)
    }
}
