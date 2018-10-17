//
//  ItemsDetailsVC.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-14.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ItemsDetailsVC: UIViewController {
    var lastContentOffset: CGFloat = 0
    
    var cellOneHeight =  400
    @IBOutlet weak var itemDetailsTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // add cell to  tableview
        itemDetailsTV.register(UINib(nibName: "DawnCTVCell", bundle: nil), forCellReuseIdentifier: "DawnCTVCell")
        // add cell to  tableview
        itemDetailsTV.register(UINib(nibName: "UpperCItemTVCell", bundle: nil), forCellReuseIdentifier: "UpperCItemTVCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func dismissView (){
        dismiss(animated: true , completion: nil)
    }

}


extension ItemsDetailsVC :  UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  :  UITableViewCell!
        if indexPath.row == 0 {
            
         cell = itemDetailsTV.dequeueReusableCell(withIdentifier: "UpperCItemTVCell", for: indexPath) as!
            UpperCItemTVCell
          
        }
            
        else {
              cell = itemDetailsTV.dequeueReusableCell(withIdentifier: "DawnCTVCell", for: indexPath) as! DawnCTVCell
        }
      //  cell.assignValuesToTVCell(item: allItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row ==  0 {
            
            return CGFloat(cellOneHeight)

        }
        else {
            return 650

            
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return  60
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section)"
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        let headerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
//        let button: UIButton = UIButton(frame: CGRect(x:0, y:0, width:tableView.frame.width , height:80))
//        button.setImage(UIImage(named: "home_green"), for: .normal)
//        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
//        button.tag =  section
//        
//       // button.imageInButtonRight(position: .right, semanticContent: .forceRightToLeft, imageEdgeSet: UIEdgeInsetsMake(25,tableView.frame.width-45, 25, 15))
//            //button.titleLabel?.font = UIFont.init(name: "HacenAlgeria", size: 23)!
//        button.setTitleColor(UIColor.black, for:.normal )
//        button.backgroundColor = UIColor.white
//        //button.contentHorizontalAlignment = .right
//        button.setTitle("section1 ", for: .normal)
//        headerView.addSubview(button)
//        button.addShadowR(roundBorder: 20,opacity: 0.1)
//        
//        
//        
//        return headerView
//    }
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//
//        if targetContentOffset.pointee.y < scrollView.contentOffset.y {
//
//             print("move up ")
//            cellOneHeight =  200
//        } else {
//            // it's going down
//            print("move down  ")
//            cellOneHeight =  400
//
//
//        }
//        itemDetailsTV.reloadData()
//
//    }
    
    
//    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        self.lastContentOffset = scrollView.contentOffset.y
//    }
//
//    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (self.lastContentOffset < scrollView.contentOffset.y) {
//
//            // moved to up
//            cellOneHeight =  0
//
//        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
//            // moved to bottom
//            cellOneHeight =  400
//
//
//        } else {
//            // didn't move
//            print("move no  ")
//
//
//        }
//
//        itemDetailsTV.reloadData()
//
//
//    }
//
    
}
