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
    
    var icon : UIImageView = {
        var myIcon = UIImageView()
        myIcon.image = #imageLiteral(resourceName: "today")
        myIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        myIcon.contentMode = .scaleAspectFit
        myIcon.translatesAutoresizingMaskIntoConstraints = false
        return myIcon
    }()
    
    var collectionTitle : UILabel = {
        var myLabel = UILabel()
        myLabel.text = "Consumo\ndiário"
        myLabel.numberOfLines = 2
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor.blue
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.055))
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    var twoPoints : UILabel = {
        var myLabel = UILabel()
        myLabel.text = ":"
        myLabel.numberOfLines = 1
        myLabel.textAlignment = .center
        myLabel.textColor = UIColor.blue
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.055))
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    var numberOfLiters : UILabel = {
        var myLabel = UILabel()
        myLabel.text = "0L"
        myLabel.numberOfLines = 1
        myLabel.textColor = UIColor.blue
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.06))
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    var collectionStack : UIStackView = {
        var myStack = UIStackView()
        myStack.spacing = 10
        myStack.axis = .horizontal
        myStack.distribution = .fill
        myStack.translatesAutoresizingMaskIntoConstraints = false
        return myStack
    }()
    
    func setupLayout() {
        
        let iconContainerView = UIView()
        let collectionTitleContainerView = UIView()
        let twoPointsContainerView = UIView()
        let numberOfLitersContainerView = UIView()
        
        collectionStack.addArrangedSubview(iconContainerView)
        collectionStack.addArrangedSubview(collectionTitleContainerView)
        collectionStack.addArrangedSubview(twoPointsContainerView)
        collectionStack.addArrangedSubview(numberOfLitersContainerView)
        
        
        addSubview(collectionStack)
        
        addSubview(icon)
        addSubview(collectionTitle)
        addSubview(twoPoints)
        addSubview(numberOfLiters)
        
        
        
        NSLayoutConstraint.activate([
            
            collectionStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            collectionStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            icon.leadingAnchor.constraint(equalTo: iconContainerView.leadingAnchor),
            icon.trailingAnchor.constraint(equalTo: iconContainerView.trailingAnchor),
            icon.topAnchor.constraint(equalTo: iconContainerView.topAnchor),
            icon.bottomAnchor.constraint(equalTo: iconContainerView.bottomAnchor),
            
            collectionTitle.leadingAnchor.constraint(equalTo: collectionTitleContainerView.leadingAnchor),
            collectionTitle.trailingAnchor.constraint(equalTo: collectionTitleContainerView.trailingAnchor),
            collectionTitle.topAnchor.constraint(equalTo: collectionTitleContainerView.topAnchor),
            collectionTitle.bottomAnchor.constraint(equalTo: collectionTitleContainerView.bottomAnchor),
            
            twoPoints.leadingAnchor.constraint(equalTo: twoPointsContainerView.leadingAnchor),
            twoPoints.trailingAnchor.constraint(equalTo: twoPointsContainerView.trailingAnchor),
            twoPoints.topAnchor.constraint(equalTo: twoPointsContainerView.topAnchor),
            twoPoints.bottomAnchor.constraint(equalTo: twoPointsContainerView.bottomAnchor),
            
            numberOfLiters.leadingAnchor.constraint(equalTo: numberOfLitersContainerView.leadingAnchor),
            numberOfLiters.trailingAnchor.constraint(equalTo: numberOfLitersContainerView.trailingAnchor),
            numberOfLiters.topAnchor.constraint(equalTo: numberOfLitersContainerView.topAnchor),
            numberOfLiters.bottomAnchor.constraint(equalTo: numberOfLitersContainerView.bottomAnchor),
            
            
            
            
            ])
    }
}
