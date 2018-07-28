//
//  AppRules.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class App {
    var deviceForLayout = deviceModel.iphone7  // Choose your device model for Layout.
    
    lazy var proportion : CGFloat = {
        return  (UIScreen.main.bounds.height / deviceForLayout.rawValue)
    }()
}

enum deviceModel : CGFloat {
    case iphone7 = 736
}

enum AppFonts {
    case normal
    case normalNegrito
    case header
    case headerNegrito
    case small
    case smallBlack
    case smallest
}





