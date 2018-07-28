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
    
    var myData : Results<FirebaseData>!
    
    let realm = try! Realm()
    
    var collectionData = [
        CellDataMainScreen(image: #imageLiteral(resourceName: "today"), label: "Consumo\ndiário", value: 0),
        CellDataMainScreen(image: #imageLiteral(resourceName: "month"), label: "Consumo\nmensal", value: 0)
    ]
    
    var billValue = Double()
    var fireHelper = FirebaseDataHelper()
    
    var delegate : BaseProtocol?
    
    init(delegate: BaseProtocol?) {
        self.delegate = delegate
    }
    
    func startWorking() {
        retrieveAllData()
    }
    
    func setupData () {
        
        myData = realm.objects(FirebaseData.self)
        
        if myData.count > 0 {
            guard let data = myData.first else { return }
            collectionData[0].cellValue = data.litersPerDay
            collectionData[1].cellValue = data.literesPerMonth
            billValue = data.billValue
        }
        
        retrieveAllData()
    }
    func retrieveAllData() {
        
        delegate?.loadingData()
        FirebaseDataHelper.sharedInstance.retrieveAllData(success: { (myData) in
            
            let fireData = FirebaseData()
            if let myData = myData {
                
                self.collectionData[0].cellValue = myData.litersPerDay
                self.collectionData[1].cellValue = myData.literesPerMonth
                self.billValue = myData.billValue
                
                fireData.billValue = myData.billValue
                fireData.literesPerMonth = myData.literesPerMonth
                fireData.litersPerDay = myData.litersPerDay
                
                fireData.saveRealm()

                self.delegate?.loadedData()

            }
        }) { (error) in
            guard let error = error else { return }
            self.delegate?.showError(message: error.localized())
    }
}
}




