//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    var point: Int = 50
    static let shared = PointManager()
    private init() { }
}

class MainViewController: UIViewController {
    private let vcTitle: String = "MainViewController"
    
    @IBOutlet weak var pointLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        print("\(vcTitle) loadView")
    }

    @IBAction func resetButton(_ sender: UIButton) {
        pointLabel.text = "\(PointManager.shared.point)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(vcTitle) viewDidLoad")
        pointLabel.text = "\(PointManager.shared.point)"
    }
    
    override func viewWillAppear(_ animate: Bool) {
        super.viewWillAppear(animate)
        print("\(vcTitle) viewWillAppear")
    }
    
    override func viewDidAppear(_ animate: Bool) {
        super.viewDidAppear(animate)
        print("\(vcTitle) viewDidAppear")
    }
    
    override func viewDidDisappear(_ animate: Bool) {
        super.viewDidDisappear(false)
        print("\(vcTitle) viewDidDisappear")
    }
}

