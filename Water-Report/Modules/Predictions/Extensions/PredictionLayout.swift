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
        
        view.backgroundColor = .white

        let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top
        
        let viewHeight = view.frame.height
               
        
        [topContainer,menuLabel,wrLogo, nPessoasView].forEach {view.addSubview($0)}
                
        topContainer.complexAnchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: viewHeight * 0.10))
        
        menuLabel.bottom(to: topContainer.bottomAnchor, padding: 10)
        menuLabel.centeredX(to: view)
        
       wrLogo.complexAnchor(top: nil, bottom: topContainer.bottomAnchor, left: nil, right: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 20), size: .init(width: 22, height: 22))
        
        nPessoasView.centeredTo(view: view)
       

    }
}
