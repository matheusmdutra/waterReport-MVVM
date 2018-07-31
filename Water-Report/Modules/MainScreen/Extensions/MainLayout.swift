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
        
        var billLabelView = UIView()
        //=====================================\\
        //  *********  Adding views  ********\\
        //======================================\\
        
        [topContainer,middleContainer,bottomContainer].forEach { view.addSubview($0) }
        
        [viewTitle,wrLogo].forEach { topContainer.addSubview($0) }
        
        [collectionView,pageControl,touchIcon].forEach { middleContainer.addSubview($0) }
        
        billLabelView.addSubview(billLabel)
        
        [billIcon,billLabelView,twoPoints,realsLabel].forEach { billStack.addArrangedSubview($0) }
        
        [billView].forEach { middleContainer.addSubview($0) }
        
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
        
        topContainer.simpleAnchor(top: view.topAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero)
        topContainer.sized(with:.init(width: 0, height: view.frame.height * 0.10))
        
        middleContainer.simpleAnchor(top: topContainer.bottomAnchor, bottom: nil, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero)
        middleContainer.sized(with:.init(width: 0, height: view.frame.height * 0.45))

        
        bottomContainer.simpleAnchor(top: nil, bottom: view.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero)
        bottomContainer.sized(with:.init(width: 0, height: view.frame.height * 0.45))

        
        viewTitle.bottom(to: topContainer.bottomAnchor, padding: 10)
        viewTitle.centeredX(to: view)
        
        wrLogo.complexAnchor(top: nil, bottom: topContainer.bottomAnchor, left: nil, right: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 20), size: .init(width: 22, height: 22))
                
        collectionView.simpleAnchor(top: topContainer.bottomAnchor, bottom: pageControl.topAnchor, left: middleContainer.leadingAnchor, right: middleContainer.trailingAnchor, padding: .init(top: 30 * App().proportion, left: 30, bottom: 20 * App().proportion, right: 30))
        
        pageControl.centeredTo(view: middleContainer, paddingX: nil, paddingY: nil)
        
        touchIcon.leading(to: pageControl.trailingAnchor, padding: 11.5)
        touchIcon.centeredY(to: middleContainer)

        
        billView.simpleAnchor(top: pageControl.bottomAnchor, bottom: middleContainer.bottomAnchor, left: middleContainer.leadingAnchor, right: middleContainer.trailingAnchor, padding: .init(top: 30 * App().proportion, left: 30, bottom: 20 * App().proportion, right: 30))

        
        billStack.centeredTo(view: billView)
        
        historicoStack.anchorEqualTo(view: historicView)
        
        previsaoStack.anchorEqualTo(view: previsaoView)
        
        historicAndPrevisionStack.centeredTo(view: bottomContainer, paddingX: nil, paddingY: -CGFloat((tabBarController?.tabBar.bounds.height)!))
        
        billLabel.anchorEqualTo(view: billLabelView)
    }
}
