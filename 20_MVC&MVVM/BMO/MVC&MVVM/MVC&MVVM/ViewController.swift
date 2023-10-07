//
//  ViewController.swift
//  MVC&MVVM
//
//  Created by BMO on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = ViewModel()

    @IBOutlet weak var playerTypeExplainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBind()
    }

    @IBAction func tapBookButton(_ sender: UIButton) {
        viewModel.playerType = PlayerType.book
    }
    
    @IBAction func tapMeatButton(_ sender: UIButton) {
        viewModel.playerType = PlayerType.meat
    }
    
    private func setBind() {
        viewModel.bind = { [weak self] viewModel in
            self?.setPlayerTypeExplain()
        }
        
        viewModel.bind?(viewModel)
    }
    
    private func setPlayerTypeExplain() {
        let playerType = viewModel.playerType

        if playerType == .none {
            playerTypeExplainLabel.text = "버튼을 눌러보세요!"
        } else {
            playerTypeExplainLabel.text = "\(playerType.rawValue)을(를) 좋아하는 성격입니다. ^^"
        }
    }
}

