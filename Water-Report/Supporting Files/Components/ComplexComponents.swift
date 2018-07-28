//
//  ComplexComponents.swift
//  Water-Report
//
//  Created by Matheus Dutra on 08/07/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

class ComplexComponents {
    
    func createViewWith(backgroundColor: UIColor?, borderWidht: CGFloat?, borderColor: UIColor?, cornerRadius: CGFloat?, maskedCorners: [CACornerMask]?) -> UIView {
        let mView = UIView()
        mView.backgroundColor = backgroundColor
        if let corner = cornerRadius {mView.layer.cornerRadius = corner}
        mView.clipsToBounds = true
        mView.translatesAutoresizingMaskIntoConstraints = false
        if let border = borderWidht {mView.layer.borderWidth = border}
        mView.layer.borderColor = borderColor?.cgColor
        if let masked = maskedCorners {
            masked.forEach {
                mView.layer.maskedCorners = $0
            }
        }
        return mView
    }
    
    func createCustomImageViewWith(image: UIImage?, contentMode: UIViewContentMode, backgroundColor: UIColor, cornerRadius: CGFloat, maskedCorners: [CACornerMask]) -> UIImageView {
        
        let myTopImageView = UIImageView()
        myTopImageView.image = image
        myTopImageView.contentMode = contentMode
        myTopImageView.translatesAutoresizingMaskIntoConstraints = false
        myTopImageView.clipsToBounds = true
        myTopImageView.layer.cornerRadius = cornerRadius
        myTopImageView.backgroundColor = backgroundColor
        maskedCorners.forEach {
            myTopImageView.layer.maskedCorners = $0
        }
        return myTopImageView
    }
    
    func createButtom(title: String? = nil, titleColor: UIColor? = nil,font: AppFonts, backColor: UIColor, corner: CGFloat, image: UIImage, imageSize: CGSize = .zero) -> UIButton {
        let mLoginButton = UIButton()
        mLoginButton.translatesAutoresizingMaskIntoConstraints = false
        if let title = title { mLoginButton.setTitle(title, for: .normal)}
        if let titleColor = titleColor {mLoginButton.titleLabel?.textColor = titleColor }
        mLoginButton.titleLabel?.font = UIFont().retrieveAppFont(named: font)
        mLoginButton.setImage(image, for: .normal)
        mLoginButton.sizeToFit()
        mLoginButton.backgroundColor = backColor
        mLoginButton.layer.cornerRadius = corner * App().proportion
        mLoginButton.setTitleColor(titleColor, for: .normal)
        mLoginButton.titleLabel?.textAlignment = .center
        if imageSize.height != 0 { mLoginButton.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = true }
        if imageSize.width != 0 { mLoginButton.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = true }
        return mLoginButton
    }
    
    func createCollectionView(scrollDirection: UICollectionViewScrollDirection , backgroundColor: UIColor? = nil, corner: CGFloat? = nil, borderWidht: CGFloat? = nil, borderColor: UIColor? = nil) -> UICollectionView {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = scrollDirection
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let myCollectionView = UICollectionView(frame: frame, collectionViewLayout: myLayout)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.backgroundColor = backgroundColor
        myCollectionView.contentMode = .scaleAspectFill
        if let corner = corner {  myCollectionView.layer.cornerRadius = corner }
        if let borderWidht = borderWidht {  myCollectionView.layer.borderWidth = borderWidht }
        if let borderColor = borderColor {  myCollectionView.layer.borderColor = borderColor.cgColor }
        return myCollectionView
    }

    
}
