//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class ViewController: UIViewController {
    var registrantList: [UserInfo] = []

    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var phoneNumberTextField: UITextField!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 노티피케이션 옵저버 등록
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: NSNotification.Name.register, object: nil)
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        let name = nameTextField
            .text?
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let phoneNumber = phoneNumberTextField
            .text?
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let registrant = UserInfo(name: name!, phoneNumber: phoneNumber!)
        registrantList.append(registrant)
        // 노티피케이션 발송 / 등록된 옵저버와 이름이 동일하기 때문에 selector 실행
        NotificationCenter.default.post(name: NSNotification.Name.register, object: nil)
    }
    
    @objc func update() {
        let lbName = registrantList.last?.name
        let lbPhoneNumber = registrantList.last?.phoneNumber
        nameLabel.text = lbName
        phoneNumberLabel.text = lbPhoneNumber
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        update()
    }
}
