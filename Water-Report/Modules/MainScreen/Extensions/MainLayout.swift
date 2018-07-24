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
        
        let heightOfSafeAreaIphoneX = UIApplication.shared.keyWindow?.safeAreaInsets.top
    
        let billIconContainerView = UIView()
        let billLabelContainerView = UIView()
        let twoPointsContainerView = UIView()
        let numberOfRealsContainerView = UIView()
        
        //=====================================\\
        //  *********  Adding views  ********\\
        //======================================\\
        
        [topContainer,middleContainer,bottomContainer].forEach { view.addSubview($0) }
        
        [viewTitle,wrLogo].forEach { topContainer.addSubview($0) }
        
        [collectionView,pageControl,touchIcon].forEach { middleContainer.addSubview($0) }
        
        [billIconContainerView,billLabelContainerView,twoPointsContainerView,numberOfRealsContainerView].forEach { billStack.addArrangedSubview($0) }
        
        [billView,billIcon,realsLabel,billLabel,twoPoints].forEach { middleContainer.addSubview($0) }
        
        billView.addSubview(billStack)
        
        [historicIcon,historicLabel].forEach { historicoStack.addArrangedSubview($0) }
        
        historicView.addSubview(historicoStack)
        
        [previsaoIcon,previsaoLabel].forEach { previsaoStack.addArrangedSubview($0) }
        
        previsaoView.addSubview(previsaoStack)
        
        [historicView,previsaoView].forEach { historicAndPrevisionStack.addArrangedSubview($0) }
        
        bottomContainer.addSubview(historicAndPrevisionStack)
        
        //=====================================\\
        //  *********  Setting Anchors  ********\\
        //======================================\\
        
        topContainer.simpleAnchor(top: view.topAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: view.frame.height * 0.09))
        
        middleContainer.simpleAnchor(top: topContainer.bottomAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: view.frame.height * 0.46))
        
        bottomContainer.simpleAnchor(top: nil, bottom: view.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: view.frame.height * 0.45))
        
        viewTitle.anchorCenteredTo(view: topContainer, paddingX: 0, paddingY: (heightOfSafeAreaIphoneX ?? 0)/4)

        wrLogo.complexAnchor(top: nil, bottom: nil, left: nil, right: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20), size: .init(width: 22, height: 22), centerYto: nil, centerXto: nil)
        
        wrLogo.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor, constant: (heightOfSafeAreaIphoneX ?? 0)/4).isActive = true
        
        collectionView.simpleAnchor(top: topContainer.bottomAnchor, bottom: pageControl.topAnchor, left: middleContainer.leadingAnchor, right: middleContainer.trailingAnchor, padding: .init(top: 30 * App().proportion, left: 30, bottom: 20 * App().proportion, right: 30), size: .zero)
        
        pageControl.anchorCenteredTo(view: middleContainer, paddingX: nil, paddingY: nil)
        
        touchIcon.complexAnchor(top: nil, bottom: nil, left: pageControl.trailingAnchor, right: nil, padding: .init(top: 0, left: 11.5, bottom: 0, right: 0), size: .zero, centerYto: middleContainer, centerXto: nil)
        
        billView.simpleAnchor(top: pageControl.bottomAnchor, bottom: middleContainer.bottomAnchor, left: middleContainer.leadingAnchor, right: middleContainer.trailingAnchor, padding: .init(top: 30 * App().proportion, left: 30, bottom: 20 * App().proportion, right: 30), size: .zero)
        
        billStack.anchorCenteredTo(view: billView, paddingX: nil, paddingY: nil)
        
        billIcon.anchorEqualTo(view: billIconContainerView)
        
        billLabel.anchorEqualTo(view: billLabelContainerView)
        
        twoPoints.anchorEqualTo(view: twoPointsContainerView)
        
        realsLabel.anchorEqualTo(view: numberOfRealsContainerView)
        
        historicoStack.anchorEqualTo(view: historicView)
        
        previsaoStack.anchorEqualTo(view: previsaoView)
        
        historicAndPrevisionStack.anchorCenteredTo(view: bottomContainer, paddingX: nil, paddingY: -CGFloat((tabBarController?.tabBar.bounds.height)!))
        
    }
}
