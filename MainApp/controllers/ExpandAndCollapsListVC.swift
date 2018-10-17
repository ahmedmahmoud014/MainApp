//
//  ExpandAndCollapsListVC.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-16.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ExpandAndCollapsListVC: UIViewController {
    var  allItemArray  = [ExpandAndCollapsStruct]()
    var expandOrCollapsStatus  =  5
   
    @IBOutlet weak var itemsTB: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // add cell to  tableview
        itemsTB.register(UINib(nibName: "ExpandAndCollapsTVCell", bundle: nil), forCellReuseIdentifier: "ExpandAndCollapsTVCell")
        allItemArray.append(ExpandAndCollapsStruct(imageName: "home_green",itemName: "item1"))
        allItemArray.append(ExpandAndCollapsStruct(imageName: "home_green",itemName: "item2"))
        allItemArray.append(ExpandAndCollapsStruct(imageName: "home_green",itemName: "item3"))
        allItemArray.append(ExpandAndCollapsStruct(imageName: "home_green",itemName: "item4"))

        
    }
    
    @objc func expandOrCollaps (sender: UIButton){
        if expandOrCollapsStatus !=  sender.tag{
            expandOrCollapsStatus  = sender.tag
            
        }else {
            expandOrCollapsStatus =  5
        }
        print("test test test  \(sender.tag)")
        itemsTB.reloadData()
    }
   

}

// for table view items
extension ExpandAndCollapsListVC  :  UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandOrCollapsStatus  == section {
            return allItemArray.count

        }
        else {
            return 0

        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : ExpandAndCollapsTVCell!
        if indexPath.section == expandOrCollapsStatus  {
            cell = itemsTB.dequeueReusableCell(withIdentifier: "ExpandAndCollapsTVCell", for: indexPath) as! ExpandAndCollapsTVCell
            cell.assignValues(item: allItemArray[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "section  \(section)"
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ItemsDetailsVC")
        dismiss(animated: true, completion: nil)
        self.show(vc!, sender: self)
        
    }
    
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    
            //  UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 150))
            let footerView = UIView(frame: CGRect(x:0, y: 0, width: tableView.frame.width, height: 10))
            footerView.backgroundColor = UIColor.clear
    
            return footerView
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cgRect = CGRect(x:0, y: 0, width: itemsTB.frame.width, height: 60)
        let  headerView  =   UIView(frame:cgRect )
        let button = UIButton(frame:cgRect )
        button.setTitle("teeeeest \(section)", for: .normal)
        button.addTarget(self, action: #selector(expandOrCollaps), for: .touchUpInside)
        button.tag =  section
        button.backgroundColor = UIColor.blue
        headerView.addSubview(button)
        headerView.backgroundColor =  UIColor.red
        
        return headerView;
    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
//    {
//
//
//    }

    
}
