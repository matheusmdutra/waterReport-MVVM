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
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                if user != nil  {
                    FirebaseLoginHelper.sharedInstance.userEmail = email
                    FirebaseLoginHelper.sharedInstance.userPassword = password
                    FirebaseLoginHelper.sharedInstance.userUID = FIRAuth.auth()?.currentUser?.uid
                    success?()
                } else {
                    FirebaseErrors.sharedInstance.lastError = error?.localizedDescription
                    failure!(error?.localizedDescription)
                }
            } else {
                guard let error = FIRAuthErrorCode(rawValue: (error?._code)!) else {return}
                let result = FirebaseErrors.sharedInstance.fireErrorHandle(code: error)
                FirebaseErrors.sharedInstance.lastError = result
                failure!(result)
            }
        }
    }
}
