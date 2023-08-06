//
//  ViewController.swift
//  CacheStudy
//
//  Created by 비모 on 2023/08/05.
//

import UIKit

final class ViewController: UIViewController, URLSessionDelegate {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var firstImageButton: UIButton!
    @IBOutlet weak var secondImageButton: UIButton!
    @IBOutlet weak var imageResetButton: UIButton!
    @IBOutlet weak var cacheDelete: UIButton!
    
    //    let imageCache = NSCache<NSString, UIImage>()
    let imageCacheURL = URLCache.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ImageViewLoad(_ sender: UIButton) {
        switch sender {
        case firstImageView:
            loadImage(url: "https://wallpaperaccess.com/download/europe-4k-1369012", imageView: firstImageView)
        case secondImageView:
            loadImage(url: "https://wallpaperaccess.com/download/europe-4k-1318341", imageView: secondImageView)
        default:
            break
        }
    }
    
    @IBAction func firstImageView(_ sender: Any) {
        loadImage(url: "https://wallpaperaccess.com/download/europe-4k-1369012", imageView: firstImageView)
    }
    
    
    @IBAction func secondImageView(_ sender: Any) {
        loadImage(url: "https://wallpaperaccess.com/download/europe-4k-1318341", imageView: secondImageView)
    }
    
    
    @IBAction func resetImageButton(_ sender: Any) {
        firstImageView.image = nil
        secondImageView.image = nil
        print("이미지 초기화!")
    }
    
    
    @IBAction func clearCacheButton(_ sender: Any) {
        //        imageCache.removeAllObjects()
        imageCacheURL.removeAllCachedResponses()
        print("캐시 비우기")
    }
}

extension ViewController {
    private func loadImage(url: String, imageView: UIImageView) {
        
        //        let urls = URL(string: url)! //url 변환
        
        // 이미지 캐시가 있는지 없는지 비었나? 확인??하는거같음
        //        if let cachedImage = imageCache.object(forKey: url as NSString) {
        //            imageView.image = cachedImage
        //            print("캐시없나? 있나? 50번줄")
        //        }
        
        let urlSession: URLSession = {
            let config = URLSessionConfiguration.default
            config.requestCachePolicy = .returnCacheDataElseLoad
            config.urlCache = imageCacheURL
            return URLSession(configuration: config)
        }()
        
        guard let url = URL(string: url) else {
            print("url없어")
            return
        }
        
//        let session = URLSessionConfiguration.default
//        session.requestCachePolicy = .returnCacheDataElseLoad
//        session.urlCache = imageCacheURL
//        let urlSession = URLSession(configuration: session)
        
        // 이미지 다운로드 진행
        //        let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let cachedResponse = imageCacheURL.cachedResponse(for: URLRequest(url: url)) {
            if let image = UIImage(data: cachedResponse.data) {
                // 이미지가 캐시에 있으면 캐시된 이미지를 사용
                imageView.image = image
                print("이미지 캐시 사용")
                return
            }
        }
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                print("이미지 실패? 에러? 55번")
                return
            }
            //            self.imageCache.setObject(image, forKey: url as NSString)
            
            
            DispatchQueue.main.async {
                imageView.image = image
                let cachedData = CachedURLResponse(response: response!, data: data)
                self.imageCacheURL.storeCachedResponse(cachedData, for: URLRequest(url: url))
                print("이미지 다운")
            }
        }
        task.resume()
    }
}


/*
 let cachedData = CachedURLResponse(response: response!, data: data)
 cache.storeCachedResponse(cachedData, for: request)
 */
