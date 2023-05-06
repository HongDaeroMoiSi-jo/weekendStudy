import Cocoa

//야곰 아카데미 샵에서 판매 중인 굿즈 리스트
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// 구매하기 위한 캠퍼의 예산과 구매하기 위한 메서드
var budget: Int

//productsList 라는 변수를 프로퍼티로 갖는 타입 Shop을 생성해 봅시다.
class Shop {
    var productsList: [String?]
    
    // 초기값을 지정안할 때, 함수 안에서 호출할 때
    init(productsList: [String?]) {
        self.productsList = productsList
    }
}

//budget 변수를 프로퍼티로 갖고, buy(productNumber:) 메서드를 갖는 타입 Camper를 생성해 봅시다.
class Camper {
    var budget: Int
    init(budget: Int) {
        self.budget = budget
    }
    
    func buy(productNumber: Int, in shop: Shop) {
//        var shop = Shop(productsList: ["토치", "숯", "물통"])
//        var shop2 = Shop(productsList: ["계란", "식빵", "라면", "햇반"])
        guard productNumber >= 0, productNumber < shop.productsList.count else {
            print("상품이 존재하지 않습니다.")
            return
        }

        guard let product = shop.productsList[productNumber] else {
            print("상품이 품절되었습니다.")
            return
        }
//        let product = shop.productsList[productNumber]

        guard budget >= 1000 else {
            print("예산이 부족합니다.")
            return
        }

        budget -= 1000
        // Shop을 Struct/Class 차이- Struct let으로 받나??
        shop.productsList[productNumber] = nil

        print("\(product)을(를) 구매합니다.")
    }
}

//두 개의 Shop 인스턴스를 만들고, 한 명의 Camper 인스턴스를 만들어 각 샵에서 물건을 하나씩 구매해 봅시다.
var shop1 = Shop(productsList: ["토치", "숯", "물통"])
var shop2 = Shop(productsList: ["계란", "식빵", "라면", "햇반"])
let camper1 = Camper(budget: 100000)

//필요시 buy(productNumber:) 메서드의 파라미터를 수정해도 괜찮습니다.
camper1.buy(productNumber: 1, in: shop1)
camper1.buy(productNumber: 1, in: shop1)
