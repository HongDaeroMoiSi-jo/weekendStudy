//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    static let shared = PointManager()
    var point: Int = 50 {
        didSet {
            NotificationCenter.default.post(name: Notification.Name("didSetPoint"), object: nil)
        }
    }
    private init() {} 
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    
//    init() {
//        super.init()
//    }  안됨요
    
        // required init 공부 진행 시켜~
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
        print("내가 바로 짜파게티 요리사")
    }
    
    override func loadView() {
        super.loadView()
        print("응 오늘 토요일이야 너 짤렸어")
        print("내가 2등이야")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("11111===== main viewDidLoad")
        configureLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(configureLabel), name: Notification.Name("didSetPoint"), object: nil)
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
      configureLabel()
    }
    
    @objc func configureLabel() {
        numberLabel.text = "\(PointManager.shared.point)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        numberLabel.text = "\(PointManager.shared.point)" // 뷰가 나타날때 업뎃 시키기용
        print("11111=====  main  viewWillAppear")

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("11111===== main viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("11111===== main viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("11111===== main viewDidDisappear")
    }
}

