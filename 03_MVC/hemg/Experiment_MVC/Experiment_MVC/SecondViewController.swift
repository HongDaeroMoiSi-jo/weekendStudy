//
//  SecondViewController.swift
//  Experiment_MVC
//
//  Created by 1 on 2023/05/13.
//

import UIKit

class SecondViewController: UIViewController {
    
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "이름: "
        return label
    }()
    
    let numberLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "번호: "
        return label
    }()
    
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "뭘까요? "
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "피 피카츄~"
        return label
    }()
    
    let textLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "이름은 ??"
        return label
    }()
    
    let subTextLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "번호는 ??"
        return label
    }()
    
    let nameTextfield: UITextField = {
        let textfield: UITextField = UITextField()
        textfield.placeholder = "입력해주세요"
        return textfield
    }()
    
    
    let numberTextfield: UITextField = {
        let textfield: UITextField = UITextField()
        textfield.placeholder = "입력해주세요"
        return textfield
    }()
    
    let registrantButton: UIButton = {
        let registrant = UIButton()
        registrant.setTitle("등록", for: .normal)
        registrant.setTitleColor(.blue, for: .normal)
        return registrant
    }()
    
    let dismissButton: UIButton = {
        let dismiss = UIButton()
        dismiss.setTitle("화면 닫기", for: .normal)
        dismiss.setTitleColor(.blue, for: .normal)
        return dismiss
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        labelView()
        addObserverName()
        addObserverNumber()
    }
    
    func addObserverName() {
        NotificationCenter.default.addObserver(forName: Notification.Name("1"), object: nil, queue: nil) { [weak self] notification in
            if let test = notification.object as? String {
                self?.titleLabel.text = test
            }
        }
    }
    
    func addObserverNumber() {
        NotificationCenter.default.addObserver(forName: Notification.Name("2"), object: nil, queue: nil) { [weak self] notification in
            if let test = notification.object as? String {
                self?.subTitleLabel.text = test
            }
        }
    }
}


//    @IBAction func hitRegisterButton(_ sender: UIButton) {
//        secondNameLabel.text = nameTextField.text
//        secondNumberLabel.text = numberTextField.text
//    }
//
//
//    @IBAction func popButton(_ sender: UIButton) {
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "3"), object: self.secondNameLabel.text)
//
//
//        NotificationCenter.default.post(name: Notification.Name(rawValue: "4"), object: self.secondNumberLabel.text)
//
//        self.navigationController?.popViewController(animated: true)
//    }
//}

