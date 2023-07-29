//
//  ViewController.swift
//  satStudy_CollectionView_Serena
//
//  Created by Serena on 2023/07/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️"]
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
//    var nowPage: Int = 0
    
    let cellIdentifier = "myCell"
    let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        myCollectionView.isPagingEnabled = true
        myCollectionView.decelerationRate = .normal
        flowLayout.minimumLineSpacing = 20
        flowLayout.scrollDirection = .horizontal
        myCollectionView.collectionViewLayout = flowLayout
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.myLabel.text = emojies[indexPath.row]
        cell.backgroundColor = .yellow
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 75)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
//    }

    // 사용자가 스크롤 뷰를 드래그하고 놓을 때 호출되는 메서드
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
