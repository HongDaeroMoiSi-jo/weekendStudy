import UIKit

// step 1
//var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집엎"]
//
//if let product = productsList[5] {
//    print(product)
//}
//
//for product in 0..<productsList.count {
//    if let productsList = productsList[product] {
//        print("\(product)번 상품은 \(productsList)")
//    }
//}
//
//for i in productsList.indices {
//    guard let product = productsList[i] else { continue }
//
//    print("\(i)번 상품은\(product)")
//}
//
//productsList.compactMap { $0 }.enumerated().forEach { print("\($0.0)번 상품은 \($0.1)") }
//productsList.compactMap { $0 }.enumerated().forEach { print("\($0.offset)번 상품은 \($0.element)") }

// step 2
//var budget: Int = 5000
//var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집엎"]
//
//func buy(productNumber: Int) -> String {
//
//    guard productNumber >= 0 else { return "없는상품 입니다." }
//
//    guard let product = productsList[productNumber] else { return "이미 팔렸습니다." }
//
//    var productPrice: Int = 0
//    switch product {   //여기 스위치 만드는 부분이 어려워서 힘들었다. ㄱㅅ
//    case "볼펜":
//        productPrice = 1000
//    case "텀블러":
//        productPrice = 1000
//    case "다이어리":
//        productPrice = 1000
//    case "에코백":
//        productPrice = 1000
//    case "머그컵":
//        productPrice = 1000
//    default:
//        return "없는상품 입니다."
//    }
//    guard budget > 1000 else { return "돈이 부족해요" }
//
//    budget -= productPrice
//    productsList[productNumber] = nil
//    return "\(product)을(를) 샀습니다.  남은 돈은 \(budget)원 입니다." // 감사합니다..!!
//
//}
//print(buy(productNumber: 0))
//print(buy(productNumber: 1))
//print(buy(productNumber: 1))
//print(buy(productNumber: 2))
//print(buy(productNumber: 3))
//print(buy(productNumber: 4))
//print(buy(productNumber: 5))
