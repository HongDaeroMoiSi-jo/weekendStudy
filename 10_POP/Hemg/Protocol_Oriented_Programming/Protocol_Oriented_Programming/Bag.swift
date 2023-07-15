//
//  Bag.swift
//  Protocol_Oriented_Programming
//
//  Created by 1 on 2023/07/15.
//

protocol Portable {
    
}

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
        print("나와!")
    }
}
