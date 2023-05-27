class Person {
    let name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        if menu.price <= money {
            coffee = shop.order(menu)
            money -= menu.price
        } else {
            print("잔액이 부족합니다.")
        }
    }
}

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) -> Coffee {
        return Coffee(kind: menu)
    }
}

class CoffeeShop {
    let manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee {
        return manager.brew(menu)
    }
}

class Coffee {
    let kind: CoffeeMenu
    let amount: Int = 1
    
    init(kind: CoffeeMenu) {
        self.kind = kind
    }
}

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 3500
        case .latte:
            return 4000
        }
    }
}

let bmo = CafeManager(name: "비모", money: 1000)
let yagombucks = CoffeeShop(manager: bmo)
let hoon = Person(name: "hoon", money: 3500)
let hemg = Person(name: "hemg", money: 3800)
let serena = Person(name: "serena", money: 4000)

hoon.buy(.americano, at: yagombucks)
hemg.buy(.latte, at: yagombucks)
serena.buy(.americano, at: yagombucks)
