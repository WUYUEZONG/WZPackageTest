//
//  WZSHUDTOP.swift
//  Example
//
//  Created by mntechMac on 2022/10/19.
//

import UIKit


class WZSHUDTOP: UIViewController {
    
    @IBOutlet weak var contentStack: UIStackView!
    
    @IBOutlet weak var titleContent: UILabel!
    
    @IBOutlet weak var detailContent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.95)
        view.layer.borderColor = UIColor(white: 0.9, alpha: 1).cgColor
        view.layer.borderWidth = 0.5
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.cornerRadius = view.frame.height / 2
    }
    
}


extension WZSHUDTOP {
    
    var detailText: UILabel {
        self.detailContent.isHidden = false
        return detailContent
    }
    
    var titleText: UILabel {
        self.titleContent.isHidden = false
        return titleContent
    }
}
