import Foundation

//Optional을 활용한 경우 예외사항을 처리해 봅시다.

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

func buy(productNumber: Int) {
    guard productNumber >= 0, productNumber < productsList.count else {
        print("상품이 존재하지 않습니다.")
        return
    }

    guard let product = productsList[productNumber] else {
        print("상품이 품절되었습니다.")
        return
    }

    guard budget >= 1000 else {
        print("예산이 부족합니다.")
        return
    }

    budget -= 1000
    productsList[productNumber] = nil

    print("\(product)을(를) 구매합니다.")
}

buy(productNumber: 1)
buy(productNumber: 1)
buy(productNumber: 2)
