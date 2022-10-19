//
//  WZSHUD.swift
//  Example
//
//  Created by mntechMac on 2022/10/19.
//

import UIKit
import WZBaseComponents
import WZUIKit

enum WZSHUDType {
    case top, center
}


class WZSHUD: UIViewController {
    
    static let shared = UIStoryboard(name: "HUD", bundle: nil).instantiateViewController(withIdentifier: "WZSHUD") as! WZSHUD
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var indicatorDetailLabel: UILabel!
    
    @IBOutlet weak var centerStack: UIStackView!
    
    var msg: String?
    var hudType: WZSHUDType = .center
    
    var top: WZSHUDTOP?
    
    @IBOutlet weak var topHeightConstaint: NSLayoutConstraint!
    @IBOutlet weak var topConstaint: NSLayoutConstraint!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WZSHUDTOPVC" {
            top = segue.destination as? WZSHUDTOP
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideHud)))
        
        setMsgType(type: self.hudType)
        
        
    }
    
    func setMsgType(type: WZSHUDType) {
        
        
        switch type {
        case .top:
            topConstaint.constant = .wzStatusBarHeight
            self.top?.titleText.text = msg
            break
        case .center:
            
            if let label = indicatorDetailLabel {
                label.isHidden = msg == nil
                label.text = msg
            }
            if let activity = activityIndicator {
                activity.startAnimating()
            }
            break
        }
        if let centerStack = centerStack {
            centerStack.isHidden = type != .center
        }
        self.view.isUserInteractionEnabled = type == .top
        self.top?.view.isHidden = type != .top
        self.view.backgroundColor = .clear
    }
    
}


extension WZSHUD {
    
    @objc func hideHud() {
        self.activityIndicator.stopAnimating()
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hideHud), object: nil)
        self.dismiss(animated: true)
    }
    
    func hud() {
        
        show(.center, msg: nil, detail: nil)
    }
    
    func hud(msg: String) {
        show(.top, msg: msg, detail: nil)
    }
    
    func huding(msg: String) {
        show(.center, msg: msg, detail: nil)
    }
    
    func show(_ type: WZSHUDType, msg: String?, detail: String?) {
        
        var window: UIWindow!
        
        if #available(iOS 13.0, *) {
            guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let wd = scene.windows.first else { return }
            
            window = wd
            
        } else {
            window = UIApplication.shared.keyWindow
        }
        
        guard let rootViewController = window.rootViewController else { return }
        
        
        defer {

            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hideHud), object: nil)
            self.perform(#selector(hideHud), with: nil, afterDelay: 5)
        }
        
        self.hudType = type
        self.msg = msg
        setMsgType(type: type)
        
        self.modalPresentationStyle = .overFullScreen 
        self.modalTransitionStyle = .crossDissolve
        
        
        func presentFrom(nav: UINavigationController) {
            guard let topViewController = nav.topViewController else {
                return nav.present(self, animated: true)
            }
            topViewController.present(self, animated: true)
        }
        
        guard let navigationController = rootViewController.navigationController  else {
            
            if let nav = rootViewController as? UINavigationController {
                return presentFrom(nav: nav)
            }
            return rootViewController.present(self, animated: true)
        }
            
        presentFrom(nav: navigationController)
        
        
    }
}
