//
//  PredictionsComponents.swift
//  Water-Report
//
//  Created by Matheus Dutra on 28/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class PredictionsComponents {
    
    func genericView(stackView: UIStackView, imageView: UIImageView , descriptionLabel: UILabel, twoPointsLabel: UILabel, valueLabel: UILabel) -> UIView {
        
        let iconContainerView = UIView()
        let labelContainerView = UIView()
        let twoPointsContainerView = UIView()
        let valueContainerView = UIView()
        let mainView = UIView()
        mainView.layer.cornerRadius = 10
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        iconContainerView.addSubview(imageView)
        labelContainerView.addSubview(descriptionLabel)
        twoPointsContainerView.addSubview(twoPointsLabel)
        valueContainerView.addSubview(valueLabel)
        
        stackView.addArrangedSubview(iconContainerView)
        stackView.addArrangedSubview(labelContainerView)
        stackView.addArrangedSubview(twoPointsContainerView)
        stackView.addArrangedSubview(valueContainerView)
        mainView.addSubview(stackView)
        
        
        imageView.complexAnchor(top: iconContainerView.topAnchor, bottom: iconContainerView.bottomAnchor, left: iconContainerView.leadingAnchor, right: iconContainerView.trailingAnchor, centerYto: nil, centerXto: nil)
        descriptionLabel.complexAnchor(top: labelContainerView.topAnchor, bottom: labelContainerView.bottomAnchor, left: labelContainerView.leadingAnchor, right: labelContainerView.trailingAnchor, centerYto: nil, centerXto: nil)
        twoPointsLabel.complexAnchor(top: twoPointsContainerView.topAnchor, bottom: twoPointsContainerView.bottomAnchor, left: twoPointsContainerView.leadingAnchor, right: twoPointsContainerView.trailingAnchor, centerYto: nil, centerXto: nil)
        valueLabel.complexAnchor(top: valueContainerView.topAnchor, bottom: valueContainerView.bottomAnchor, left: valueContainerView.leadingAnchor, right: valueContainerView.trailingAnchor, centerYto: nil, centerXto: nil)
        stackView.complexAnchor(top: mainView.topAnchor, bottom: mainView.bottomAnchor, left: mainView.leadingAnchor, right: mainView.trailingAnchor, centerYto: nil, centerXto: nil)
        
        return mainView
    }
}
