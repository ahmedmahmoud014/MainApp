//
//  ViewController.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-04.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class MainViewController: UIViewController ,ReplaceViewControllerView,UITabBarDelegate{
    
    @IBOutlet weak var tabBar: UITabBar!
    //    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tabBarHeight: NSLayoutConstraint!
    
    
    func moveToView(vcName: String) {
        addViewControllerToContainer(asChildViewController:generateViewConTroller(controllerName: vcName) )
        self.revealViewController().revealToggle(animated: true)
    }
    
    
    
    @IBOutlet weak var spaceBetweenTabAndConTainer: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var showMenuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showMenuBtn.target = self.revealViewController()
        showMenuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        
        // for replace view inside conatainer view we used delegate
        SideMenuItemsVC.replaceVCView =  self
        
        // assign intial  value to  container view  yb
addViewControllerToContainer(asChildViewController:generateViewConTroller(controllerName: "HomeVC") )
        
// for tab style for iponex
        checkDeviceType ()
        
        
        
        
    }
    
    
    
    // generate view controller
    func generateViewConTroller(controllerName :  String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: controllerName)
        // Add View Controller as Child View Controller
        self.addViewControllerToContainer(asChildViewController: viewController)
        return viewController
    }
    
    // replace in  view controller
    fileprivate func addViewControllerToContainer( asChildViewController viewController: UIViewController) {
        
        for view in containerView.subviews{
            view.removeFromSuperview()
        }
        viewController.view.backgroundColor =  UIColor.clear
        viewController.view.frame = CGRect(x: 0, y: 0, width:containerView.bounds.width, height:  containerView.bounds.height) //Here
        containerView.addSubview(viewController.view)
        self.addChildViewController(viewController)
        viewController.didMove(toParentViewController: self.parent)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //revealViewController()
    }
    
    @IBAction func showMenu(_ sender: Any) {
        if self.revealViewController() != nil {
            //            showMenuBtn.target = self.revealViewController()
            //            showMenuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    
    func checkDeviceType () {
        
        tabBar.delegate =  self
        if UIDevice().userInterfaceIdiom == .phone {
            
            print("tttttttt\(UIScreen.main.nativeBounds.height)")
            let mobileHeight =  UIScreen.main.nativeBounds.height;
            if  mobileHeight >= 2436
            {
                //tabBarHeight.constant =  100
            }
            else if  mobileHeight ==  1792.0 {
                spaceBetweenTabAndConTainer.constant =  31
                tabBarHeight.constant =  80
                
            }
            else{
                spaceBetweenTabAndConTainer.constant  =  0
                print("tttttttt ٠")
                tabBarHeight.constant =  60
                
                
            }
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 0) {
            addViewControllerToContainer(asChildViewController:generateViewConTroller(controllerName: "HomeVC") )
        }
        else if(item.tag == 1) {
            //your code for tab item 2
            addViewControllerToContainer(asChildViewController:generateViewConTroller(controllerName: "SideMenuItem1VC") )
        }
        else {
            addViewControllerToContainer(asChildViewController:generateViewConTroller(controllerName: "HomeVC") )
            
        }
    }
    
}





