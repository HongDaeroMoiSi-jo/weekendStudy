//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    let name: String
    let phoneNumber: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(register), name: Notification.Name("register"), object: nil)
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        let name: String = nameTextField.text!
        let phoneNumber: String = phoneNumberTextField.text!
        let registrant: Registrant = Registrant(name: name, phoneNumber: phoneNumber)
        
        registrantList.append(registrant)
        
        NotificationCenter.default.post(name: Notification.Name("register"), object: nil)
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        let registrant: Registrant? = registrantList.last
        nameLabel.text = registrant?.name
        phoneNumberLabel.text = registrant?.phoneNumber
    }
    
    @objc func register() {
        let registrant: Registrant? = registrantList.last
        nameLabel.text = registrant?.name
        phoneNumberLabel.text = registrant?.phoneNumber
    }
}
