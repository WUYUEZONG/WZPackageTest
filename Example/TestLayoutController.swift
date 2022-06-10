//
//  TestLayoutController.swift
//  Example
//
//  Created by mntechMac on 2022/6/10.
//

import UIKit
import WZUIKit
import WZBaseComponents

class TestLayoutController: WZUICollectionController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {

            collection.contentInsetAdjustmentBehavior = .never
            wzNavgationView.wzBackItem.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        
        
        let l = WZPageEnableLayout()
        l.itemSize = CGSize(width: .wzScreenWidth * 0.8, height: .wzScreenHeight * 0.7)
        l.targetAlign = .center//.leading(spacing: 16)
        l.scrollDirection = .horizontal
        l.decelerationRate = .normal
        
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: l)
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
