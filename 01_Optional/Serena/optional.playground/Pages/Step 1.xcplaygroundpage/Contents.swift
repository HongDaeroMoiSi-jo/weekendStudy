import Cocoa

//todoList : 다양한 옵셔널 바인딩을 사용하면서 아래 예시대로 문자열을 출력해봅시다.
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

//if let 구문 활용
for product in productsList {
    if let productName = product,
       let productIndex:Int = productsList.firstIndex(of: productName) {
        print("\(productIndex)번 상품은 \(productName)입니다")
    }
}


let productsList2 = productsList.compactMap { $0 }




