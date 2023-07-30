//
//  ViewController.swift
//  CollectionView
//
//  Created by Daehoon Lee on 2023/07/29.
//

import UIKit

class ViewController: UIViewController {

    private let emojies = ["🔥", "🥰", "🥲", "👍", "👨‍🔬", "🤪", "🐸", "⚾️"]
    private let flowLayout = UICollectionViewFlowLayout()
    private let itemsPerRow: CGFloat = 4
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = flowLayout
        flowLayout.minimumLineSpacing = 20
        flowLayout.scrollDirection = .horizontal
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.label.text = emojies[indexPath.row]
        cell.backgroundColor = .systemYellow
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let flow = collectionViewLayout as! UICollectionViewFlowLayout
        let fourItem = view.frame.width

        return CGSize(width: fourItem, height: view.frame.height)
    }
}
