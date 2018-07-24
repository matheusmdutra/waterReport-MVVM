//
//  PredictionViewController.swift
//  Water-Report
//
//  Created by Matheus Dutra on 12/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit

class PredictionViewController: UIViewController  {
    
    var topContainer : UIImageView!
    var wrLogo : UIImageView!
    var menuLabel: UILabel!
    
    var nPessoasIcon : UIImageView!
    var nPessoasLabel : UILabel!
    var nPessoasTwoPoints: UILabel!
    var nPessoasValue: UILabel!
    var nPessoasStack: UIStackView!
    var nPessoasView: UIView!
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        setupLayout()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    


}
