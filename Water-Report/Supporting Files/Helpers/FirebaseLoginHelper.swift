//
//  FirebaseLoginHelper.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import Firebase

class FirebaseLoginHelper {
    
    static var sharedInstance = FirebaseLoginHelper()
    var userUID : String?
    var userEmail : String?
    var userPassword : String?
    
    func signIn(email: String, password: String, success: (() -> Void)?, failure: ((_ error: String?) -> Void)?) {
        
        debugPrint("#################### Starting Login in Firebase ####################")
        debugPrint("User: \(email)")
        debugPrint("Password: \(password)")
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                FirebaseLoginHelper.sharedInstance.userEmail = email
                FirebaseLoginHelper.sharedInstance.userPassword = password
                FirebaseLoginHelper.sharedInstance.userUID = FIRAuth.auth()?.currentUser?.uid
                debugPrint("\(email) now is logged :)")
                debugPrint("#################### Login END ####################")
                success?()
            } else {
                guard let error = error else { return }
                guard let codeError = FIRAuthErrorCode(rawValue: (error._code)) else {return}
                let result = FirebaseErrors.sharedInstance.fireErrorHandle(code: codeError)
                FirebaseErrors.sharedInstance.lastError = result
                debugPrint("Error founded: \(error.localizedDescription)")
                debugPrint("#################### Login END ####################")
                failure!(result)
            }
        }
    }
}
