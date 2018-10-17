//
//  HomeVC.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-08.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class HomeVC: BaseController {

    @IBOutlet weak var homeTView: UITableView!
    @IBOutlet weak var homeCollectionV: UICollectionView!
    var imagePosition  = 0
   static  var timer  :  Timer?
    @IBOutlet weak var imageSlider: UIImageView!
    
    var allItems = [HomeTVItems]()
    var allCategory = ["setting_green" ,"star_green" , "home_green", "user_green","setting_green" ,"star_green" , "home_green", "user_green","user_green","setting_green" ,"star_green" , "home_green", "user_green"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        print("baseeeeeeeee\( AppConstant().baseUrl)")
        
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
    
           // intialize image timer
           intializeImageSilderTimer()
          // silder action  click  in  swift
          let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
          imageSlider.isUserInteractionEnabled = true
          imageSlider.addGestureRecognizer(tapGestureRecognizer)
        //
        
    }
    func intializeImageSilderTimer(){
        // timer for maim  image
        HomeVC.timer  =   Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
    }
    func stopImageSilderTimer(){
        // stop timer for maim  image
        
        if HomeVC.timer !=  nil
        {
        
            HomeVC.timer?.invalidate()
           HomeVC.timer = nil

            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
       if  HomeVC.timer ==  nil {
        intializeImageSilderTimer()
        }
     }
    
    
    // silder action
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        stopImageSilderTimer()

        // Your action
    }
    
    // must be internal or public.
    @objc func update() {
        
        if  HomeVC.timer !=  nil {
        // Something cool
        if imagePosition < allCategory.count ||  imagePosition > allCategory.count
        {
        imageSlider.image   =  UIImage(named:allCategory[imagePosition] )
            imagePosition += 1

       // print("print test \(image.tag)")
        }
        else {
            imagePosition = 0
            imageSlider.image   =  UIImage(named:allCategory[imagePosition] )
        }
            
        }
    }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc:UIViewController!
        if (indexPath.row % 2 ==  0){
         vc = self.storyboard?.instantiateViewController(withIdentifier: "ItemsDetailsVC")
        }else{
        vc = self.storyboard?.instantiateViewController(withIdentifier: "ExpandAndCollapsListVC")
        }
        dismiss(animated: true, completion: nil)
        self.show(vc!, sender: self)
        stopImageSilderTimer()

    }
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//
//        if targetContentOffset.pointee.y < scrollView.contentOffset.y {
//            // it's going up
//
//
//            if homeCollectionV.isHidden {
//                homeCollectionV.isHidden =  false
//                imageSlider.isHidden =  false
//            }
//        } else {
//            // it's going down
//            if !homeCollectionV.isHidden {
//                homeCollectionV.isHidden =  true
//                imageSlider.isHidden =  true
//
//            }
//        }
//
//    }
//
    
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.showAlert(message: "tteeee", title: "rr")
        print("section  \(indexPath.section) index \(indexPath.row)")
    }
    
    
    
}

