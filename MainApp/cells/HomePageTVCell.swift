//
//  HomePageTVCell.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-11.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class HomePageTVCell: UITableViewCell {

    @IBOutlet weak var itemdescription: UILabel!
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
    
    func assignValuesToTVCell(item : HomeTVItems){
        itemName.text =  item.itemName
        itemdescription.text =  item.itemDescription
        itemImage.image = UIImage(named : item.itemImage)
    }
    
}
