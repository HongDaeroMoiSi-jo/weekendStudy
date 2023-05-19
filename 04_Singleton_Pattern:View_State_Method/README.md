## 실험 목표

1. ViewController 전환 시 호출되는 Life Cycle 관련 메서드를 확인해봅시다.
    프로젝트 내부에는 두 개의 ViewController 파일이 구성되어 있습니다. 우리는 ViewController가 전환되는 순간 벌어지는 일에 대해서 깊이 있게 이해할 필요가 있습니다. View Life Cycle과 관련한 메서드를 재정의하여, 각 메서드가 언제, 어떤 상황에서 호출되는지 확인해봅시다.
    시뮬레이터는 `iPhone12 Pro Max`로 진행하며, 오토레이아웃은 다루지 않습니다.
    스토리보드에서는 `신상품 구매 페이지로 이동`버튼을 통한 화면 전환 방식만을 다룹니다.
    View Life Cycle과 관련된 코드 외에 실질적으로 앱을 동작하는 코드는 **실험2** 에서 작성합니다.
    
2. Singleton Pattern을 활용해 다수의 ViewController에서 하나의 정보를 공유해봅시다.
    우리의 야아포인트를 관리해주는 PointManager 인스턴스가 여기저기 생성된다면 어떻게 될까요? 아마 저마다 다르게 포인트를 관리하게 되어서 포인트 관리가 어려워질 것입니다. 포인트 관리자처럼 ‘단 하나만’ 존재해야하는 타입이 필요할 때 **싱글턴 패턴**을 활용해볼 수 있습니다.
    싱글턴 패턴을 활용해 두 View Controller 가 하나의 정보를 공유하도록 해봅시다.

### Todo
1. 첫번째 화면에서 `신상품 구매 페이지로 이동` 버튼을 눌렀을 때, 두번째 화면으로 전환되도록 해봅시다.
    View Life Cycle을 담당하는 메서드들을 재정의해 호출되는 시점을 파악해봅시다.
    - 관련 메서드가 호출되면 두 가지 동작이 실행되도록 재정의합니다.
        1. 상위 클래스의 메서드에 정의된 동작
        2. print(`메서드명`)를 통해 메서드의 호출 시점을 파악하기 위한 동작
            ```swift
            // Example
            override func viewDidLoad() {
                    super.viewDidLoad()
                    print("viewDidLoad")
            }
            ```
    화면 전환 시 View Life Cycle과 관련된 메서드는 각각 어떤 시점에 호출되는지 `MainViewController`와 `BuyingViewController`에서 확인해봅시다.
    두 번째 ViewController가 화면 전체를 차지하도록 스토리보드에서 `Presentation`을 변경해봅시다.
    화면 전환 시 View Life Cycle과 관련한 메서드가 어떤 순서로 호출되는지 확인합시다.
   
2. `PointManager` 클래스를 싱글턴 패턴으로 변경하고, `shared` 라는 이름의 단일 인스턴스를 만들어봅시다.
    싱글턴 객체의 `point` 값과 첫 화면의 `'포인트' Label` 을 연결해봅시다.
    두 번째 ViewController에서 구매하기 버튼을 누르면 두 가지 동작이 작동하도록 해봅시다.
    - 싱글턴 객체의 포인트가 물건의 가격만큼 차감됩니다.
    - 화면이 dismiss됩니다.

    첫 번째 ViewController의 새로고침 버튼을 누르면 Label에 값이 업데이트되도록 코드를 작성해봅시다.

### 📚 참고 링크

- [🍎Apple Docs: Singleton](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Singleton.html)
- [🍎Apple Docs: UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller)
