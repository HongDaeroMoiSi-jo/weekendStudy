//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    var name: String?
    var number: String?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet var secondName: UILabel!
    @IBOutlet var secondNumber: UILabel!
    
//    var registrantList: [Registrant] = []
    var registrant = Registrant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postName()
        postNumber()
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "3"), object: nil, queue: nil) { [weak self] notification in
            if let text = notification.object as? String {
                self?.secondName.text = text
            }
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "4"), object: nil, queue: nil) { [weak self] notification in
            if let text = notification.object as? String {
                self?.secondNumber.text = text
            }
        }
    }
    
    @IBAction func hitRegisterButton(_ sender: UIButton) {
        register()
    }
    
    @IBAction func hitCheckButton(_ sender: UIButton) {
        show()
    }
    
    @IBAction func pushView(_ sender: UIButton) {
        let secondView = SecondViewController()
        self.navigationController?.present(secondView, animated: true)
        postName()
        postNumber()
    }
    
    func register() {
        registrant.name = nameTextField.text
        registrant.number = phoneNumberTextField.text
        
//        let name: String = nameTextField.text!
//        let number: String = phoneNumberTextField.text!
//        let regi: Registrant = Registrant(name: name, number: number)
//        registrantList.append(regi)
    }
    
    func show() {
//        let re: Registrant? = registrantList.first
//        nameLabel.text = re?.name
//        phoneNumberLabel.text = re?.number
        
        nameLabel.text = registrant.name
        phoneNumberLabel.text = registrant.number
    }
    
    func postName() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "1"), object: self.nameLabel.text)
    }
    
    func postNumber() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "2"), object: self.phoneNumberLabel.text)
    }
}
