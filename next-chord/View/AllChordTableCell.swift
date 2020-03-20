//
//  AllChordTableCellTableViewCell.swift
//  next-chord
//
//  Created by Cao Mai on 3/19/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class AllChordTableCell: UITableViewCell {
    
    @IBOutlet weak var allChordsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
