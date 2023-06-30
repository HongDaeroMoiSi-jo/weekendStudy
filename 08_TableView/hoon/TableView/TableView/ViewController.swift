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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "메뉴판"
//        tableView.backgroundColor = .blue
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
//        tableView.separatorInsetReference = .fromAutomaticInsets
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return kind.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { preconditionFailure("테이블 뷰 셀 가져오기 실패") }
        
        cell.label.text = food[indexPath.section][indexPath.row]
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return kind[section]
    }
    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        view.tintColor = .red
//        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.red
//    }
}
