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
        
        
//        let l = WZPageEnableLayout()
        let l = WZWaterFlowLayout()
        l.delegate = self
        l.rowSpacing = 10

        collection.contentInset.top = .wzStatusWithNavgationBarHeight
        collection.setCollectionViewLayout(l, animated: false)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.contentView.backgroundColor = .randomColor(60)
        cell.contentView.layer.cornerRadius = 12
        return cell
    }
    
    
}

extension TestLayoutController: WZWaterFlowLayoutDelegate {
    
    func layoutItemHeight(at indexPath: IndexPath) -> CGFloat {
        let h = CGFloat(arc4random_uniform(200) + 100)
        return h
    }
    
}
