var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// !
for (index, product) in productsList.enumerated() {
    if product != nil {
        print("\(index)번 상품은 \(product!)입니다.")
    }
}

// optional binding
for (index, product) in productsList.enumerated() {
    if let product {
        print("\(index)번 상품은 \(product)입니다.")
    }
}

// guard
for (index, product) in productsList.enumerated() {
    guard let product else { continue }
    print("\(index)번 상품은 \(product)입니다.")
}

//optional pattern
for (index, product) in productsList.enumerated() {
    if case let name? = product {
        print("\(index)번 상품은 \(name)입니다.")
    }
}
