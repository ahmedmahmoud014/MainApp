//
//  HomePageCCell.swift
//  MainApp
//
//  Created by mac bokk pro on 2018-10-11.
//  Copyright © 2018 mac bokk pro. All rights reserved.
//

import UIKit

class HomePageCCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func   assignValue (imageName : String ){
        itemImage.image = UIImage(named: imageName)
    }

}
