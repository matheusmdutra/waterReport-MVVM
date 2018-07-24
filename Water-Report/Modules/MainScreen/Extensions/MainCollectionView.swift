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
        cell.icon.image = viewModel.collectionData[indexPath.item].iconImage
        cell.numberOfLiters.text = "\(String(describing: viewModel.collectionData[indexPath.item].cellValue!))L"
        cell.collectionTitle.text = viewModel.collectionData[indexPath.item].cellLabel
        viewModel.myData.count > 0 ? (realsLabel.text = "R$ \(String(describing: viewModel.myData.first!.billValue))") : (realsLabel.text = "R$ 0")
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
