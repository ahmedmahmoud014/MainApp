//
//  c.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-09-24.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
class  CallAPI {
    
    func getData ( url : String , callBack:  @escaping (_ resultValue  : Result<Any>,_ code: Int)->()) {
        
        print("url is :: \(url)")
        Alamofire.request(url)
            .responseJSON { response in
                callBack(response.result,(response.response?.statusCode)!)
        }
        
    }
    
    
    func postData( url : String ,parameters :  Parameters, callBack:  @escaping (_ resultValue  : Result<Any>,_ code: Int)->()){
        print("url is :: \(url)")
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                
            callBack(response.result,(response.response?.statusCode)!)

        }
                
                
        
        
    }
}
