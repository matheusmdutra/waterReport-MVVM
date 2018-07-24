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
        ref.child( (usuario_definido?.uid)!).observe(.value, with: { (snapshot) in
            for snap in snapshot.children.allObjects as! [FIRDataSnapshot] {
                self.myDictionary[snap.key] = snap.value
            }
            self.firebaseData.billValue = self.myDictionary["Conta"] as! Double
            self.firebaseData.literesPerMonth = self.myDictionary["Litros Diarios"] as! Double
            self.firebaseData.litersPerDay = self.myDictionary["Litros Mensais"]! as! Double
            success(self.firebaseData)
        }) { (error) in
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
        ref.child( (usuario_definido?.uid)!).child("Conta").observe(.value, with: { (snapshot) in
            guard snapshot.exists() else {return}
            let billValue = snapshot.value as? Double
            success(billValue)
        })
        { (error) in
            failure!(error.localizedDescription)
        }
    }
}


