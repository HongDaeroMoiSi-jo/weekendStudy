//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    var name: String
    var phoneNumber: String
}

class ViewController: UIViewController {
    // View
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    // Model
    var registrantList: [Registrant] = []
    
    // View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phoneNumber = phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let registrant = Registrant(name: name!, phoneNumber: phoneNumber!)
//        registrantList.append(registrant)
        let observer = Observer()
        
        
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        let lbName = registrantList.last?.name
        let lbPhoneNumber = registrantList.last?.phoneNumber
        nameLabel.text = lbName
        phoneNumberLabel.text = lbPhoneNumber
    }
    
    func register() {
        
    }
}
