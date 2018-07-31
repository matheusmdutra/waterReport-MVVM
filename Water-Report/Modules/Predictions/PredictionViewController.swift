//
//  PredictionViewController.swift
//  Water-Report
//
//  Created by Matheus Dutra on 12/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit

class PredictionViewController: BaseViewController, UICollectionViewDelegateFlowLayout  {
    
    let wrLogo = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "logo-short"), contentMode: .scaleAspectFill, sizeOfImage: .init(width: 20, height: 20))
    
    let topContainer = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "wallpaper"), contentMode: .scaleToFill, sizeOfImage: .zero)
    
    let menuLabel = GlobalComponents().createSimpleLabel(text: "Previsões", textColor: .white, numberOflines: 1, font: .header)
    
    let nPessoasIcon = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "person-icon-blue-7573"), contentMode: .scaleAspectFill, sizeOfImage: .init(width: 40, height: 40))
    let nPessoasLabel = GlobalComponents().createSimpleLabel(text: "Teste", textColor: .darkBlue, numberOflines: 1, font: .normal)
    let nPessoasTwoPoints = GlobalComponents().createSimpleLabel(text:  ":", textColor: .darkBlue, numberOflines: 1, font: .normal)
    let nPessoasValue = GlobalComponents().createSimpleLabel(text: "20L", textColor: .darkBlue, numberOflines: 1, font: .normal)
    let nPessoasStack = GlobalComponents().createStackView(axis: .horizontal, spacing: 10, distribution: .fill)
    var nPessoasView : UIView!
    
    var collectionView = ComplexComponents().createCollectionView(scrollDirection: .horizontal, backgroundColor: .clear, corner: 10, borderWidht: 1, borderColor:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))

    
 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupSpecialParameters()

        setupLayout()
    
    }
    
    func setupSpecialParameters() {
        
     nPessoasView = PredictionsComponents().genericView(stackView: nPessoasStack, imageView: nPessoasIcon, descriptionLabel: nPessoasLabel, twoPointsLabel: nPessoasTwoPoints, valueLabel: nPessoasValue)
        
    setupMyCollection()
        
    }
    
    func setupMyCollection() {
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }

}
