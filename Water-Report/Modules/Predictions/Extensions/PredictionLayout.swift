//
//  PredictionLayout.swift
//  Water-Report
//
//  Created by Matheus Dutra on 12/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension PredictionViewController {
    
    func setupLayout() {
        
        view.addSubview(topContainer)
        topContainer.addSubview(menuLabel)
        topContainer.addSubview(wrLogo)
        
        NSLayoutConstraint.activate([
            
            // Setting Top Container
            topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            topContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Setting Menu Label
            menuLabel.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor),
            menuLabel.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor, constant: 5),
            
            wrLogo.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor, constant: -15),
            wrLogo.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor, constant: 5),
        
        ])
    }
}
