//
//  FirebaseErrors.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import Firebase

class FirebaseErrors {
    static var sharedInstance = FirebaseErrors()
    var lastError : String?
    func fireErrorHandle(code: FIRAuthErrorCode) -> String {
        switch code {
        case .errorCodeInvalidEmail:
            return "Email inválido"
        case .errorCodeWrongPassword:
            return "Senha inválida"
        default:
            return "Verifique seus dados e tente novamente"
        }
    }
}
