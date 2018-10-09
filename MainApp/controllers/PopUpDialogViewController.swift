//
//  PopUpDialogViewController.swift
//  Mofa
//
//  Created by mac bokk pro on 2018-09-20.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class PopUpDialogViewController: UIViewController {
    public var message : String!
    public var height : CGFloat!


    @IBOutlet  weak  var dialogViewHeight: NSLayoutConstraint!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var showMessage: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backBtn.addShadow(roundBorder: 20, opacity: 0.2)
        dialogView.addShadow(roundBorder: 20, opacity:0.2)
        showMessage.text =  message
        if  message.count <= 30{
        dialogViewHeight.constant =  110
        }
        else if  message.count <= 60 {
            dialogViewHeight.constant =  130
        }
        else{
            dialogViewHeight.constant =  150

        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func backAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
