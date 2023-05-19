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

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("11111===== main viewDidAppear")
//    }

//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("11111===== main viewWillDisappear")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("11111===== main viewDidDisappear")
//    }
}

