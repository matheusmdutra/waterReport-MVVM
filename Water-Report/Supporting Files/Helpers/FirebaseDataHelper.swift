//
//  FirebaseDataHelper.swift
//  Water-Report
//
//  Created by Matheus Dutra on 13/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class FirebaseDataHelper {
    
    static var sharedInstance = FirebaseDataHelper()
    
    // Firebase reference
    let usuario_definido = FIRAuth.auth()?.currentUser
    var ref = FIRDatabase.database().reference().child("Clientes")
    var firebaseData = FirebaseData()
    var myDictionary = [String : Any]()
    
    func retrieveAllData (success: @escaping (_ data: FirebaseData?) -> Void , failure: ((_ error: String?) -> Void)?) {
        
        print("\n\n#################### Starting Retriving FirebaseData ####################")
        
        guard let uid = usuario_definido?.uid else { return failure!("Infelizmente um erro inesperado aconteceu.") }
        
        ref.child((uid)).observe(.value, with: { (snapshot) in
            for snap in snapshot.children.allObjects as! [FIRDataSnapshot] {
                self.myDictionary[snap.key] = snap.value
            }
            
            self.firebaseData = FirebaseData(
                litersPerDay:  self.myDictionary["Litros Diarios"] as? Double ?? 0,
                litersPerMonth: self.myDictionary["Litros Mensais"] as? Double ?? 0,
                billValue: self.myDictionary["Conta"] as? Double ?? 0
            )
            debugPrint("Month Liters: \(self.firebaseData.literesPerMonth)")
            debugPrint("Daily Liters: \(self.firebaseData.litersPerDay)")
            debugPrint("Bill Value: \(self.firebaseData.billValue)")

            debugPrint("#################### END ####################")
            success(self.firebaseData)
            
        }) { (error) in
            debugPrint("#################### END ####################")
            failure!(error.localizedDescription)
        }
        
    }
    func retrieveDailyLiters (success: @escaping (_ liters: Double?) -> Void  , failure: ((_ error: String?) -> Void)?) {
        
        ref.child( (usuario_definido?.uid)!).child("Litros Diarios").observe(.value, with: { (snapshot) in
            guard snapshot.exists() else {return}
            let liters = snapshot.value as? Double
            success(liters)
        })
        { (error) in
            failure!(error.localizedDescription)
        }
    }
    
    func retreiveMonthLiters(success: @escaping (_ monthLiteres: Double?) -> Void  , failure: ((_ error: String?) -> Void)?) {
        ref.child( (usuario_definido?.uid)!).child("Litros Mensais").observe(.value, with: { (snapshot) in
            guard snapshot.exists() else {return}
            let monthLiters = snapshot.value as? Double
            success(monthLiters)
        })
        { (error) in
            failure!(error.localizedDescription)
        }
    }
    
    
    func retreiveBill(success: @escaping (_ billValue: Double?) -> Void  , failure: ((_ error: String?) -> Void)?) {
        
        guard let uid = usuario_definido?.uid else { return failure!("Infelizmente um erro inesperado aconteceu.") }
        
        ref.child(uid).child("Conta").observe(.value, with: { (snapshot) in
            guard snapshot.exists() else {return}
            let billValue = snapshot.value as? Double
            success(billValue)
        })
        { (error) in
            failure!(error.localizedDescription)
        }
    }
}


