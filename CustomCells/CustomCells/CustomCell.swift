//
//  CustomCell.swift
//  CustomCells
//
//  Created by rishabh.yadav on 5/25/17.
//  Copyright © 2017 rishabh.yadav. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet var photo: UIImageView!
    @IBOutlet var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
