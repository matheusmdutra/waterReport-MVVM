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
        
        // Adding Containers
        view.addSubview(topContainer)
        view.addSubview(middleContainer)
        view.addSubview(bottomContainer)
        
        // Top Container - subviews
        topContainer.addSubview(topWallpaper)
        topContainer.addSubview(topLogo)
  
        
        // Middle Container - subviews
        textFieldStack.addArrangedSubview(emailTextField)
        textFieldStack.addArrangedSubview(passwordTextField)
        txtPaddingVw(txt: emailTextField)
        txtPaddingVw(txt: passwordTextField)
        middleContainer.addSubview(textFieldStack)
        
        // Bottom Container - subviews
        bottomContainer.addSubview(loginButton)
        forgotStack.addArrangedSubview(forgotPasswordLabel)
        forgotStack.addArrangedSubview(forgotPasswordButton)
        bottomContainer.addSubview(forgotStack)
        bottomContainer.addSubview(lineView)
        newAccountStack.addArrangedSubview(newAccountLabel)
        newAccountStack.addArrangedSubview(newAccountButton)
        bottomContainer.addSubview(newAccountStack)
        bottomContainer.addSubview(lineView)
        
        
        NSLayoutConstraint.activate([
            
            // Setting Top Container
            topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            topContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Setting Middle Container
            middleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            middleContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor),
            middleContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Setting Bottom Container
            bottomContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
            bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Setting Top Wallpaper
            topWallpaper.topAnchor.constraint(equalTo: topContainer.topAnchor),
            topWallpaper.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor),
            topWallpaper.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor),
            topWallpaper.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor),
            
            // Setting Top Logo
            topLogo.centerXAnchor.constraint(equalTo: topWallpaper.centerXAnchor),
            topLogo.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor),
            topLogo.heightAnchor.constraint(equalTo: topWallpaper.heightAnchor, multiplier: 0.5),
            topLogo.widthAnchor.constraint(equalTo: topWallpaper.widthAnchor, multiplier: 0.5),

            // Setting TextFields Stack
            textFieldStack.centerYAnchor.constraint(equalTo: middleContainer.centerYAnchor),
            textFieldStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
             textFieldStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textFieldStack.topAnchor.constraint(equalTo: middleContainer.topAnchor, constant: 45),
            textFieldStack.bottomAnchor.constraint(equalTo: middleContainer.bottomAnchor, constant: -45),
            
            // Setting Login Button
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.topAnchor.constraint(equalTo: middleContainer.bottomAnchor),
            loginButton.heightAnchor.constraint(equalTo: textFieldStack.heightAnchor, multiplier: 0.5, constant: -10),
          
            // Setting Forgot Stack
            forgotStack.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            forgotStack.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            forgotStack.widthAnchor.constraint(lessThanOrEqualTo: bottomContainer.widthAnchor, multiplier: 0.8),

            
            // Setting Account Stack
           
            newAccountStack.centerXAnchor.constraint(equalTo: bottomContainer.centerXAnchor),
            newAccountStack.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: -10),
            
            // Setting Line View
            
            lineView.bottomAnchor.constraint(equalTo: newAccountStack.topAnchor, constant: -9),
            lineView.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
            
            
            ])
    }
}

