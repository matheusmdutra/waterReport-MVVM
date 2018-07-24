//
//  BaseProtocols.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation

protocol BaseProtocols: class {
    associatedtype T
    func willLoadData()
    func didLoadData(response: loadedData)
    func receivedData(_: T)
    func showError(named: Error?)
}

enum loadedData {
    
    case retrieved
    case withError
}
