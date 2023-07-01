//
//  ViewController.swift
//  tableView
//
//  Created by 1 on 2023/07/01.
//

import UIKit

enum FoodMenu: String, CaseIterable {
    case American
    case Chinese
    case Korean
    case Japanese
}

struct Foods {
    let name: String
    let price: Int
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "메뉴판"
        tableView.dataSource = self
    }
    let foodType = FoodMenu.allCases
    
    let menu: [FoodMenu: [Foods]] = [
        .American: [
        Foods(name: "징버거버", price: 9000),
        Foods(name: "고르곤", price: 35000),
        Foods(name: "아아", price: 2000),
        ],
        .Chinese: [
            Foods(name: "꽃핀가지", price: 40000),
            Foods(name: "짜장면", price: 9000)
            ],
        .Korean: [
            Foods(name: "명륜진사갈비", price: 18900),
            Foods(name: "자연별곡", price: 19900)
        ],
        .Japanese: [
            Foods(name: "타코와사비", price: 9900),
            Foods(name: "간장새우", price: 10900)
        ]
    ]
}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodType.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return foodType[section].rawValue
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let a = menu[foodType[section]] else { return 0 }
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        
        cell.textLabel?.text = menu[foodType[indexPath.section]]?[indexPath.row].name
        
        if let a = menu[foodType[indexPath.section]]?[indexPath.row].price {
            cell.detailTextLabel?.text = String(a)
        }
        
        return cell
    }
}
