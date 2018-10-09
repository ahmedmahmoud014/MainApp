//
//  StringValidation.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-06-26.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    
    
    func beginWithValue()-> Bool {
      //  009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/
        // regex for number
        
        if self.hasPrefix("+"){
        //    SingletonClass().sharedInstance.phoneNumberLenght =  13
            
        }
        else {
           // SingletonClass().sharedInstance.phoneNumberLenght =  14

        }
        let phoneRegex = "^(00966|966|\\+966|05|5)[0-9]{6,14}$";
        let valid = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: self)
        return valid
        
//        if self.hasPrefix("00966"){
//            return true
//        }
//       else if self.hasPrefix("٠٠٩٦٦"){
//            return true
//        }
//        else{
//            return false
//        }
    }
    
    
    
    func maxLenght(maxNumber : Int )-> Bool {
        if self.count < maxNumber {
            return true
        }
        else{
            return false
        }
    }
    
    
    
    
    
    
    
    func equalLenghtTo(maxNumber : Int )-> Bool {
        if self.count ==  maxNumber {
            return true
        }
            
        else{
            return false
        }
    }
    
}
