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
    
    func retrieveDailyLiters (success: @escaping (_ liters: NSNumber?) -> Void  , failure: ((_ error: String?) -> Void)?) {
        
        ref.child( (usuario_definido?.uid)!).child("Litros Diarios").observe(.value, with: { (snapshot) in
            guard snapshot.exists() else {return}
            let liters = snapshot.value as? NSNumber
            success(liters)
        })
        { (error) in
            failure!(error.localizedDescription)
        }
    }
    
    func retreiveMonthLiters(success: @escaping (_ monthLiteres: NSNumber?) -> Void  , failure: ((_ error: String?) -> Void)?) {
        ref.child( (usuario_definido?.uid)!).child("Litros Mensais").observe(.value, with: { (snapshot) in
            guard snapshot.exists() else {return}
            let monthLiters = snapshot.value as? NSNumber
            success(monthLiters)
        })
        { (error) in
            failure!(error.localizedDescription)
        }
    }
    
    
    func retreiveBill(success: @escaping (_ billValue: NSNumber?) -> Void  , failure: ((_ error: String?) -> Void)?) {
        ref.child( (usuario_definido?.uid)!).child("Conta").observe(.value, with: { (snapshot) in
            guard snapshot.exists() else {return}
            let billValue = snapshot.value as? NSNumber
            success(billValue)
        })
        { (error) in
            failure!(error.localizedDescription)
        }
    }
}


