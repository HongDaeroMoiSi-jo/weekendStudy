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
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(hitCheckButton(_:)),
            name: Notification.Name.registrationDone,
            object: nil
        )
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        register()
        NotificationCenter.default.post(
            name: NSNotification.Name.registrationDone,
            object: nil
        )
    }
    
    @objc
    @IBAction func hitCheckButton(_ sender: Any) {
        let registrant = registrantList.last
        nameLabel.text = registrant?.name
        phoneNumberLabel.text = registrant?.phoneNumber
    }
    
    func register() {
        let registrant = Registrant(
            name: nameTextField.text!,
            phoneNumber: phoneNumberTextField.text!
        )
        
        registrantList.append(registrant)
        
        nameTextField.text = ""
        phoneNumberTextField.text = ""
    }
}

extension Notification.Name {
    static let registrationDone = Notification.Name("registrationDone")
}
