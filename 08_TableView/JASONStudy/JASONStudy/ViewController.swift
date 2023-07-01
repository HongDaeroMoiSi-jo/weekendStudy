//
//  ViewController.swift
//  JASONStudy
//
//  Created by Serena on 2023/06/26.
//

import UIKit

struct Market: Codable {
    let id: String
    let pw: String
}

struct ImageInfo {
    private let title: String
    private let imageURL: String
    private let date: Date

    init(title: String, imageURL: String, date: Date) {
        self.title = title
        self.imageURL = imageURL
        self.date = date
    }

    enum Keys {
        static let title = "title"
        static let imageURL = "image"
        static let date = "date"
    }
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var markets: [Market] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return markets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = markets[indexPath.row].id
        cell.detailTextLabel?.text = markets[indexPath.row].pw
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        decodingMarket()
        self.tableView.dataSource = self
    }

    func decodingMarket() {
        let decoder = JSONDecoder()
        
        // 생성한 JSON 파일 위치 - path 사용: return string
        guard let jsonPath = Bundle.main.path(forResource: "Market", ofType: "json") else {
            print("json 실패")
            return
        }

        // JSON 타입 변환
        guard let data = try? String(contentsOfFile: jsonPath).data(using: .utf8) else {
            print("data 실패")
            return
        }
        
        // 인스턴스 화
        guard let markets = try? decoder.decode([Market].self, from: data) else {
            print("market 실패")
            return
        }

        self.markets = markets
    }

    func decodingImage() {
        // url 사용: return url
        guard let imageJsonPath = Bundle.main.url(forResource: "image", withExtension: "json") else {
            return
        }
        
        guard let data = try? String(contentsOf: imageJsonPath).data(using: .utf8) else {
            return
        }
    }
}

