//
//  ConstraintExtensions.swift
//  ScrollTextFieldsUp
//
//  Created by eric yu on 5/14/17.
//  Copyright © 2017 eric yu. All rights reserved.
//


import UIKit

extension UIView {
    func anchor(x: NSLayoutXAxisAnchor?, y: NSLayoutYAxisAnchor?,offsetX: CGFloat, offsetY: CGFloat,width: CGFloat, height: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        if let x = x {
            self.centerXAnchor.constraint(equalTo: x, constant: offsetX).isActive = true
        }
        
        if let y = y {
            self.centerYAnchor.constraint(equalTo: y, constant: offsetY).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        
        
    }
    
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}
