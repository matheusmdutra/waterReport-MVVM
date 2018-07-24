//
//  LoginScreenRouter.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit
import Foundation

struct LoginScreenRouter {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let controller = LoginViewController()
        let viewController = controller
        
        var router = LoginScreenRouter()
        router.viewController = viewController
        viewController.router = router
        
        return viewController
    }
    
    func goToNextView(named: LoginDestinations ) {
        switch named {
        case .mainScreen:
            self.viewController?.present(MyTabBarController(), animated: true, completion: nil)
        }
    }
}

enum LoginDestinations {
    case mainScreen
}
