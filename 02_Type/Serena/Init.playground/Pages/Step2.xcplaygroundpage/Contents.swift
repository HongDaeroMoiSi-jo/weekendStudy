import Cocoa

// 구매하기 위한 캠퍼의 예산과 구매하기 위한 메서드
var budget: Int

//productsList 라는 변수를 프로퍼티로 갖는 타입 Shop을 생성해 봅시다.
//Shop이 자신의 productList를 관리할 수 있는 메서드를 만듭니다.
class Shop {
    //사용자가 직접 샵의 물건들에 손댈 수 없도록 접근 제어자를 활용해봅시다.
    //야곰 아카데미 샵에서 판매 중인 굿즈 리스트
    private var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    // 초기값을 지정안할 때, 함수 안에서 호출할 때
    init(productsList: [String?]) {
        self.productsList = productsList
    }
    // 이 메서드를 호출하면 물건을 꺼내고, nil로 자리를 채운 뒤 물건(String)을 반환합니다.
//    private(set) var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
//    위 함수로 nil값 확인 안해도됨
    func manageProductList(_ listNumber: Int) -> String? {
        guard listNumber >= 0 && listNumber < productsList.count else {
            return nil
        }
        
        let product = productsList[listNumber]
        productsList[listNumber] = nil
        
        return product
    }
}

//budget 변수를 프로퍼티로 갖고, buy(productNumber:) 메서드를 갖는 타입 Camper를 생성해 봅시다.
// Struct Camper로 해도 가능
class Camper {
    private var budget: Int
    
    init(budget: Int) {
        self.budget = budget
    }
    
    // 캠퍼가 buy() 메서드를 호출하면 이 메서드가 호출됩니다.
    func buy(productNumber: Int, in shop: Shop) {
        guard let product = shop.manageProductList(productNumber) else {
            print("상품이 품절되었습니다.")
            return
        }
        
        guard budget >= 1000 else {
            print("예산이 부족합니다.")
            return
        }

        budget -= 1000

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

