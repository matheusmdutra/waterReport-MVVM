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
 
    func setupComponents() {
         
        wrLogo = GlobalLayout.sharedInstance.createImageView(image: #imageLiteral(resourceName: "logo-short"), size: .init(width: 20, height: 20))
        topContainer = GlobalLayout.sharedInstance.createImageView(image: #imageLiteral(resourceName: "wallpaper"), size: .zero)
        menuLabel = GlobalLayout.sharedInstance.createLabel(text: "Previsões", fontName: "Optima", size: 23, color: .white)
        
        nPessoasIcon = GlobalLayout.sharedInstance.createImageView(image: #imageLiteral(resourceName: "person-icon-blue-7573"), size: .init(width: 40, height: 40))
        nPessoasLabel = GlobalLayout.sharedInstance.createLabel(text: "Teste", fontName: "Optima", size: 23, color: .darkBlue)
        nPessoasTwoPoints = GlobalLayout.sharedInstance.createLabel(text: ":", fontName: "Optima", size: 23, color: .darkBlue)
        nPessoasValue = GlobalLayout.sharedInstance.createLabel(text: "20L", fontName: "Optima", size: 23, color: .darkBlue)
        nPessoasStack = GlobalLayout.sharedInstance.createStack(distribution: .fill, spacing: 10, axis: .horizontal)
        nPessoasView = GlobalLayout.sharedInstance.genericView(stackView: nPessoasStack, imageView: nPessoasIcon, descriptionLabel: nPessoasLabel, twoPointsLabel: nPessoasTwoPoints, valueLabel: nPessoasValue)
    }
    func setupLayout() {
        view.backgroundColor = .white
        let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top
        let screenHeight = UIScreen.main.bounds.height
        print (screenHeight) // 667
       
        
        [topContainer,menuLabel,wrLogo, nPessoasView].forEach {view.addSubview($0)}
        
        topContainer.complexAnchor(top: view.topAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: (screenHeight * 0.08995502249) + topPadding!/4), centerYto: nil, centerXto: nil)
        menuLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuLabel.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor, constant: topPadding!/2).isActive = true
        wrLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        wrLogo.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor, constant: topPadding!/2).isActive = true
        nPessoasView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nPessoasView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true


    }
}
