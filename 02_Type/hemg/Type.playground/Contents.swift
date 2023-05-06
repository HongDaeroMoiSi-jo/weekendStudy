import UIKit

//야곰 아카데미 샵에서 판매 중인 굿즈 리스트
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// 구매하기 위한 캠퍼의 예산과 구매하기 위한 메서드
var budget: Int = 2000

func buy(productNumber: Int) {
    
}



struct Shop {
    private var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
     func buy(productNumber: Int) -> String? {
        let buy = productsList[productNumber]
        
        return buy
    }
}


struct Camper {
    var budget: Int = 3000
    
    mutating func buy(productNumber: Int, shop: Shop) {
        
        guard let product = shop.buy(productNumber: productNumber) else { return }
        var productPrice: Int = 0
        switch product {
        case "볼펜":
            productPrice = 1000
        case "텀블러":
            productPrice = 1000
        case "다이어리":
            productPrice = 2000
        case "에코백":
            productPrice = 1000
        case "머그컵":
            productPrice = 1000
        default:
            return
        }
        
        guard budget > productPrice else {
            print("돈없어요ㅠㅠ")
            return
        }
        budget -= productPrice
        
        print("\(product)를 구매함 \(budget)원 있음")
    }
}

let tomShop = Shop()
var camper = Camper()

//tomShop.buy(productNumber: 2)
camper.buy(productNumber: 0, shop: tomShop)
camper.buy(productNumber: 1, shop: tomShop)
camper.buy(productNumber: 2, shop: tomShop)



