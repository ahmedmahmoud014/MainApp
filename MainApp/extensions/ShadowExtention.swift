//
//  ShadowExtention.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-03-25.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func addShadow(roundBorder:CGFloat , opacity: Float){
            self.layer.cornerRadius = roundBorder
            self.layer.shadowColor = UIColor.black.cgColor
//           self.layer.shadowColor = UIColor(red: 0, green: 118, blue: 169, alpha: 1.0).cgColor as CGColor
            //self.layer.shadowOffset = CGSize(width: 0, height: 1)
            self.layer.shadowOpacity = opacity
            self.layer.shadowRadius = 8
//            self.clipsToBounds = false
//            self.layer.masksToBounds = false
        

        }
    
    func addShadowR(roundBorder:CGFloat , opacity: Float){
        self.layer.cornerRadius = roundBorder
        self.layer.shadowColor = UIColor.black.cgColor
       // self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 8
       // self.clipsToBounds = false 
        //self.layer.masksToBounds = true
        
        
    }
    
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addShadowRe(roundBorder:CGFloat , opacity: Float){
        self.layer.cornerRadius = roundBorder
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 8
        // self.clipsToBounds = false
        //self.layer.masksToBounds = true
        
        let path = UIBezierPath(roundedRect: self.layer.bounds,
                                byRoundingCorners:[.topRight, .bottomLeft],
                                cornerRadii: CGSize(width: 20, height:  20))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
        
    }
    
    
    
}
    
    

