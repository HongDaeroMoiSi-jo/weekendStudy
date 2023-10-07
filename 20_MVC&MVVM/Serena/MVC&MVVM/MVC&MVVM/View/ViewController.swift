//
//  ViewController.swift
//  MVC&MVVM
//
//  Created by Hyun A Song on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = viewModel.binding()
    }

    @IBAction func macbookButton(_ sender: UIButton) {
        viewModel.toggleValue()
        resultLabel.text = viewModel.binding()
    }
    
    @IBAction func foodButton(_ sender: UIButton) {
        viewModel.toggleValue()
        resultLabel.text = viewModel.binding()
    }
}
