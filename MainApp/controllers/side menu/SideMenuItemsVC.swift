//
//  SideMenuItemsVC.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-04.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class SideMenuItemsVC: BaseController ,UITableViewDelegate,UITableViewDataSource{
    public static var replaceVCView : ReplaceViewControllerView!
    var allItems = [SideMenuItem]()
    @IBOutlet weak var allItemsTB: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       intailizeTable() 
    }
    
    func intailizeTable() {
        allItemsTB.delegate = self
        allItemsTB.dataSource = self

        
        
        allItems.append(SideMenuItem(name: "HomeVC",image: UIImage(named: "background_gray")))
        allItems.append(SideMenuItem(name: "SideMenuItem1VC",image: UIImage(named: "gray_background")))
        allItems.append(SideMenuItem(name: "HomeVC",image: UIImage(named: "background_gray")))
        allItems.append(SideMenuItem(name: "SideMenuItem1VC",image: UIImage(named: "gray_background")))
        allItems.append(SideMenuItem(name: "HomeVC",image: UIImage(named: "background_gray")))
        allItemsTB.register(UINib(nibName: "SideMenuItemsTVCell", bundle: nil), forCellReuseIdentifier: "SideMenuItemsTVCell")

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   SideMenuItemsVC.replaceVCView.moveToView(vcName: allItems[indexPath.row].name!)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuItemsTVCell", for: indexPath) as! SideMenuItemsTVCell
        cell.assignValues(item: allItems[indexPath.row])
        
        return cell

    }
    
    
    
    

  

}
