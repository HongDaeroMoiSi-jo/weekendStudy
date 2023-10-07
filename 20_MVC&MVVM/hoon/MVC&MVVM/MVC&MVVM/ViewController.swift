//
//  ViewController.swift
//  MVC&MVVM
//
//  Created by Daehoon Lee on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var printLabel: UILabel!
    
    private let viewModel = ViewModel(message: "버튼을 누르세요!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
    }

    @IBAction func leftButton(_ sender: UIButton) {
        viewModel.saveUserDefaults(data: "책")
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        viewModel.saveUserDefaults(data: "고기")
    }
    
    private func setBinding() {
        viewModel.changeMessage = { [weak self] viewModel in
            self?.printLabel.text = viewModel.message
        }
    }
}

