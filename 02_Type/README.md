## 실험 목표
```swift
//야곰 아카데미 샵에서 판매 중인 굿즈 리스트
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// 구매하기 위한 캠퍼의 예산과 구매하기 위한 메서드
var budget: Int = 2000

func buy(productNumber: Int) {
    ...
}
```

### Todo

    - productsList 라는 변수를 프로퍼티로 갖는 타입 Shop을 생성해 봅시다.
    - budget 변수를 프로퍼티로 갖고, buy(productNumber:) 메서드를 갖는 타입 Camper를 생성해 봅시다.
    - 두 개의 Shop 인스턴스를 만들고, 한 명의 Camper 인스턴스를 만들어 각 샵에서 물건을 하나씩 구매해 봅시다.
    - 필요시 buy(productNumber:) 메서드의 파라미터를 수정해도 괜찮습니다.

    - Shop이 자신의 productList를 관리할 수 있는 메서드를 만듭니다. 이 메서드를 호출하면 물건을 꺼내고, nil로 자리를 채운 뒤 물건(String)을 반환합니다. 캠퍼가 buy() 메서드를 호출하면 이 메서드가 호출됩니다.
    - 사용자가 직접 샵의 물건들에 손댈 수 없도록 접근 제어자를 활용해봅시다.

### 새로 배운 내용
struct 안의 mutating : 함수내의 변동 사항 가능성을 명시

### 참조링크
[🍎 Apple Docs - Struct/Class 선택](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
[Blop Docs - COW(Copy-on-Write)](https://babbab2.tistory.com/18)
[🍎 Apple Docs - Automatic Reference Counting](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting/)
[Blog Docs - Stack&Heap](https://shark-sea.kr/entry/iOS-Swift-메모리의-Stack과-Heap-영역-톺아보기)
[Docs - delegate pattern](https://zeddios.tistory.com/310)
[Docs - delegate pattern](https://ggasoon2.tistory.com/6#:~:text=iOS에서%20많이%20사용되는%20디자인%20패턴이에요.&text=처리하는%20부분만%20똑,위임%3A%20Deletate)%20방법입니다.)
[Docs - delegate pattern](https://velog.io/@zooneon/Delegate-패턴이란-무엇일까)
