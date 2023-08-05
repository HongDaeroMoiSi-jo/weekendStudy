//
//  ViewController.swift
//  CacheStudy
//
//  Created by 비모 on 2023/08/05.
//

import UIKit

final class ViewController: UIViewController {
    let cache = URLCache.shared

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 이미지 1: https://wallpaperaccess.com/download/europe-4k-1369012
    @IBAction func tapFirstImageFetchButton(_ sender: UIButton) {
        fetchImage(from: "https://wallpaperaccess.com/download/europe-4k-1369012", apply: firstImageView)
    }
    
    // 이미지 2: https://wallpaperaccess.com/download/europe-4k-1318341
    @IBAction func tapSecondImageFetchButton(_ sender: UIButton) {
        fetchImage(from: "https://wallpaperaccess.com/download/europe-4k-1318341", apply: secondImageView)
    }
    
    @IBAction func tapInitalizeImagesButton(_ sender: UIButton) {
        firstImageView.image = nil
        secondImageView.image = nil
    }
    
    @IBAction func tapClearCacheButton(_ sender: UIButton) {
        cache.removeAllCachedResponses()
    }
}

extension ViewController {
    func fetchImage(from urlString: String, apply imageView: UIImageView) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        if let data = self.cache.cachedResponse(for: request)?.data,
           let image = UIImage(data: data) {
            print("캐시된 데이터가 있습니다.")
            DispatchQueue.main.async {
                imageView.image = image
            }
        } else {
            print("새로운 이미지를 받아왔습니다.")
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("http response 에러")
                    return
                }
                
                guard let data else { return }
                guard let image = UIImage(data: data) else { return }
                
                // cache 저장
                let cachedData = CachedURLResponse(response: httpResponse, data: data)
                self.cache.storeCachedResponse(cachedData, for: request)
                
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }.resume()
        }
    }
}
