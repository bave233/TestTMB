//
//  BaseViewController.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//

import Foundation
import SVProgressHUD
import UIKit

class BaseViewController: UIViewController {
    func showHudBlackCover() {
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
            if self.navigationController?.tabBarController != nil {
                SVProgressHUD.setContainerView(self.navigationController?.tabBarController?.view)
                self.navigationController?.tabBarController?.view.isUserInteractionEnabled = false
            } else if self.navigationController != nil {
                SVProgressHUD.setContainerView(self.navigationController?.view)
                self.navigationController?.view.isUserInteractionEnabled = false
            } else {
                SVProgressHUD.setContainerView(self.view)
                self.view.isUserInteractionEnabled = false
            }
            SVProgressHUD.setBackgroundColor(.white)
            SVProgressHUD.setDefaultMaskType(.black)
            SVProgressHUD.setForegroundColor(UIColor.red)
            SVProgressHUD.setRingNoTextRadius(30)
            SVProgressHUD.setRingThickness(10)
            SVProgressHUD.show()
        }
    }
    
    func showHud(inView view: UIView? = nil) {
        DispatchQueue.main.async {
            SVProgressHUD.setContainerView(view ?? self.view)
            SVProgressHUD.setDefaultMaskType(.clear)
            SVProgressHUD.setBackgroundColor(UIColor.clear)
            SVProgressHUD.setForegroundColor(UIColor.red)
            SVProgressHUD.setRingNoTextRadius(30)
            SVProgressHUD.setRingThickness(10)
            SVProgressHUD.show()
        }
    }
    
    func hideHud() {
        self.navigationController?.tabBarController?.view.isUserInteractionEnabled = true
        self.navigationController?.view.isUserInteractionEnabled = true
        self.view.isUserInteractionEnabled = true
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
