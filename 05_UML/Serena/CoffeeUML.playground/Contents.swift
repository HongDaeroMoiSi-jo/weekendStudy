enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 1000
        case .latte:
            return 2000
        }
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
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) -> CoffeeMenu {
        if menu.price <= self.money{
            
        }else {
            print("잔액이 부족합니다.")
        }
        return .americano
    }
}

class Coffee {
    var kind: CoffeeMenu
    var amount: Int
    
    init(kind: CoffeeMenu) {
        self.kind = kind
        // kind에서 CoffeMenu를 받았으니까?!!!!
        self.amount = kind.price
    }
}

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) -> CoffeeMenu {
        return .americano
    }
}

class CoffeeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> CoffeeMenu {
        manager.brew(.americano)
    }
}


