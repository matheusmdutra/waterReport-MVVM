//
//  MainCell.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var icon = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "today"), contentMode: .scaleAspectFit, sizeOfImage: CGSize(width: 60, height: 60))
 
    var collectionTitle = GlobalComponents().createSimpleLabel(text: "Consumo\ndiário", textColor: .darkBlue, numberOflines: 2, font: AppFonts.normal)
    
    var twoPoints = GlobalComponents().createSimpleLabel(text: ":", textColor: .darkBlue, numberOflines: 1, font: AppFonts.normal)
    
    var numberOfLiters = GlobalComponents().createSimpleLabel(text: "0L", textColor: .darkBlue, numberOflines: 1, font: AppFonts.normal)
    
    var collectionStack = GlobalComponents().createStackView(axis: .horizontal, spacing: 15, distribution: .fill)
    
    func setupCell(data: [CellDataMainScreen], index: Int) {
        icon.image = data[index].iconImage
        collectionTitle.text = data[index].cellLabel
        numberOfLiters.text = "\(String(describing: data[index].cellValue ?? 0)) L"
    }
    func setupLayout() {
        
        let titleView = UIView()
        
        titleView.addSubview(collectionTitle)
        
        [icon,titleView,twoPoints,numberOfLiters].forEach {collectionStack.addArrangedSubview($0)}

        addSubview(collectionStack)
        
        collectionTitle.anchorEqualTo(view: titleView)
        collectionStack.anchorCenteredTo(view: self)
        
    }
}
