//
//  LoginProtocol.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController : BaseProtocol {
    func readModel() {
        
    }
    
    func loadingData() {
        showLoading()
    }
    
    func loadedData() {
        hideLoading()
    }
    
    func goToNextController(named: LoginDestinations) {
        loadedData()
        self.router?.goToNextView(named: .mainScreen)
    }
    
    func showError(message: String) {
        loadedData()
        showMessage(message, withTitle: "Atenção")
    }
    
    
}
