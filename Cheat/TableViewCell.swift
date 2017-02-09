//
//  TableViewCell.swift
//  Cheat
//
//  Created by Anh Tuan on 2/9/17.
//  Copyright © 2017 Anh Tuan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lbl : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
