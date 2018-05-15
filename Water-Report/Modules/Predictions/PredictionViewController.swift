//
//  PredictionViewController.swift
//  Water-Report
//
//  Created by Matheus Dutra on 12/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit

class PredictionViewController: UIViewController  {
    
   
    var topContainer : UIImageView = {
        var myTopContainer = UIImageView()
        myTopContainer.image = #imageLiteral(resourceName: "wallpaper")
        myTopContainer.translatesAutoresizingMaskIntoConstraints = false
        return myTopContainer
    }()
    
    var wrLogo : UIImageView = {
        var myWrLogo = UIImageView()
        myWrLogo.image = #imageLiteral(resourceName: "logo-short")
        myWrLogo.heightAnchor.constraint(equalToConstant: 23).isActive = true
        myWrLogo.widthAnchor.constraint(equalToConstant: 23).isActive = true
        myWrLogo.translatesAutoresizingMaskIntoConstraints = false
        return myWrLogo
    }()
    
    var menuLabel: UILabel = {
        var myLabel = UILabel()
        myLabel.text = "Previsões"
        myLabel.textColor = UIColor.white
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.07))
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    


}
