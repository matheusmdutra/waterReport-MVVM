//
//  LoginViewController.swift
//  Water-Report
//
//  Created by Matheus Dutra on 07/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController  {
    
    var viewModel = LoginViewModel()
    // Creating my login screen
    
    var topContainer : UIView = {
        var myTopContainer = UIView()
        myTopContainer.translatesAutoresizingMaskIntoConstraints = false
        return myTopContainer
    }()
    
    var middleContainer : UIView = {
        var myMiddleContainer = UIView()
        myMiddleContainer.backgroundColor = UIColor.white
        myMiddleContainer.translatesAutoresizingMaskIntoConstraints = false
        return myMiddleContainer
    }()
    
    var bottomContainer : UIView = {
        var myBottomContainer = UIView()
        myBottomContainer.backgroundColor = UIColor.white
        myBottomContainer.translatesAutoresizingMaskIntoConstraints = false
        return myBottomContainer
    }()
    
    var topWallpaper : UIImageView = {
        var myTopWallpaper = UIImageView()
        myTopWallpaper.image = #imageLiteral(resourceName: "wallpaper")
        myTopWallpaper.contentMode = .scaleAspectFill
        myTopWallpaper.translatesAutoresizingMaskIntoConstraints = false
        return myTopWallpaper
    }()
    
    var topLogo : UIImageView = {
        var myTopLogo = UIImageView()
        myTopLogo.image = #imageLiteral(resourceName: "logo-full")
        myTopLogo.contentMode = .scaleAspectFill
        myTopLogo.translatesAutoresizingMaskIntoConstraints = false
        return myTopLogo
    }()
    
    var emailTextField : UITextField = {
        var myEmailTextField = UITextField()
        myEmailTextField.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        myEmailTextField.layer.cornerRadius = 5
        myEmailTextField.keyboardType = .emailAddress
        myEmailTextField.layer.borderWidth = 0.1
        myEmailTextField.autocapitalizationType = .none
        myEmailTextField.layer.borderColor = UIColor.black.cgColor
        myEmailTextField.text = "matheusdut@gmail.com"
        myEmailTextField.placeholder = "Digite o seu email"
        myEmailTextField.sizeToFit()
        myEmailTextField.font = UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.04))
        myEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        return myEmailTextField
    }()
    
    
    var passwordTextField : UITextField = {
        
        var myPasswordTextField = UITextField()
        myPasswordTextField.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        myPasswordTextField.autocapitalizationType = .none
        myPasswordTextField.layer.cornerRadius = 5
        myPasswordTextField.layer.borderWidth = 0.1
        myPasswordTextField.text = "040893milbradt"
        myPasswordTextField.keyboardType = .emailAddress
        myPasswordTextField.isSecureTextEntry = true
        myPasswordTextField.layer.borderColor = UIColor.black.cgColor
        myPasswordTextField.sizeToFit()
        myPasswordTextField.placeholder = "Digite a sua senha"
        myPasswordTextField.font = UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.04))
        myPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        return myPasswordTextField
    }()
    
    var textFieldStack : UIStackView = {
        var myStack = UIStackView()
        myStack.spacing = 20
        myStack.axis = .vertical
        myStack.distribution = .fillEqually
        myStack.translatesAutoresizingMaskIntoConstraints = false
        return myStack
    }()
    
    var loginButton : UIButton = {
        var myLoginButton = UIButton()
        myLoginButton.translatesAutoresizingMaskIntoConstraints = false
        myLoginButton.setTitle("Entrar", for: .normal)
        myLoginButton.titleLabel?.font = UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.055))
        myLoginButton.sizeToFit()
        myLoginButton.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        myLoginButton.layer.cornerRadius = 5
        myLoginButton.titleLabel?.textColor = UIColor.white
        myLoginButton.titleLabel?.textAlignment = .center
        myLoginButton.addTarget(self, action: #selector(loginFirebase), for: .touchUpInside)
        return myLoginButton
    }()
    
    @objc func loginFirebase() {
        viewModel.checkUserInfo(email: emailTextField.text, password: passwordTextField.text)
    }
    
    var forgotPasswordLabel : UILabel = {
        var myLabel = UILabel()
        myLabel.text = "Esqueceu a senha?"
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.04))
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    
    var forgotPasswordButton : UIButton = {
        var myButton = UIButton()
        myButton.setTitle("Obtenha ajuda para entrar", for: .normal)
        myButton.titleLabel?.adjustsFontSizeToFitWidth = true
        myButton.titleLabel?.font = UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.04))
        myButton.titleLabel?.sizeToFit()
        myButton.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
    
    var forgotStack : UIStackView = {
        var myStack = UIStackView()
        myStack.spacing = 20
        myStack.axis = .horizontal
        myStack.distribution = .fillProportionally
        //        myStack.alignment = .fill
        myStack.translatesAutoresizingMaskIntoConstraints = false
        return myStack
    }()
    var newAccountLabel : UILabel = {
        var myLabel = UILabel()
        myLabel.text = "Não possuí conta?"
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font = UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.04))
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    
    var newAccountButton : UIButton = {
        var myButton = UIButton()
        myButton.setTitle("Cadastre-se", for: .normal)
        myButton.titleLabel?.adjustsFontSizeToFitWidth = true
        myButton.titleLabel?.font = UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.04))
        myButton.titleLabel?.sizeToFit()
        myButton.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
    
    var newAccountStack : UIStackView = {
        var myStack = UIStackView()
        myStack.spacing = 20
        myStack.axis = .horizontal
        myStack.distribution = .fillProportionally
        myStack.alignment = .center
        myStack.translatesAutoresizingMaskIntoConstraints = false
        return myStack
    }()
    
    var lineView : UIView = {
        var myLineView = UIView()
        myLineView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        myLineView.translatesAutoresizingMaskIntoConstraints = false
        return myLineView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewLayout()
        setupKeyboardThings()
        viewModel.delegate = self
        viewModel.router = self
    }
    
    
    
    
    

    
    
    
    
    
}
