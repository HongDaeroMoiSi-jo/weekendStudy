class Person {
    let name: String
    let money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        shop.order(menu)
    }
}

class CafeManager {
    func brew(_ menu: CoffeeMenu) {
        print("주문하신 \(menu)가 나왔습니다.")
    }
}

class CoffeeShop {
    let manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) {
        manager.brew(menu)
    }
}

class Coffee {
    let kind: CoffeeMenu
    let amount: Int
    
    init(kind: CoffeeMenu) {
        self.kind = kind
        self.amount = kind.price
    }
}

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 4500
        case .latte:
            return 5000
        }
    }
}

let person: Person = Person(name: "hoon", money: 10000)
let cafeManager: CafeManager = CafeManager()
let coffeeShop: CoffeeShop = CoffeeShop(manager: cafeManager)

if CoffeeMenu.americano.price <= person.money {
    person.buy(.americano, at: coffeeShop)
} else {
    print("잔액이 부족합니다.")
}
