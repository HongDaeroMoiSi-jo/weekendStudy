//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BuyingViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("BuyingViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("BuyingViewController viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("BuyingViewController viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("BuyingViewController viewDidDisappear")
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapBuyButton(_ sender: UIButton) {
        PointManager.shared.point -= 1
        dismiss(animated: true, completion: nil)
    }
}
