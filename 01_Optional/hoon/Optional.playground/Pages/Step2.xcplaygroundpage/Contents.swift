enum productError: Error {
    case empty(Int)
    case poor
}

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

//do-catch
func buy(productNumber: Int) throws {
    guard let product = productsList[productNumber] else { throw productError.empty(productNumber) }
    guard budget >= 1000 else { throw productError.poor }
    
    budget -= 1000
    print("\(productsList[productNumber]!) 구매, 현재 잔고는 \(budget)")
    productsList[productNumber] = nil
}

for index in [1, 2, 2, 3, 5] {
    do {
        try buy(productNumber: index)
    } catch productError.empty(let index) {
        print("\(index)번 상품이 없습니다.")
    } catch productError.poor {
        print("돈이 부족합니다.")
    }
}

print()
budget = 2000
productsList = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

//Result Type
func buy2(productNumber: Int) -> Result<String, productError> {
    guard let product = productsList[productNumber] else { return .failure(.empty(productNumber)) }
    guard budget >= 1000 else { return .failure(.poor) }
    
    let productName: String = productsList[productNumber]!
    
    budget -= 1000
    productsList[productNumber] = nil
    
    return .success(productName)
}

for index in [1, 2, 2, 3, 5] {
    let a = buy2(productNumber: index)
    
    switch a {
    case .success(let name):
        print("\(name) 구매")
    case .failure(let error):
        print(error)
//    case .failure(let error(let x))
//        print("aaaa", error)
    }
}
