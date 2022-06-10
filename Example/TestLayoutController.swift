//
//  TestLayoutController.swift
//  Example
//
//  Created by mntechMac on 2022/6/10.
//

import UIKit
import WZUIKit

class TestLayoutController: WZUICollectionController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let l = WZPageEnableLayout()
        l.itemSize = CGSize(width: .wzScreenWidth * 0.8, height: .wzScreenHeight * 0.8)
        l.targetAlign = .leading(spacing: 16)
        l.scrollDirection = .horizontal
        l.decelerationRate = .normal
        collection.setCollectionViewLayout(l, animated: false)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 99
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.contentView.backgroundColor = .randomColor(60)
        cell.contentView.layer.cornerRadius = 12
        return cell
    }
    
}
