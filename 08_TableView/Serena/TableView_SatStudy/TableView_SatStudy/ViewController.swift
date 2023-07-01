//
//  ViewController.swift
//  TableView_SatStudy
//
//  Created by Hyun A Song on 2023/07/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    let cellIdentifier = "myCell"
    let headerViewReuseIdentifier = "HeaderView"
    
    enum Menu: String {
        case 한식
        case 중식
        case 가정식
    }

    struct Food {
        let 이름: String
        let 가격: Int
    }

    var myMenu: [Menu:[Food]] = [
        .한식:[
            Food(이름: "메뉴: 김치찌개", 가격: 5000),
            Food(이름: "메뉴: 된장찌개", 가격: 6000),
            Food(이름: "메뉴: 두부전골", 가격: 7000)
            ],
        .중식:[
            Food(이름: "메뉴: 자장면", 가격: 4000),
            Food(이름: "메뉴: 탕수육", 가격: 5000)
        ],
        .가정식:[
            Food(이름: "메뉴: 집밥", 가격: 0),
            Food(이름: "메뉴: 주는대로 먹어", 가격: 0)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableViewHeaderFooterView를 등록합니다.
        myTableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: headerViewReuseIdentifier)
        
    }
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        <#code#>
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return myMenu.keys.count
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let menus = Array(myMenu.keys)[section].rawValue
        return menus
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let menus = Array(myMenu.keys)[section]
        let menusCount = myMenu[menus]?.count ?? 0
        return menusCount
    }
    // UITableViewDelegate의 메서드 구현
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // UITableViewHeaderFooterView를 가져옵니다.
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView else {
            return nil
        }
        
        // 배경색을 설정합니다.
        headerView.contentView.backgroundColor = UIColor.red
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let menu = Array(myMenu.keys)[indexPath.section]
        if let foods = myMenu[menu] {
            let food = foods[indexPath.row]
            cell.textLabel?.attributedText = food.이름.addAttributeBigFontForKeyword(keyword: "메뉴:")
            cell.detailTextLabel?.text = "\(food.가격)원"
        }
        
        return cell
    }
}

// UITableViewHeaderFooterView를 상속받은 커스텀 헤더 뷰
class HeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // 커스텀 설정을 추가할 수 있습니다.
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 커스텀 설정을 추가할 수 있습니다.
    
}
