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
    @objc dynamic var litersPerDay : Double = 0
    @objc dynamic var literesPerMonth : Double = 0
    @objc dynamic var billValue : Double = 0
    @objc dynamic var primaryKey : String = "Primary"
    
    
    override class func primaryKey() -> String? {
        return "primaryKey"
    }
}


extension FirebaseData {
    
    func saveRealm() {
        let realm = try! Realm()
        
        do {
            
            try! realm.write {
                realm.add(self, update: true)
            }
        }
    }
}
