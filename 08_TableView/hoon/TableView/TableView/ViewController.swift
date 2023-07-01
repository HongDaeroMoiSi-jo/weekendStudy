//
//  ViewController.swift
//  TableView
//
//  Created by Daehoon Lee on 2023/06/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let kind = ["American", "Chinese", "Korean", "Japanese"]
    private let food = [["햄버거", "피자", "아메리카노"], ["탕수육"], ["비빔밥", "돼지갈비"], ["스시", "스윙스(돈까스)"]]
    
    enum FoodType: String {
        case American = "양식"
        case Chinese = "중식"
        case Korean = "한식"
        case Japanese = "일식"
    }

    struct Food {
        let name: String
        var price: Int
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "메뉴판"
//        tableView.backgroundColor = .blue
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorInsetReference = .fromAutomaticInsets
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu[.American]?.count ?? 0
        case 1:
            return menu[.Chinese]?.count ?? 0
        case 2:
            return menu[.Korean]?.count ?? 0
        case 3:
            return menu[.Japanese]?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { preconditionFailure("테이블 뷰 셀 가져오기 실패") }
        
//        cell.label.text = food[indexPath.section][indexPath.row]

        switch indexPath.section {
        case 0:
            cell.label.text = menu[.American]?[indexPath.row].name
        case 1:
            cell.label.text = menu[.Chinese]?[indexPath.row].name
        case 2:
            cell.label.text = menu[.Korean]?[indexPath.row].name
        case 3:
            cell.label.text = menu[.Japanese]?[indexPath.row].name
        default:
            return cell
        }
        
        cell.separatorInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return kind[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        view.tintColor = .red
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.red
    }
}
