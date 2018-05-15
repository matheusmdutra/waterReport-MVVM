//
//  LoginContract.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation

protocol LoginView : class  {
    func showLoginError(message: String)
}

protocol LoginRouter : class {
    func goToNextController(named: destinations )
}

enum destinations : String {
    case mainScreen
    case newAccount
    case forgotAccount
}
