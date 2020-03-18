//
//  NewTableViewCell.swift
//  next-chord
//
//  Created by Cao Mai on 3/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

protocol TableViewSound {
    func onTap(playChord: String)
}

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var chordLabel2: UILabel!
    
    var delegate: TableViewSound?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setChord(with model: MajorKeys) {
        labelName.text = model.chord1
        chordLabel2.text = model.chord2
    }

    @IBAction func chordTapped(_ sender: UIButton) {
        delegate?.onTap(playChord: chordLabel2.text!)
    }
    
}
