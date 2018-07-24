//
//  Layout.swift
//  Water-Report
//
//  Created by Matheus Dutra on 10/06/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class GlobalLayout {
    
    static var sharedInstance = GlobalLayout()
    
    func createLabel (text: String, fontName: String , size: Double , color: UIColor) -> UILabel {
        let myLabel = UILabel()
        myLabel.text = text
        myLabel.textAlignment = .center
         myLabel.numberOfLines = 0
        myLabel.textColor = color
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font =  UIFont.init(name: fontName, size: CGFloat(size/812) * UIScreen.main.bounds.height)
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }

    
    func createImageView(image: UIImage, size: CGSize) -> UIImageView {
        let myIcon = UIImageView()
    
        myIcon.image = image

        if size.width != 0 {
            myIcon.widthAnchor.constraint(equalToConstant: size.width).isActive = true

        }
        if size.height != 0 {
            myIcon.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
       
        myIcon.translatesAutoresizingMaskIntoConstraints = false
        return myIcon
    }
    
    var topContainer : UIImageView = {
        var myTopContainer = UIImageView()
        myTopContainer.image = #imageLiteral(resourceName: "wallpaper")
        myTopContainer.translatesAutoresizingMaskIntoConstraints = false
        return myTopContainer
    }()
    
    func createView(cornerRadius: CGFloat, color: UIColor) -> UIView {
        let mView = UIView()
        mView.layer.cornerRadius = cornerRadius
        mView.layer.borderWidth = 1
        mView.layer.borderColor = color.cgColor
        mView.translatesAutoresizingMaskIntoConstraints = false
        return mView
    }
    
    
    func createStack (distribution: UIStackViewDistribution , spacing: Double, axis: UILayoutConstraintAxis) -> UIStackView {
        let myStack = UIStackView()
        myStack.spacing = CGFloat(spacing)
        myStack.axis = axis
        myStack.distribution = distribution
        myStack.translatesAutoresizingMaskIntoConstraints = false
        return myStack
    }
    
  
    
    func genericView(stackView: UIStackView, imageView: UIImageView , descriptionLabel: UILabel, twoPointsLabel: UILabel, valueLabel: UILabel) -> UIView {
        
       
        
        let iconContainerView = UIView()
        let labelContainerView = UIView()
        let twoPointsContainerView = UIView()
        let valueContainerView = UIView()
        let mainView = UIView()
    
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
