## 실험 목표

1. MVC패턴을 확인하기 위한 간단한 앱을 만들어보려 합니다.
    iPhone 12 pro Max 를 기준으로 시뮬레이팅 합니다. (오토레이아웃은 진행하지 않습니다.)
    이름과 전화번호를 TextField에 작성하고, 지금 등록하기 버튼을 누르면 등록자 배열에 저장됩니다.
    등록 확인하기 버튼을 누르면 등록 정보에 작성 내용이 표시됩니다.
    등록 정보의 유효성 검사는 진행하지 않습니다.
    추가적인 함수를 구현해도 괜찮습니다.
    
2. 주석을 사용해 ViewController 파일 내부에서 View와 Controller를 나누어봅시다.
    왜 Cocoa MVC 패턴은 View와 Controller를 분리하기 어려운 것인지, 설명해봅시다.
    StoryBoard는 MVC 패턴의 관점에서 View라고 볼 수 있을까요? 자신만의 근거를 들어 생각해봅시다.

3. 때로는 인스턴스의 프로퍼티가 변경되었을 때, 프로퍼티의 외부에서 이를 알아차리고 동작을 수행해야하는 경우가 있습니다.
    우리는 기존에 IBAction을 활용해 버튼을 눌렀을 때 Label에 값이 들어가도록 구현하였습니다. 이번에는 같은 동작을 Notification Center를 활용해서 구현해봅시다.

### Todo
1. Storyboard에 위치해있는 화면 요소를 코드 영역에서 활용해봅시다.
    '이름, 전화번호’를 프로퍼티로 갖는 구조체 Registrant 구조체를 생성해봅시다.
    이름, 전화번호 TextField 에 입력한뒤 지금 등록하기 버튼을 누르면 모델 타입(Registrant)의 인스턴스가 생성될 수 있도록 합시다.
    등록확인하기 버튼을 누르면 등록 정보의 '준비중입니다.' Label에 새로 등록한 정보가 표현되도록 구성합시다.
   
2. 등록 확인하기 버튼은 다음 실험에서 사용하지 않습니다.
    Notification Center를 생성하고, Observer를 등록합니다.
    지금 등록하기 버튼을 눌렀을 때, NotificationCenter에 알림이 전송됩니다.
    Observer를 활용해 Label에 원하는 값을 표현합시다.

### 📚 참고 링크

- [🍎Apple Docs: addObserver](https://developer.apple.com/documentation/foundation/notificationcenter/1411723-addobserver)
- [🍎Apple Docs: Storyboard](https://developer.apple.com/library/archive/documentation/General/Conceptual/Devpedia-CocoaApp/Storyboard.html)
- [🍎Apple Docs: placeholder](https://developer.apple.com/documentation/uikit/uitextfield/1619621-placeholder)
- [🍎Apple Docs: Device screen sizes and orientations](https://developer.apple.com/design/human-interface-guidelines/layout#Device-screen-sizes-and-orientations)
- [📘blog: ios-resolution](https://www.ios-resolution.com/)
