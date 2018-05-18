//
//  FirebaseData.swift
//  Water-Report
//
//  Created by Matheus Dutra on 14/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import RealmSwift

class FirebaseData : Object {
    @objc dynamic var litersPerDay : NSNumber = 0
    @objc dynamic var literesPerMonth : NSNumber = 0
    @objc dynamic var billValue : NSNumber = 0
}
