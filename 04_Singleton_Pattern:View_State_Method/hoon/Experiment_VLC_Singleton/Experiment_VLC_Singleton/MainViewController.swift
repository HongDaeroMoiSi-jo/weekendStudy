//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    static let shared: PointManager = PointManager()
    var point: Int = 50
    
    private init() {}
}

class MainViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1. viewDidLoad")
        numberLabel.text = String(PointManager.shared.point)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("1. viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("1. viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("1. viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("1. viewDidDisappear")
    }
    
    deinit {
        print("1. deinit")
    }
    
    @IBAction func refreshLabel(_ sender: UIButton) {
        numberLabel.text = String(PointManager.shared.point)
    }
}

