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
    
    func readModel() {
        realsLabel.text =  "R$ \(viewModel.billValue)"
        collectionView.reloadData()
    }
    
    func loadingData() {
        showLoading()
    }
    
    func showError(message: String) {
        hideLoading()
    }
    
    func goToNextController(named: LoginDestinations) {
        
    }
    
    func loadedData() {
        readModel()
        hideLoading()
    }
    
    


  
    
    
    
}
