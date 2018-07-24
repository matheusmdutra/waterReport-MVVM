//
//  Layout.swift
//  Water-Report
//
//  Created by Matheus Dutra on 07/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func setupViewLayout() {
        
        let heightOfSafeAreaIphoneX = UIApplication.shared.keyWindow?.safeAreaInsets.top
        
        let appProportion = App().proportion
        
        [topContainer,middleContainer,bottomContainer,newAccountStackView].forEach{view.addSubview($0)}

        [topWallpaper,topLogo].forEach{topContainer.addSubview($0)}
      
        [emailTextField,passwordTextField].forEach{textFieldStack.addArrangedSubview($0)}
        
        [emailTextField,passwordTextField].forEach{txtPaddingVw(txt: $0)}
        
        middleContainer.addSubview(textFieldStack)
        
        // Bottom Container - subviews
        bottomContainer.addSubview(loginButton)
        
        [forgotPasswordLabel,forgotPasswordButton].forEach{forgotStack.addArrangedSubview($0)}
        
        [forgotStack,lineView].forEach{bottomContainer.addSubview($0)}
        
        [newAccountLabel,newAccountButton].forEach{newAccountStack.addArrangedSubview($0)}
        
        [lineView].forEach{bottomContainer.addSubview($0)}
        
        newAccountStackView.addSubview(newAccountStack)
        
        topContainer.simpleAnchor(top: view.safeTopAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: view.bounds.height * 0.25 - (heightOfSafeAreaIphoneX ?? 0)))
        
        middleContainer.simpleAnchor(top: topContainer.bottomAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: view.bounds.height * 0.27))
        
        bottomContainer.simpleAnchor(top: nil, bottom: view.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: view.bounds.height * 0.48))
        
        topWallpaper.anchorEqualTo(view: topContainer)

        topLogo.complexAnchor(top: nil, bottom: nil, left: nil, right: nil, padding: .zero, size: .init(width: 80 * appProportion, height: 80 * App().proportion), centerYto: topContainer, centerXto: topWallpaper)
        
        textFieldStack.complexAnchor(top: nil, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .init(top: 0, left: 30, bottom: 0, right: 30), size: .init(width: 100 * App().proportion, height: 100 * appProportion), centerYto: middleContainer, centerXto: nil)
        
        loginButton.simpleAnchor(top: middleContainer.bottomAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .init(top: 0, left: 30, bottom: 0, right: 30), size: .init(width: 0, height: 40 * appProportion))
        
        forgotStack.complexAnchor(top: loginButton.bottomAnchor, bottom: nil, left: nil, right: nil, padding: .init(top: 15 * App().proportion, left: 0, bottom: 0, right: 0), size: .init(width: bottomContainer.bounds.width * 0.8, height: 0), centerYto: nil, centerXto: loginButton)
        
        newAccountStackView.simpleAnchor(top: lineView.bottomAnchor, bottom: view.safeBottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .zero)
        
        newAccountStack.complexAnchor(top: nil, bottom: nil, left: nil, right: nil, padding: .zero, size: .zero, centerYto: newAccountStackView, centerXto: newAccountStackView)
        
        lineView.simpleAnchor(top: nil, bottom: newAccountStack.topAnchor, left: bottomContainer.leadingAnchor, right: bottomContainer.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 5, right: 0), size: .init(width: 0, height: 1))
        
    }
}

