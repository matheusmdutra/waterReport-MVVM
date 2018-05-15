//
//  LoginViewModel.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginViewModel {
    var user = CurrentUser()
    var delegate : LoginView?
    var router : LoginRouter?
    
    
    func checkUserInfo(email: String?, password: String?) {
        if email?.count == 0 || password?.count == 0 {
        self.delegate?.showLoginError(message: "Para realizar o login, é necessário o preenchimento de todos os campos")
            user.email = ""
            user.password = ""
        } else {
            user.email = email
            user.password = password
            loginFirebase()
        }
    }
    
    func loginFirebase() {
        FirebaseLoginHelper.sharedInstance.signIn(email: user.email!, password: user.password!, success: {
            self.router?.goToNextController(named: .mainScreen)
        }) { (error) in
            self.delegate?.showLoginError(message: error!)
        }
    }
}
