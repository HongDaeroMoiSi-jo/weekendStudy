//
//  ViewController.swift
//  CacheStudy
//
//  Created by 비모 on 2023/08/05.
//

import UIKit

//class ImageCacheManager {
//    static let shared = NSCache<NSString, UIImage>()
//    private init() {}
//}

class ViewController: UIViewController {
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var clearImage: UIButton!
    @IBOutlet weak var clearCache: UIButton!
    
    var cache = NSCache<NSString, UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedFirstImage(_ sender: UIButton) {
        getImage(firstImage, "https://wallpaperaccess.com/download/europe-4k-1369012")
    }
    
    @IBAction func tappedSecondImage(_ sender: UIButton) {
        getImage(secondImage, "https://wallpaperaccess.com/download/europe-4k-1318341")
    }
    
    private func getImage(_ myImage: UIImageView, _ url: String) {
        let cacheKey = NSString(string: url)
        
        guard let imageUrl = URL(string: url) else { return }
        
        if let cachedImage = cache.object(forKey: cacheKey) {
            myImage.image = cachedImage
            print("캐시된 이미지")
            return
        } else {
            print("새로운 이미지데스요~")
            let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("http 오류")
                    return
                }
                
                guard let data,
                      let image = UIImage(data: data) else {
                    print("이미지 오류")
                    return
                }
                
                self.cache.setObject(image, forKey: cacheKey)
                
                DispatchQueue.main.async {
                    myImage.image = image
                }
            }
            task.resume()
        }
    }
    
    @IBAction func tappedClearImage(_ sender: UIButton) {
        // 메모리 할당 해제 방법 2가지
        firstImage.image = nil
        secondImage.image = UIImage()
        print("이미지 초기화")
    }
    
    @IBAction func tappedClearCache(_ sender: UIButton) {
        cache.removeAllObjects()
        print("캐시 비우기")
    }
    
}

