//
//  UIFont.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension UIFont  {
    func retrieveAppFont(named: AppFonts) -> UIFont {
        switch named {
        case .normal:
            return UIFont.systemFont(ofSize: App().proportion * 14)
        case .small:
            return UIFont.systemFont(ofSize: App().proportion * 13)
        case .smallest:
            return UIFont.systemFont(ofSize: App().proportion * 12)
        case .headerNegrito:
            return UIFont.boldSystemFont(ofSize: App().proportion * 20)
        case .header:
            return UIFont.systemFont(ofSize: App().proportion * 20)
        default:
            return UIFont.systemFont(ofSize: App().proportion * 15)
        }
    }
}
