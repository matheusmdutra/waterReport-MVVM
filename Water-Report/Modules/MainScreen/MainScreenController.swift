//
//  MainScreenController.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class MainScreenController : BaseViewController, UICollectionViewDelegateFlowLayout {
    
    let realm = try! Realm()
    var viewModel = MainScreenViewModel()
    var myData : Results<FirebaseData>!
    
    var collectionData = [
        CellDataMainScreen(image: #imageLiteral(resourceName: "today"), label: "Consumo\ndiário", value: 0),
        CellDataMainScreen(image: #imageLiteral(resourceName: "month"), label: "Consumo\nmensal", value: 0)
    ]
    
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
    
    var middleContainer : UIView = {
        var myMiddleContainer = UIView()
        myMiddleContainer.backgroundColor = .white
        myMiddleContainer.translatesAutoresizingMaskIntoConstraints = false
        return myMiddleContainer
    }()
    
    var bottomContainer : UIView = {
        var myBottomContainer = UIView()
        myBottomContainer.backgroundColor = UIColor.white
        myBottomContainer.translatesAutoresizingMaskIntoConstraints = false
        return myBottomContainer
    }()
    
    var menuLabel: UILabel = {
        var myLabel = UILabel()
        myLabel.text = "Consumo"
        myLabel.textColor = UIColor.white
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.07))
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    var collectionView : UICollectionView = {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .horizontal
        var frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let myCollectionView = UICollectionView(frame: frame, collectionViewLayout: myLayout)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.layer.cornerRadius = 10
        myCollectionView.backgroundColor = .clear
        myCollectionView.layer.borderWidth = 1
        myCollectionView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        myCollectionView.contentMode = .scaleAspectFill
        return myCollectionView
    }()
    
    var pageControl : UIPageControl = {
        var myPageControl = UIPageControl()
        myPageControl.currentPage = 0
        myPageControl.numberOfPages = 2
        myPageControl.currentPageIndicatorTintColor = UIColor.blue
        myPageControl.pageIndicatorTintColor = UIColor.gray
        myPageControl.translatesAutoresizingMaskIntoConstraints = false
        return myPageControl
    }()
    
    var touchIcon : UIImageView = {
        var myTouchIcon = UIImageView()
        myTouchIcon.image = #imageLiteral(resourceName: "slideIcon")
        myTouchIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        myTouchIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        myTouchIcon.translatesAutoresizingMaskIntoConstraints = false
        return myTouchIcon
    }()
    
    
    var billIcon : UIImageView = {
        var myIcon = UIImageView()
        myIcon.image = #imageLiteral(resourceName: "bill")
        myIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myIcon.widthAnchor.constraint(equalToConstant: 60).isActive = true
        myIcon.contentMode = .scaleAspectFit
        myIcon.translatesAutoresizingMaskIntoConstraints = false
        return myIcon
    }()
    
    var billLabel : UILabel = {
        var myLabel = UILabel()
        myLabel.text = "Valor total"
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
    
    var realsLabel : UILabel = {
        var myLabel = UILabel()
        myLabel.text = "R$0"
        myLabel.numberOfLines = 1
        myLabel.textColor = UIColor.blue
        myLabel.adjustsFontSizeToFitWidth = true
        myLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.06))
        myLabel.sizeToFit()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel
    }()
    
    var billView : UIView = {
        var myBillView = UIView()
        myBillView.layer.cornerRadius = 10
        myBillView.layer.borderWidth = 1
        myBillView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        myBillView.translatesAutoresizingMaskIntoConstraints = false
        return myBillView
    }()
    
    var billStack : UIStackView = {
        var myStack = UIStackView()
        myStack.spacing = 10
        myStack.axis = .horizontal
        myStack.distribution = .fill
        myStack.translatesAutoresizingMaskIntoConstraints = false
        return myStack
    }()
    
    var historicView : UIView = {
        var myHistoricView = UIView()
        myHistoricView.translatesAutoresizingMaskIntoConstraints = false
        return myHistoricView
    }()
    
    var historicIcon : UIButton = {
        var myHistoricIcon = UIButton()
        myHistoricIcon.setImage(#imageLiteral(resourceName: "historic"), for: .normal)
        myHistoricIcon.heightAnchor.constraint(equalToConstant: 70).isActive = true
        myHistoricIcon.widthAnchor.constraint(equalToConstant: 70).isActive = true
        myHistoricIcon.contentMode = .scaleAspectFit
        myHistoricIcon.translatesAutoresizingMaskIntoConstraints = false
        return myHistoricIcon
    }()
    
    var historicLabel : UILabel = {
        var myHistoricLabel = UILabel()
        myHistoricLabel.text = "Histórico"
        myHistoricLabel.numberOfLines = 1
        myHistoricLabel.textColor = UIColor.blue
        myHistoricLabel.adjustsFontSizeToFitWidth = true
        myHistoricLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.06))
        myHistoricLabel.sizeToFit()
        myHistoricLabel.translatesAutoresizingMaskIntoConstraints = false
        return myHistoricLabel
    }()
    
    var historicoStack : UIStackView = {
        var myStack = UIStackView()
        myStack.spacing = 0
        myStack.axis = .vertical
        myStack.distribution = .fill
        myStack.translatesAutoresizingMaskIntoConstraints = false
        return myStack
    }()

    var previsaoView : UIView = {
        var myPrevisaoView = UIView()
        myPrevisaoView.translatesAutoresizingMaskIntoConstraints = false
        return myPrevisaoView
    }()
    
    var previsaoIcon : UIButton = {
        var myPrevisaoIcon = UIButton()
        myPrevisaoIcon.setImage(#imageLiteral(resourceName: "projecoes"), for: .normal)
        myPrevisaoIcon.heightAnchor.constraint(equalToConstant: 70).isActive = true
        myPrevisaoIcon.widthAnchor.constraint(equalToConstant: 70).isActive = true
        myPrevisaoIcon.contentMode = .scaleAspectFit
        myPrevisaoIcon.translatesAutoresizingMaskIntoConstraints = false
        myPrevisaoIcon.addTarget(self, action: #selector(goToPredictionView), for: .touchUpInside)
        return myPrevisaoIcon
    }()
    
    @objc func goToPredictionView() {
//        router.goToNextController(from: self, to: .predictions)
    }
    
    var previsaoLabel : UILabel = {
        var myPrevisaoLabel = UILabel()
        myPrevisaoLabel.text = "Previsão"
        myPrevisaoLabel.numberOfLines = 1
        myPrevisaoLabel.textColor = UIColor.blue
        myPrevisaoLabel.adjustsFontSizeToFitWidth = true
        myPrevisaoLabel.font =  UIFont.init(name: "Optima", size: UIScreen.main.bounds.width * CGFloat(0.06))
        myPrevisaoLabel.sizeToFit()
        myPrevisaoLabel.translatesAutoresizingMaskIntoConstraints = false
        return myPrevisaoLabel
    }()
    
    var previsaoStack : UIStackView = {
        var myStack = UIStackView()
        myStack.spacing = 0
        myStack.axis = .vertical
        myStack.distribution = .fill
        myStack.translatesAutoresizingMaskIntoConstraints = false
        return myStack
    }()
    
    var buttonStack : UIStackView = {
        var myButtonStack = UIStackView()
        myButtonStack.spacing = 50
        myButtonStack.axis = .horizontal
        myButtonStack.distribution = .fill
        myButtonStack.translatesAutoresizingMaskIntoConstraints = false
        return myButtonStack
    }()
        
    override func viewDidLoad() {
        navigationController?.navigationBar.transparentNavigationBar()
        setupRealm()
        setupLayout()
        setupMyCollection()
        viewModel.retrieveAllData()
        viewModel.delegate = self
        showLoading()
    }
    
    func setupRealm () {
        myData = realm.objects(FirebaseData.self)
        collectionData[0].cellValue = myData.first?.litersPerDay
        collectionData[1].cellValue = myData.first?.literesPerMonth
    }
    
    func setupMyCollection() {
            collectionView.register(MainCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.isPagingEnabled = true
            collectionView.showsHorizontalScrollIndicator = false
    }
}
