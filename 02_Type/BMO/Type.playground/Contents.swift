// 👨‍🔬 실험 1
class Shop1 {
    var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
}

class Camper1 {
    var budget: Int

    init(budget: Int) {
        self.budget = budget
    }

    func buy(productNumber: Int, shop: Shop1) {
        shop.productsList[productNumber] = nil
        budget -= 1000
    }
}

let kor1 = Shop1()
let usa1 = Shop1()
let bmo1 = Camper1(budget: 3000)
bmo1.buy(productNumber: 1, shop: kor1)
bmo1.buy(productNumber: 2, shop: usa1)

print(
    """
    kor1.ProductsList: \(kor1.productsList)
    usa1.ProductsList: \(usa1.productsList)
    bmo1 budget: \(bmo1.budget)
    """
)

print("-----")

// 👨‍🔬 실험 2
class Camper2 {
    private(set) var budget: Int

    init(budget: Int) {
        self.budget = budget
    }

    func buy(productNumber: Int, shop: Shop2) {
        shop.buy(productNumber: productNumber, customer: self) // 상점에 구매 요청
    }
    
    func paymentRequest(amount: Int) {
        budget -= amount
    }
}

class Shop2 {
    private(set) var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

    func buy(productNumber: Int, customer: Camper2) {
        productsList[productNumber] = nil
        customer.paymentRequest(amount: 1000) // 고객에게 지불 요청
    }
}

let kor2 = Shop2()
let usa2 = Shop2()
let bmo2 = Camper2(budget: 3000)

bmo2.buy(productNumber: 1, shop: kor2)
bmo2.buy(productNumber: 2, shop: usa2)

print(
    """
    kor2.ProductsList: \(kor2.productsList)
    usa2.ProductsList: \(usa2.productsList)
    bmo2 budget: \(bmo2.budget)
    """
)
