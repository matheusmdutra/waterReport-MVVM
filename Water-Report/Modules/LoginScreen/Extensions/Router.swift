//
//  Router.swift
//  Water-Report
//
//  Created by Matheus Dutra on 13/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController : LoginRouter {
    func goToNextController(named: destinations) {
        switch named {
        case .mainScreen:
            self.present(MyTabBarController(), animated: true, completion: nil)
        default:
            print ("nil")
        }
    }
}



