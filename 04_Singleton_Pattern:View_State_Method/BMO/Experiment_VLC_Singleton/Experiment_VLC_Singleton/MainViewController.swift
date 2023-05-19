//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    static let shared = PointManager()
    var point: Int = 50
    
    private init() {}
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var pointLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPointLabel()
        print("MainViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MainViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("MainViewController viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("MainViewController viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("MainViewController viewDidDisappear")
    }
    
    @IBAction func tapRefreshButton(_ sender: UIButton) {
        setPointLabel()
    }
    
    func setPointLabel() {
        pointLabel.text = String(PointManager.shared.point)
    }
}

