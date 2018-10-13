//
//  HomeVC.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-08.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeTView: UITableView!
    @IBOutlet weak var homeCollectionV: UICollectionView!
    
    
    var allItems = [HomeTVItems]()
    var allCategory = ["setting_green" ,"star_green" , "home_green", "user_green","setting_green" ,"star_green" , "home_green", "user_green","user_green","setting_green" ,"star_green" , "home_green", "user_green"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        allItems.append(
            HomeTVItems(itemName: "home",itemImage: "home_green",itemDescription: "home_green"))
        allItems.append(
            HomeTVItems(itemName: "setting",itemImage: "setting_green",itemDescription: "setting_green"))
        allItems.append(
            HomeTVItems(itemName: "star",itemImage: "star_green",itemDescription: "star_green"))
        allItems.append(
            HomeTVItems(itemName: "user",itemImage: "user_green",itemDescription: "user_green"))
        allItems.append(
            HomeTVItems(itemName: "home",itemImage: "home_green",itemDescription: "home_green"))
        allItems.append(
            HomeTVItems(itemName: "setting",itemImage: "setting_green",itemDescription: "setting_green"))
        allItems.append(
            HomeTVItems(itemName: "star",itemImage: "star_green",itemDescription: "star_green"))
        allItems.append(
            HomeTVItems(itemName: "user",itemImage: "user_green",itemDescription: "user_green"))
        
        
        // add cell to  tableview
        homeTView.register(UINib(nibName: "HomePageTVCell", bundle: nil), forCellReuseIdentifier: "HomePageTVCell")
    
//        // add cell to  collection view
        let nib = UINib(nibName: "HomePageCCell", bundle: nil)
        homeCollectionV.register(nib, forCellWithReuseIdentifier: "HomePageCCell")
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// for table view items
extension HomeVC  :  UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTView.dequeueReusableCell(withIdentifier: "HomePageTVCell", for: indexPath) as! HomePageTVCell
        cell.assignValuesToTVCell(item: allItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}


// for collection view items
extension HomeVC  :UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = homeCollectionV.dequeueReusableCell(withReuseIdentifier: "HomePageCCell", for: indexPath) as! HomePageCCell
        
        cell.assignValue(imageName: allCategory[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 10, height: 10)
    }
    
    
}

