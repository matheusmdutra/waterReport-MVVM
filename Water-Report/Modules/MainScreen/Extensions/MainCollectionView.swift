//
//  MainCollectionView.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/05/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit


extension MainScreenController : UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath) as! MainCell
        if myCollectionData.count > 0 {
         cell.icon.image = myCollectionData[indexPath.item].iconImage
            cell.numberOfLiters.text = "\(String(describing: myCollectionData[indexPath.item].cellValue!))L"
            cell.collectionTitle.text = myCollectionData[indexPath.item].cellLabel
            realsLabel.text = "R$\(String(describing: myData!.billValue))"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = UIScreen.main.bounds.width - 60
        return CGSize(width: collectionViewSize , height: collectionView.bounds.height)
    }
    
     func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pointX = targetContentOffset.pointee.x
        let currentPage = Int( pointX / (view.frame.width - 60))
        pageControl.currentPage = currentPage
     
    }
    

}
