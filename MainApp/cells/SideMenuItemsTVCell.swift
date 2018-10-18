//
//  SideMenuItemsTVCell.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-04.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit


class SideMenuItemsTVCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func assignValues(item  : SideMenuItem){
        itemName.text =  item.name
        itemImage.image =  item.image
        
    }
    
}
