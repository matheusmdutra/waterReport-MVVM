//
//  MainScreenViewModel.swift
//  Water-Report
//
//  Created by Matheus Dutra on 13/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MainScreenViewModel {
    
    var delegate : mainScreenModelToView?
    var fireHelper = FirebaseDataHelper()

    func retrieveAllData() {
        FirebaseDataHelper.sharedInstance.retrieveAllData(success: { (myData) in
            var fireData = FirebaseData()
            fireData.billValue = (myData?.billValue)!
            fireData.literesPerMonth = (myData?.literesPerMonth)!
            fireData.litersPerDay = (myData?.litersPerDay)!
            fireData.saveRealm()
            self.delegate?.updateUI()
            
        }) { (error) in
            print (error)
        }
    }
}




