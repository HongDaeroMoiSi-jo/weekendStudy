//MARK: STEP 2
class Shop {
    private var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    func sell(productNumber: Int) -> Int {
        guard let product = productsList[productNumber] else {
            print("\(productNumber)번 상품이 없습니다.", terminator: " ")
            return 0
        }
        
        print("\(productsList[productNumber]!) 구매", terminator: ", ")
        productsList[productNumber] = nil
        
        return 1000
    }
}

struct Camper {
    private var budget: Int = 3000
    private var price: Int = 0
    
    mutating func buy(productNumber: Int, in shop: Shop) {
        guard budget >= 1000 else {
            print("돈이 부족합니다.")
            return
        }
        
        price = shop.sell(productNumber: productNumber)
        budget -= shop.sell(productNumber: productNumber)
        print("현재 잔고는 \(budget)")
    }
}

//MARK: - 실행
var shopInSeoul: Shop = Shop()
var shopInUS: Shop = Shop()
var hoon: Camper = Camper()

for index in [1, 2, 2, 3, 5] {
    hoon.buy(productNumber: index, in: shopInSeoul)
//    hoon.buy(productNumber: index, in: shopInUS)
}
