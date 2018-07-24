//
//  MainScreenController.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class MainScreenController : BaseViewController, UICollectionViewDelegateFlowLayout {
    
    lazy var viewModel = MainScreenViewModel(delegate: self)
        
    var topContainer = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "wallpaper"), contentMode: .scaleToFill)
    
    var wrLogo = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "logo-short"), contentMode: .scaleAspectFit)
    
    var middleContainer =  GlobalComponents().createViewWith(backgroundColor: .white)
    
    var bottomContainer =  GlobalComponents().createViewWith(backgroundColor: .white)
    
    var viewTitle = GlobalComponents().createSimpleLabel(text: "Consumo", textColor: .white, font: .header)
    
    var collectionView = ComplexComponents().createCollectionView(scrollDirection: .horizontal, backgroundColor: .clear, corner: 10, borderWidht: 1, borderColor:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    
    var pageControl = GlobalComponents().createPageControl(numberOfPages: 2, currentColor: .blue, indicatorColor: .lightGray)
    
    var touchIcon = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "slideIcon"), contentMode: .scaleAspectFit, sizeOfImage: CGSize.init(width: 30, height: 35))
    
    var billIcon = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "bill"), contentMode: .scaleAspectFit, sizeOfImage: .init(width: 60, height: 60))
    
    var billLabel = GlobalComponents().createSimpleLabel(text: "Valor total", textColor: .blue, font: AppFonts.header)
    
    var twoPoints = GlobalComponents().createSimpleLabel(text: ":", textColor: .blue, font: AppFonts.header)
    
    var realsLabel = GlobalComponents().createSimpleLabel(text: "R$0", textColor: .blue, font: AppFonts.header)
    
    var billView = ComplexComponents().createViewWith(backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderWidht: 1, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) , cornerRadius: 10, maskedCorners: nil)
    
    var billStack = GlobalComponents().createStackView(axis: .horizontal, spacing: 10, distribution: .fill)
    
    var historicView = GlobalComponents().createViewWith(backgroundColor: nil)
    
    var historicIcon = ComplexComponents().createButtom(title: nil, titleColor: nil, font: .normal, backColor: .clear, corner: 0, image: #imageLiteral(resourceName: "historic"), imageSize: .init(width: 70, height: 70))
    
    var historicLabel = GlobalComponents().createSimpleLabel(text: "Histórico", textColor: .blue, font: .header)
    
    var historicoStack = GlobalComponents().createStackView(axis: .vertical, spacing: 0, distribution: .fill)
    
    var previsaoView = GlobalComponents().createViewWith(backgroundColor: nil)
    
    var previsaoIcon = ComplexComponents().createButtom(title: nil, titleColor: nil, font: .normal, backColor: .clear, corner: 0, image: #imageLiteral(resourceName: "projecoes"), imageSize: .init(width: 70, height: 70))
    
    
    @objc func goToPredictionView() {
        //        router.goToNextController(from: self, to: .predictions)
    }
    
    var previsaoLabel = GlobalComponents().createSimpleLabel(text: "Previsão", textColor: .blue, font: .header)
    
    var previsaoStack = GlobalComponents().createStackView(axis: .vertical, spacing: 0, distribution: .fill)
    
    var historicAndPrevisionStack = GlobalComponents().createStackView(axis: .horizontal, spacing: 50, distribution: .fill)
    
    override func viewDidLoad() {
        
        setupSpecialParameters()
        
        viewModel.setupData()
        
        viewModel.retrieveAllData()
        
        setupLayout()
        
    }
    
    func setupSpecialParameters() {
        
        navigationController?.navigationBar.transparentNavigationBar()
     
        setupMyCollection()
    }
  
    func setupMyCollection() {
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    
}
