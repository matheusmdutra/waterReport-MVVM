//
//  TextField.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController : UITextFieldDelegate {
    
    func setupKeyboardThings() {
         hideKeyboardWhenTappedAround()
        
        // setting delegates
        passwordTextField.delegate = self
        emailTextField.delegate = self
        
        // setting notifications
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

