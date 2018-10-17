//
//  LoginVC.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-16.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

import FacebookLogin
import FBSDKLoginKit

class LoginVC: BaseController
{
    @IBOutlet weak var loginWithFacBookAction: UIButton!
    var dict : [String : AnyObject]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LoginWithFaceBook(_ sender: Any) {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                    self.loginWithFacBookAction.titleLabel?.text =  "LogOut"
                }
            }
        }
    }

    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    // get user data
                    print("tttttttttttt \(self.dict["email"]!)")
                    print("tttttttttttt \(self.dict["id"]!)")
                    //The url is nested 3 layers deep into the result so it's pretty messy
                    if let imageURL = ((self.dict["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
                        //Download image from imageURL
                        print("tttttttttttt \(imageURL)")
                        self.performSegue(withIdentifier: "moveToMainPage", sender: self)


                    }
                }
            })
        }
    }
}



