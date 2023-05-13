//
//  SecondViewController+Codebase.swift
//  Experiment_MVC
//
//  Created by 1 on 2023/05/13.
//

import UIKit


extension SecondViewController {
    func labelView() {
        view.addSubview(nameLabel)
        view.addSubview(numberLabel)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(textLabel)
        view.addSubview(subTextLabel)
        view.addSubview(nameTextfield)
        view.addSubview(numberTextfield)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        subTextLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextfield.translatesAutoresizingMaskIntoConstraints = false
        numberTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        
        numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 35).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 35).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 120).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230).isActive = true
        
        subTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 100).isActive = true
        subTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 230).isActive = true
     
        nameTextfield.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 120).isActive = true
        nameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        
        numberTextfield.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: 100).isActive = true
        numberTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        
        
        registrantButton.addTarget(self, action: #selector(goAction(_:)), for: .touchUpInside)
        view.addSubview(registrantButton)
        registrantButton.translatesAutoresizingMaskIntoConstraints = false
        registrantButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        registrantButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        
        dismissButton.addTarget(self, action: #selector(dismissAction(_:)), for: .touchUpInside)
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 700).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: registrantButton.trailingAnchor, constant: 100).isActive = true
     
        
    }

    @objc func goAction(_ sender: UIButton) {
        print("고")
        textLabel.text = nameTextfield.text
        subTextLabel.text = numberTextfield.text
    }
    @objc func dismissAction(_ sender: UIButton) {
        print("닫기")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "3"), object: self.textLabel.text)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "4"), object: self.subTextLabel.text)
        self.dismiss(animated: true)
    }
}
