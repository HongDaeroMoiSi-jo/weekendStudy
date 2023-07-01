//
//  ViewController.swift
//  TableViewStudy
//
//  Created by 비모 on 2023/06/30.
//

import UIKit

class ViewController: UIViewController {
    
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]

    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customTableView.dataSource = self
        customTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        FoodType.allCases[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foodType = FoodType.allCases[section]
        return menu[foodType]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = customTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let foodType = FoodType.allCases[indexPath.section]
        
        guard let foods = menu[foodType] else {
            return UITableViewCell()
        }
        
        let food = foods[indexPath.row]
        
        cell.foodNameLabel.text = food.name
        cell.foodPriceLabel.text = String("\(food.price)원")
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

enum FoodType: String, CaseIterable {
    case American
    case Chinese
    case Korean
    case Japanese
}

struct Food {
    let name: String
    var price: Int
}
