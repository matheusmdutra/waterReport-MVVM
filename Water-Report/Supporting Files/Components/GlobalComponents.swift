//
//  GlobalComponents.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class GlobalComponents {
    
    func createViewWith(backgroundColor: UIColor?) -> UIView {
        let mView = UIView()
        mView.backgroundColor = backgroundColor
        mView.translatesAutoresizingMaskIntoConstraints = false
        return mView
    }
    
    func createImageViewWith(image: UIImage?, contentMode: UIViewContentMode?, sizeOfImage: CGSize = .zero) -> UIImageView {
        let mImageView = UIImageView()
        mImageView.image = image
        mImageView.translatesAutoresizingMaskIntoConstraints = false
        if contentMode != nil { mImageView.contentMode = contentMode! }
        if sizeOfImage.height != 0 { mImageView.heightAnchor.constraint(equalToConstant: sizeOfImage.height).isActive = true }
        if sizeOfImage.width != 0 { mImageView.widthAnchor.constraint(equalToConstant: sizeOfImage.width).isActive = true }
        
        return mImageView
    }
    
    func createTextFieldWith(text: String, placeHolder: String, keyboardType: UIKeyboardType, backgroundColor: UIColor, font: AppFonts, corner : CGFloat) -> UITextField {
        let mTextField = UITextField()
        mTextField.backgroundColor = backgroundColor
        mTextField.translatesAutoresizingMaskIntoConstraints = false
        mTextField.keyboardType = keyboardType
        mTextField.text = text
        mTextField.placeholder = placeHolder
        mTextField.sizeToFit()
        mTextField.layer.borderColor = UIColor.black.cgColor
        mTextField.layer.borderWidth = 0.1
        mTextField.font = UIFont().retrieveAppFont(named: font)
        mTextField.layer.cornerRadius = corner * App().proportion
        return mTextField
    }
    
    func createStackView(axis: UILayoutConstraintAxis, spacing: CGFloat, distribution: UIStackViewDistribution) -> UIStackView {
        let mStack = UIStackView()
        mStack.spacing = spacing
        mStack.axis = axis
        mStack.distribution = distribution
        mStack.translatesAutoresizingMaskIntoConstraints = false
        return mStack
    }
    
    func createButtom(title: String?, titleColor: UIColor?,font: AppFonts, backColor: UIColor, corner: CGFloat) -> UIButton {
        let mLoginButton = UIButton()
        mLoginButton.translatesAutoresizingMaskIntoConstraints = false
        mLoginButton.setTitle(title, for: .normal)
        mLoginButton.titleLabel?.font = UIFont().retrieveAppFont(named: font)
        mLoginButton.sizeToFit()
        mLoginButton.backgroundColor = backColor
        mLoginButton.layer.cornerRadius = corner * App().proportion
        mLoginButton.titleLabel?.textColor = titleColor
        mLoginButton.setTitleColor(titleColor, for: .normal)
        mLoginButton.titleLabel?.textAlignment = .center
        return mLoginButton
    }
    
    func createSimpleLabel(text: String, textColor: UIColor, font: AppFonts) -> UILabel {
        let mLabel = UILabel()
        mLabel.text = text
        mLabel.adjustsFontSizeToFitWidth = true
        mLabel.font =  UIFont().retrieveAppFont(named: font)
        mLabel.textColor = textColor
        mLabel.sizeToFit()
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        return mLabel
    }
    
    func createPageControl(numberOfPages: Int, currentColor: UIColor, indicatorColor: UIColor) -> UIPageControl {
        let myPageControl = UIPageControl()
        myPageControl.currentPage = 0
        myPageControl.numberOfPages = numberOfPages
        myPageControl.currentPageIndicatorTintColor = currentColor
        myPageControl.pageIndicatorTintColor = indicatorColor
        myPageControl.translatesAutoresizingMaskIntoConstraints = false
        return myPageControl
    }
    
    }
