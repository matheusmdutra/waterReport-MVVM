////
////  LoginRouter.swift
////  Water-Report
////
////  Created by Matheus Dutra on 13/05/2018.
////  Copyright © 2018 Matheus Dutra. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class LoginRouter {
//    
//    enum destinations : String {
//        case mainScreen
//        case newAccount
//        case forgotAccount
//    }
//    
//    var mainScreen = MyTabBarController()
//    static var sharedInstance = LoginRouter()
//    
//    func goToNextController(from: UIViewController, to: destinations) {
//        switch to {
//        case .mainScreen:
//           from.present(mainScreen, animated: true, completion: nil)
//        default:
//            print ("nil")
//        }
//        
//    }
//}
