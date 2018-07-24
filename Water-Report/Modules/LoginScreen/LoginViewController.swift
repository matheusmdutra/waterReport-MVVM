//
//  LoginViewController.swift
//  Water-Report
//
//  Created by Matheus Dutra on 07/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: BaseViewController  {
    
    lazy var viewModel = LoginViewModel(delegate: self)
    
    var router : LoginScreenRouter?
    
    var topContainer = GlobalComponents().createViewWith(backgroundColor: nil)
    
    var middleContainer = GlobalComponents().createViewWith(backgroundColor: .white)
    
    var bottomContainer = GlobalComponents().createViewWith(backgroundColor: .white)
    
    var topWallpaper = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "wallpaper"), contentMode: .scaleToFill)
    
    var topLogo = GlobalComponents().createImageViewWith(image: #imageLiteral(resourceName: "logo-full"), contentMode: .scaleAspectFill)
    
    var emailTextField = GlobalComponents().createTextFieldWith(text: "matheusdut@gmail.com", placeHolder: "Digite o seu email", keyboardType: .emailAddress, backgroundColor: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1) , font: .normal , corner: 5)
    
    var passwordTextField = GlobalComponents().createTextFieldWith(text: "040893milbradt", placeHolder: "Digite a sua senha", keyboardType: .emailAddress, backgroundColor: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1) , font: .normal , corner: 5)

    var textFieldStack = GlobalComponents().createStackView(axis: .vertical, spacing: 20, distribution: .fillEqually)
 
    var loginButton = GlobalComponents().createButtom(title: "Entrar", titleColor: .white, font: .normal, backColor: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), corner: 5)

    var forgotPasswordLabel = GlobalComponents().createSimpleLabel(text: "Esqueceu a senha?", textColor: .black, font: .smallest)
    
    var forgotPasswordButton =  GlobalComponents().createButtom(title: "Obtenha ajuda para entrar", titleColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), font: .smallest, backColor: .white, corner: 0)

    var forgotStack = GlobalComponents().createStackView(axis: .horizontal, spacing: 20, distribution: .fillProportionally)
 
    var newAccountLabel = GlobalComponents().createSimpleLabel(text: "Não possuí conta?", textColor: .black, font: .smallest)
    
    var newAccountButton = GlobalComponents().createButtom(title: "Cadastre-se", titleColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), font: .smallest, backColor: .white, corner: 0)
    
    var myStack = GlobalComponents().createStackView(axis: .horizontal, spacing: 20, distribution: .fillProportionally)
    
    var lineView = GlobalComponents().createViewWith(backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))

    var newAccountStack = GlobalComponents().createStackView(axis: .horizontal, spacing: 20, distribution: .fillProportionally)
    
    let newAccountStackView = GlobalComponents().createViewWith(backgroundColor: .white)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupSpecialParameters()
        
        setupViewLayout()
        
    }
    func setupSpecialParameters() {
        
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        loginButton.addTarget(self, action: #selector(loginFirebase), for: .touchUpInside)
        
        setupKeyboardThings()
    }

    @objc func loginFirebase() {
        viewModel.checkUserInfo(email: emailTextField.text, password: passwordTextField.text)
    }
}
extension LoginViewController : UITextFieldDelegate  {
    
    func setupKeyboardThings() {
        
        hideKeyboardWhenTappedAround()
        
        passwordTextField.delegate = self
        
        emailTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
