//
//  LoginProtocol.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController : LoginView {
    
    func showLoginError(message: String) {
         showMessage(message, withTitle: "Atenção")
    }
    
    func goToNextView() {
        
    }
    
}
