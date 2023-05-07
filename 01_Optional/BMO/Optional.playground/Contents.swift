// 👨‍🔬 실험 1: 옵셔널 값을 사용해 봅시다.
func experiment1() {
    var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

    func generate(index: Int, product: String) -> String {
        return "\(index)번 상품은 \(product)입니다."
    }

    for index in 0...productsList.count - 1 {
        // Unconditional Unwrapping
        let info = generate(index: index, product: productsList[index]!)

        print(info)
    }

    print("----------")

    for index in 0...productsList.count - 1 {
        // Optional Binding
        guard let product = productsList[index] else { continue }

        let info = generate(index: index, product: product)

        print(info)
    }

    print("----------")

    for index in 0...productsList.count - 1 {
        // Using the Nil-Coalescing Operator
        let info = generate(index: index, product: productsList[index] ?? "")

        print(info)
    }
}

experiment1()

// 👨‍🔬 실험 2: Optional을 활용한 경우 예외사항을 처리해 봅시다.
func experiment2() {
    var budget: Int = 4000
    var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

    func buy(productNumber: Int) {
        guard let product = productsList[productNumber] else {
            print("상품이 없거나 품절되었습니다.\n")
            
            return
        }
        
        guard budget > 1000 else {
            print("예산이 초과되었습니다.\n")
            
            return
        }
        
        budget -= 1000
        productsList[productNumber] = nil
        
        print("\(product)를 구매했습니다.\n남은 예산: \(budget)\n남은 물품: \(productsList)\n")
    }

    var numbers: [Int] = [1, 1, 1, 0, 2, 3, 4]

    for number in numbers {
        buy(productNumber: number)
    }
}

experiment2()
