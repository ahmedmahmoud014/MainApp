//
//  ExpandAndCollapsTVCell.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-16.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class ExpandAndCollapsTVCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func assignValues(item :ExpandAndCollapsStruct) {
        itemName.text =  item.itemName
        
    }
    
}
