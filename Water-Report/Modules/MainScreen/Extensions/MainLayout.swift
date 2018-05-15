//
//  MainLayout.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension MainScreenController {
    func setupLayout() {
     
        view.addSubview(topContainer)
        view.addSubview(middleContainer)
        view.addSubview(bottomContainer)
        
        topContainer.addSubview(menuLabel)
        topContainer.addSubview(wrLogo)
        
        middleContainer.addSubview(collectionView)
        middleContainer.addSubview(pageControl)
        middleContainer.addSubview(touchIcon)
        
        
        let billIconContainerView = UIView()
        let billLabelContainerView = UIView()
        let twoPointsContainerView = UIView()
        let numberOfRealsContainerView = UIView()
        
        
        billStack.addArrangedSubview(billIconContainerView)
        billStack.addArrangedSubview(billLabelContainerView)
        billStack.addArrangedSubview(twoPointsContainerView)
        billStack.addArrangedSubview(numberOfRealsContainerView)
        billView.addSubview(billStack)
        middleContainer.addSubview(billView)
        middleContainer.addSubview(billIcon)
        middleContainer.addSubview(billLabel)
        middleContainer.addSubview(twoPoints)
        middleContainer.addSubview(realsLabel)
        
        historicoStack.addArrangedSubview(historicIcon)
        historicoStack.addArrangedSubview(historicLabel)
        historicView.addSubview(historicoStack)

        
        previsaoStack.addArrangedSubview(previsaoIcon)
        previsaoStack.addArrangedSubview(previsaoLabel)
        previsaoView.addSubview(previsaoStack)
      
        buttonStack.addArrangedSubview(historicView)
        buttonStack.addArrangedSubview(previsaoView)
        
        bottomContainer.addSubview(buttonStack)
        
        
        
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
            
            // Setting Middle Container
            middleContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.46),
            middleContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor),
            middleContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            middleContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            collectionView.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: middleContainer.trailingAnchor, constant: -30),
            collectionView.leadingAnchor.constraint(equalTo: middleContainer.leadingAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10),
         
            
            pageControl.centerXAnchor.constraint(equalTo: middleContainer.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: middleContainer.centerYAnchor),
//            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5),
            
            touchIcon.leadingAnchor.constraint(equalTo: pageControl.trailingAnchor, constant: 11.5),
            touchIcon.centerYAnchor.constraint(equalTo: middleContainer.centerYAnchor),
            
            // Setting Bill Stack
            
            billView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 10),
        
              billView.leadingAnchor.constraint(equalTo: middleContainer.leadingAnchor, constant: 30),
               billView.trailingAnchor.constraint(equalTo: middleContainer.trailingAnchor, constant: -30),
               billView.bottomAnchor.constraint(equalTo: middleContainer.bottomAnchor, constant: -20),
            

            
            billStack.centerXAnchor.constraint(equalTo: billView.centerXAnchor),
            billStack.centerYAnchor.constraint(equalTo: billView.centerYAnchor),
            


            billIcon.leadingAnchor.constraint(equalTo: billIconContainerView.leadingAnchor),
            billIcon.trailingAnchor.constraint(equalTo: billIconContainerView.trailingAnchor),
            billIcon.topAnchor.constraint(equalTo: billIconContainerView.topAnchor),
            billIcon.bottomAnchor.constraint(equalTo: billIconContainerView.bottomAnchor),

            billLabel.leadingAnchor.constraint(equalTo: billLabelContainerView.leadingAnchor),
            billLabel.trailingAnchor.constraint(equalTo: billLabelContainerView.trailingAnchor),
            billLabel.topAnchor.constraint(equalTo: billLabelContainerView.topAnchor),
            billLabel.bottomAnchor.constraint(equalTo: billLabelContainerView.bottomAnchor),

            twoPoints.leadingAnchor.constraint(equalTo: twoPointsContainerView.leadingAnchor),
            twoPoints.trailingAnchor.constraint(equalTo: twoPointsContainerView.trailingAnchor),
            twoPoints.topAnchor.constraint(equalTo: twoPointsContainerView.topAnchor),
            twoPoints.bottomAnchor.constraint(equalTo: twoPointsContainerView.bottomAnchor),

            realsLabel.leadingAnchor.constraint(equalTo: numberOfRealsContainerView.leadingAnchor),
            realsLabel.trailingAnchor.constraint(equalTo: numberOfRealsContainerView.trailingAnchor),
            realsLabel.topAnchor.constraint(equalTo: numberOfRealsContainerView.topAnchor),
            realsLabel.bottomAnchor.constraint(equalTo: numberOfRealsContainerView.bottomAnchor),
//
            // Setting Bottom Container
            bottomContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
            bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),

          
            
            historicoStack.leadingAnchor.constraint(equalTo: historicView.leadingAnchor),
            historicoStack.trailingAnchor.constraint(equalTo: historicView.trailingAnchor),
            historicoStack.topAnchor.constraint(equalTo: historicView.topAnchor),
            historicoStack.bottomAnchor.constraint(equalTo: historicView.bottomAnchor),
            
            previsaoStack.leadingAnchor.constraint(equalTo: previsaoView.leadingAnchor),
            previsaoStack.trailingAnchor.constraint(equalTo: previsaoView.trailingAnchor),
            previsaoStack.topAnchor.constraint(equalTo: previsaoView.topAnchor),
            previsaoStack.bottomAnchor.constraint(equalTo: previsaoView.bottomAnchor),
            
            
         buttonStack.centerXAnchor.constraint(equalTo: bottomContainer.centerXAnchor),
         buttonStack.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor, constant: -CGFloat((tabBarController?.tabBar.bounds.height)!))
            
            ])
    }
}
