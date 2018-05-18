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
    
    
    var fireData = FirebaseData()
    var fireHelper = FirebaseDataHelper()
    var delegate : mainScreenModelToView?
    let realm = try! Realm()
    
    var cellData1 = CellDataMainScreen(image: #imageLiteral(resourceName: "today"), label: "Consumo\ndiário", value: nil)
    var cellData2 = CellDataMainScreen(image: #imageLiteral(resourceName: "month"), label: "Consumo\nmensal", value: nil)
    var collectionData = [CellDataMainScreen]()
    
    func retrieveData() {
    
            // Retrieving Daily Liters
            FirebaseDataHelper.sharedInstance.retrieveDailyLiters(success: { (dailyLiters) in
                if let myDailyLiters = dailyLiters {
                    self.fireData.litersPerDay =  myDailyLiters
                    self.cellData1.cellValue = myDailyLiters
                }
            }) { (error) in
                print ("Error")
            }
            
            // Retrieving Month Liters
            FirebaseDataHelper.sharedInstance.retreiveMonthLiters(success: { (monthLiters) in
                if let myLitersPerMonth = monthLiters {
                    self.fireData.literesPerMonth =  myLitersPerMonth
                    self.cellData2.cellValue = myLitersPerMonth
                }
            }) { (error) in
                print ("Error")
            }
            
            // Retrieving Bill Value
            FirebaseDataHelper.sharedInstance.retreiveBill(success: { (billValues) in
                if let myBillValue = billValues {
                    self.fireData.billValue =  myBillValue
                }
            }) { (error) in
                print ("Error")
            }
         DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.collectionData.append(self.cellData1)
            self.collectionData.append(self.cellData2)
            self.saveRealm(firebaseData: self.fireData)

            self.delegate?.updateUI(with: self.fireData, collectionData: self.collectionData)
    }
    }
    
    func saveRealm(firebaseData: FirebaseData) {
        
    
        do {
           try! realm.write {
                realm.add(firebaseData)
            }
        }
        catch {
            print ("Error saving category: \(error)")
        }
    
    }
}
    
    
    

