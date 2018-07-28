//
//  BaseViewController.swift
//  Water-Report
//
//  Created by Matheus Dutra on 07/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

//
//  BaseViewController.swift
//  MarvelApp
//
//  Created by Matheus Dutra on 21/04/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import Localize_Swift

protocol BaseProtocol : class  {
    func loadingData()
    func showError(message: String)
    func goToNextController(named: LoginDestinations)
    func loadedData()
    func readModel()
}

class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    var progressHUD: MBProgressHUD?
    
    fileprivate var internalScrollView: UIScrollView?
    
    // MARK: Methods
    
    func showLoading() {
        let topmostViewController = findTopmostViewController()
        progressHUD = MBProgressHUD.showAdded(to: topmostViewController.view, animated: true)
        progressHUD?.mode = MBProgressHUDMode.indeterminate
    }
    
    func hideLoading() {
        self.progressHUD?.hide(animated: true)
    }
    
    func showMessage(_ message: String?, withTitle title: String?) {
        let errorMessage = message ?? "GENERIC_ERROR_MESSAGE".localized()
        let errorTitle = title ?? "ERROR".localized()
        let errorController = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        errorController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(errorController, animated: true, completion: nil)
    }
    
    func showError(_ message: String?) {
        let errorMessage = message ?? "GENERIC_ERROR_MESSAGE".localized()
        let errorController = UIAlertController(title: "TITLE_ERROR".localized(), message: errorMessage, preferredStyle: .alert)
        errorController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(errorController, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    func txtPaddingVw(txt:UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        txt.leftViewMode = .always
        txt.leftView = paddingView
    }
    
  
    
    
    
    
    
}

//extension UIViewController: ReusableView { }

