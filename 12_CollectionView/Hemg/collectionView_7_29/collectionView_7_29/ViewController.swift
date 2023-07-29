//
//  ViewController.swift
//  collectionView_7_29
//
//  Created by 1 on 2023/07/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️", "🍏", "🍎", "🍌", "🍉", "🥝"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentOffset = CGPoint(x: 0, y: 0)
        collectionView.isPrefetchingEnabled = false
        collectionView.decelerationRate = .fast
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        let emoji = emojies[indexPath.row]
        cell.emoji.text = emoji
        cell.backgroundColor = .yellow
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // 여기에서 필요한 작업을 수행합니다.
        // 예를 들어, 드래그가 끝난 뒤에 스크롤 뷰가 특정 위치에 정확히 멈추도록 targetContentOffset 값을 수정할 수 있습니다.
        
        // 예시: 스크롤 뷰가 특정 간격으로 멈추도록 설정 (각 페이지 별로 스크롤하도록 만드는 경우)
        let pageWidth = scrollView.bounds.width + 20
        let currentPage = targetContentOffset.pointee.x / pageWidth
        var nextPage: CGFloat = 0.0
        if velocity.x > 0 { // 오른쪽으로 스크롤하는 경우
            nextPage = ceil(currentPage)
        } else if velocity.x < 0 { // 왼쪽으로 스크롤하는 경우
            nextPage = floor(currentPage)
        } else { // 드래그 속도가 0인 경우 (사용자가 스크롤을 멈춘 경우)
            nextPage = round(currentPage)
        }
        targetContentOffset.pointee = CGPoint(x: nextPage * pageWidth, y: 0)
    }
}
