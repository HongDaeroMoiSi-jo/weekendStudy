//MARK: STEP 1
struct Shop {
    var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
}

struct Camper {
    var budget: Int = 2000
    var productsList: [String?]
    
    mutating func buy(productNumber: Int) {
        guard let product = productsList[productNumber] else {
            print("\(productNumber)번 상품이 없습니다.")
            return
        }
        guard budget >= 1000 else {
            print("돈이 부족합니다.")
            return
        }
        
        budget -= 1000
        print("\(productsList[productNumber]!) 구매, 현재 잔고는 \(budget)")
        productsList[productNumber] = nil
    }
}

//MARK: - 실행
var shopInSeoul: Shop = Shop()
var hoon: Camper = Camper(productsList: shopInSeoul.productsList)

for index in [1, 2, 2, 3, 5] {
    hoon.buy(productNumber: index)
}
