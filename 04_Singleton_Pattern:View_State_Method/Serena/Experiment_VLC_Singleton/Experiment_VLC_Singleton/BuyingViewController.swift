//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    private let vcTitle: String = "BuyingViewController"
    
//    @IBAction func dismissButton(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func buyButton(_ sender: UIButton) {
        PointManager.shared.point -= 1
        dismiss(animated: true, completion: nil)
    }
    override func loadView() {
        super.loadView()
        print("\(vcTitle) loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(vcTitle) viewDidLoad")
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
        super.viewDidDisappear(animate)
        print("\(vcTitle) viewDidDisappear")
    }
}
