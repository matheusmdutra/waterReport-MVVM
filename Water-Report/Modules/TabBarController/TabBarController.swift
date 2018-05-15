////
////  TabBarController.swift
////  Water-Report
////
////  Created by Matheus Dutra on 08/05/2018.
////  Copyright © 2018 Matheus Dutra. All rights reserved.
////
//
import UIKit
class MyTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        self.delegate = self

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//         Create Tab one
//        let tabOne = MainScreenController()
        let tabOne = UINavigationController(rootViewController: MainScreenController())
        let tabOneBarItem = UITabBarItem(title: "Water Report", image: UIImage(named: "logo-short"), selectedImage: UIImage(named: "selectedImage.png"))

        tabOne.tabBarItem = tabOneBarItem


//         Create Tab two
        let tabTwo = PredictionViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "logo-short"), selectedImage: UIImage(named: "selectedImage2.png"))

        tabTwo.tabBarItem = tabTwoBarItem2


        self.viewControllers = [tabOne, tabTwo]
    }

    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("Selected \(viewController.title!)")
    }
}
