import UIKit

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 2000
        case .latte:
            return 2900
        }
    }
}

class CafeManager {
    func brew(_ menu: CoffeeMenu) {
        print("\(menu)를 준비합니다.")
    }
}

class CafeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) {
        manager.brew(menu)
        print("\(menu)가 주문 되었습니다.")
    }
}

class Coffee {
    var kind: CoffeeMenu
    var amount: Int
    
    init(kind: CoffeeMenu) {
        self.kind = kind
        self.amount = kind.price
    }
}


class Person {
    var name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CafeShop) {
        let coffeePrice = menu.price
        
        guard money >= coffeePrice else {
            print("\(name)은 돈이 부족하다")
            return
        }
   
        shop.order(menu)
        coffee = Coffee(kind: menu)
        money -= coffeePrice
        print("\(name)이 \(menu)를 주문 했다. \(coffeePrice)금액 차감 남은돈은 \(money)원 남음")
    }
}

let hemg: CafeManager = CafeManager()

let yagombucks: CafeShop = CafeShop(manager: hemg)

let tom: Person = Person(name: "톰", money: 1500)
let bmo: Person = Person(name: "비모", money: 2500)
let hoon: Person = Person(name: "훈", money: 3000)
let serena: Person = Person(name: "세레나", money: 3500)

tom.buy(.americano, at: yagombucks)
bmo.buy(.latte, at: yagombucks)
hoon.buy(.americano, at: yagombucks)
serena.buy(.latte, at: yagombucks)
