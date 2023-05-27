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
        print("나는 뭘까 멀하는애야? \(menu)")
    }
}

class CafeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) {
        print("\(menu)가 준비 되었습니다.")
    }
}

class Coffee {
    var kind: CoffeeMenu
    var amount: Int
    
    init(kind: CoffeeMenu, amount: Int) {
        self.kind = kind
        self.amount = amount
    }
    
//    func numberCoffees() {
//        print("\(kind)커피의 메뉴  \(amount) 이놈은 갯수?  커피를 몇개 시키는거?")
//    }
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
        
        money -= coffeePrice
        print("\(name)이 \(menu)를 주문 했다. \(coffeePrice)금액 차감 남은돈은 \(money)원 남음")
    }
}

let hemg: CafeManager = CafeManager()

let yagombucks: CafeShop = CafeShop(manager: hemg)

let tom: Person = Person(name: "톰", money: 10000)

tom.buy(.latte, at: yagombucks)
