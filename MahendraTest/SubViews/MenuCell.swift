//
//  MenuCell.swift
//  MahendraTest
//
//  Created by Mahendra Vishwakarma on 18/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subCategory: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo(info:SubCategory){
        nameLabel.text = info.name.capitalized
        subCategory.text = info.displayName
    }
    
}
