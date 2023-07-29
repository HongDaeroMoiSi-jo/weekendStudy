//
//  ViewController.swift
//  CollectionViewStudy
//
//  Created by 정동원 on 2023/07/29.
//

import UIKit

class ViewController: UIViewController {
    let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 실험: 2
        flowLayout.scrollDirection = .horizontal
//        flowLayout.minimumLineSpacing = 0
        
        // 심화 미션
        flowLayout.minimumLineSpacing = 20 // padding 20
//        collectionView.isPagingEnabled = true // 한 셀씩 넘어가짐
        collectionView.decelerationRate = .fast // 자동 스크롤이 빠르게 멈춤
        
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        
        cell.label.text = emojies[indexPath.row]
        cell.backgroundColor = .yellow
        
        return cell
    }
}

// 실험: 1
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.width / 4 - 15
//        let size = CGSize(width: width, height: width)
//
//        return size
//    }
//}

// 실험: 2
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let size = CGSize(width: width, height: height)

        return size
    }
    
    // 심화 미션
    // minimumLineSpacing이 0인 경우 isPagingEnabled = true로 원하는 동작을 구현할 수 있음
    // 하지만 minimumLineSpacing이 0를 초과한 경우 isPagingEnabled = true 옵션만으로는 정확한 스크롤링이 안됨
    // isPagingEnabled은 Spacing을 제외한 bounds(여기서는 cell크기)를 의미하기 때문
    // 때문에 scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)에 아래와 같은 코드 작성이 필요함
    // 해당 코드를 적용시 collectionView.decelerationRate가 기본값(.normal)인 경우 동작이 느리게 이루어지기 때문에, .fast를 적용하면 좀 더 자연스럽게 동작시킬 수 있음
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // 여기에서 필요한 작업을 수행합니다.
        // 예를 들어, 드래그가 끝난 뒤에 스크롤 뷰가 특정 위치에 정확히 멈추도록 targetContentOffset 값을 수정할 수 있습니다.
        
        // 예시: 스크롤 뷰가 특정 간격으로 멈추도록 설정 (각 페이지 별로 스크롤하도록 만드는 경우)
        let pageWidth = scrollView.bounds.width + 20 // 해당 코드에서 20은 flowLayout.minimumLineSpacing을 의미함
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

//// UICollectionViewDelegateFlowLayout이 아니면 아래 코드를 작성해도 item의 사이즈를 줄 수 없음
//// 그렇다면 각 item이 flowLayout을 채택하지 않아도 사이즈를 조절하는 방법은 무엇?
//extension ViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: 100, height: 100)
//
//        return size
//    }
//}

class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    @IBOutlet var label: UILabel!
}
