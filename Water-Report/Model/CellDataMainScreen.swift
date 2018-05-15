//
//  CellDataMainScreen.swift
//  Water-Report
//
//  Created by Matheus Dutra on 15/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

struct CellDataMainScreen {
    var iconImage: UIImage
    var cellLabel : String
    var cellValue : NSNumber?
    
    init(image: UIImage, label: String, value: NSNumber?) {
        iconImage = image
        cellLabel = label
        cellValue = value
    }
}
