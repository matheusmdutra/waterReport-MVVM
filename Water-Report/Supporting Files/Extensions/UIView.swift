//
//  UIView.swift
//  Water-Report
//
//  Created by Matheus Dutra on 10/06/2018.
//  Copyright © 2018 Matheus Dutra. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func simpleAnchor(top: NSLayoutYAxisAnchor? , bottom: NSLayoutYAxisAnchor? , left: NSLayoutXAxisAnchor? , right: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
            
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }
    
    func complexAnchor(top: NSLayoutYAxisAnchor? , bottom: NSLayoutYAxisAnchor? , left: NSLayoutXAxisAnchor? , right: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero, centerYto: UIView? = nil, centerXto:  UIView? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
            
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if let centerXto = centerXto {
            centerXAnchor.constraint(equalTo: centerXto.centerXAnchor).isActive = true
            
        }
        
        if let centerYto = centerYto {
            centerYAnchor.constraint(equalTo: centerYto.centerYAnchor).isActive = true
        }
    }
    
    func anchorEqualTo(view: UIView) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: view.safeTopAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.safeLeftAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.safeRightAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.safeBottomAnchor).isActive = true
        
    }
    
    func anchorCenteredTo(view: UIView, paddingX: CGFloat? = nil, paddingY: CGFloat? = nil) {
        
        
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: paddingX ?? 0).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: paddingY ?? 0).isActive = true

    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leadingAnchor
        }else {
            return self.leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.trailingAnchor
        }else {
            return self.rightAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
}

