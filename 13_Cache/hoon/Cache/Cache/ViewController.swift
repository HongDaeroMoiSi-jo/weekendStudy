//
//  ViewController.swift
//  Cache
//
//  Created by Daehoon Lee on 2023/08/05.
//

import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loadFirst(_ sender: UIButton) {
//        firstImageView.setImageUrl("https://wallpaperaccess.com/download/europe-4k-1369012")
        firstImageView.setImageUrlCache("https://wallpaperaccess.com/download/europe-4k-1369012")
    }
    
    @IBAction func loadSecond(_ sender: UIButton) {
//        secondImageView.setImageUrl("https://wallpaperaccess.com/download/europe-4k-1318341")
        secondImageView.setImageUrlCache("https://wallpaperaccess.com/download/europe-4k-1318341")
    }
    
    @IBAction func resetImageView(_ sender: UIButton) {
        print("이미지 초기화")
        firstImageView.image = UIImage()
        secondImageView.image = UIImage()
    }
    
    @IBAction func resetCache(_ sender: UIButton) {
        print("캐시 비우기")
        ImageCacheManager.shared.removeAllObjects()
//        URLCache.shared.removeAllCachedResponses()
    }
    
}

extension UIImageView {
    func setImageUrl(_ url: String) {
        
        /// cache할 객체의 key값을 string으로 생성
        let cachedKey = NSString(string: url)

        /// cache된 이미지가 존재하면 그 이미지를 사용 (API 호출안하는 형태)
        if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
            print("캐시된 이미지가 있습니다.")
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            guard let url = URL(string: url) else { return }
            URLSession.shared.dataTask(with: url) { (data, result, error) in
                guard error == nil else {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = UIImage()
                    }
                    return
                }

                DispatchQueue.main.async { [weak self] in
                    if let data = data, let image = UIImage(data: data) {

                        /// 캐싱
                        ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                        
                        print("새로운 데이터를 받아왔습니다.")
                        self?.image = image
                    }
                }
            }.resume()
        }
    }
    
    func setImageUrlCache(_ url: String) {
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: url)!)
        
        if (cache.cachedResponse(for: request) != nil) { // 캐시에서 가져옴?
            if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                print("캐시된 이미지가 있습니다.")
                self.image = image
            }
        } else { // 새로 다운 받는 애
            // 2
            let task = URLSession.shared.dataTask(with: request) /* 4 */{ data, response, error in
                if let error = error {
                    print("error 오류!", error.localizedDescription)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("httpResponse 오류!")
                    return
                }
                
                guard let data = data, let image = UIImage(data: data) else {
                    print("이미지 변환 실패!")
                    return
                }
                
                // 캐시에 저장
                let cachedData = CachedURLResponse(response: response!, data: data)
                cache.storeCachedResponse(cachedData, for: request)
                
                DispatchQueue.main.async {
                    print("새로운 데이터를 받아왔습니다.")
                    self.image = image
                }
            }
            
            // 3
            task.resume()
        }
    }
}
