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
    
    var delegate : BaseProtocol?
    
    var helper = FirebaseLoginHelper()
    
    var user : CurrentUser?
    
    init(delegate: BaseProtocol?) {
        self.delegate = delegate
    }
    
    func checkUserInfo(email: String?, password: String?) {
        
        if email?.count == 0 || password?.count == 0 {
            self.delegate?.showError(message: "Para realizar o login, é necessário o preenchimento de todos os campos")
            
        } else {
            guard let email = email else { return }
            guard let password = password else { return }
            let user = CurrentUser(name: "", email: email, password: password)
            self.user = user
            loginFirebase()
        }
    }
    
    func loginFirebase() {
        self.delegate?.loadingData()
        guard let user = user else { return }
        helper.signIn(email: user.email, password: user.password, success: {
            self.delegate?.loadedData()
            self.delegate?.goToNextController(named: .mainScreen)
        }) { (error) in
            self.delegate?.showError(message: error!)
        }
    }
}
