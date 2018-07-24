//
//  ReceivedData.swift
//  Water-Report
//
//  Created by Matheus Dutra on 14/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension MainScreenController : BaseProtocol {
    
    func loadingData() {
        showLoading()
    }
    
    func showLoginError(message: String) {
        hideLoading()
    }
    
    func goToNextController(named: LoginDestinations) {
        
    }
    
    func loadedData() {
        hideLoading()
    }
    
    


  
    
    
    
}
