//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = []
    let observed: Registrant = Registrant(name: "hoon", phoneNumber: "1111")
    var observingName: NSKeyValueObservation? = nil
    var observingPhoneNumber: NSKeyValueObservation? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(register),
                                               name: Notification.Name.registerDidFinish,
                                               object: nil)
        
        //Additional: KVO
        observingName = observed.observe(\Registrant.name, options: [.old, .new]) { observed, change in
            if let old = change.oldValue {
                print("oldValue : \(old) -> newValue: \(observed.name) updated!!!")
                self.nameLabel.text = observed.name
            }
        }
        
        observingPhoneNumber = observed.observe(\Registrant.phoneNumber, options: [.old, .new]) { observed, change in
            if let old = change.oldValue {
                print("oldValue : \(old) -> newValue: \(observed.phoneNumber) updated!!!")
                self.phoneNumberLabel.text = observed.phoneNumber
            }
        }
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        let name: String = nameTextField.text!
        let phoneNumber: String = phoneNumberTextField.text!
        let registrant: Registrant = Registrant(name: name, phoneNumber: phoneNumber)
        
        registrantList.append(registrant)
    
        //STEP 2: NotificationCenter
        // NotificationCenter.default.post(name: Notification.Name.registerDidFinish, object: nil)
        
        changeName("훈")
    }
    
    //STEP 1
    @IBAction func hitCheckButton(_ sender: Any) {
        let registrant: Registrant? = registrantList.last
        nameLabel.text = registrant?.name
        phoneNumberLabel.text = registrant?.phoneNumber
        
        changePhoneNumber("7777")
    }
    
    @objc func register() {
        let registrant: Registrant? = registrantList.last
        nameLabel.text = registrant?.name
        phoneNumberLabel.text = registrant?.phoneNumber
    }
    
    func changeName(_ name: String) {
        observed.name = name
    }
    
    func changePhoneNumber(_ number: String) {
        observed.phoneNumber = number
    }
}

//MARK: - extension
extension Notification.Name {
    static let registerDidFinish = Notification.Name("registerDidFinish")
}
