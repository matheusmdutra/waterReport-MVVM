//
//  ReceivedData.swift
//  Water-Report
//
//  Created by Matheus Dutra on 14/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension MainScreenController : mainScreenModelToView {
    func updateUI(with data: FirebaseData?, collectionData: [CellDataMainScreen?]) {
        if let newData = data {
            myData = newData
        }
        myCollectionData = collectionData as! [CellDataMainScreen]
        collectionView.reloadData()
        hideLoading()
    }
    
    
    
}
