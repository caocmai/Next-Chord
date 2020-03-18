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
    
    @IBOutlet weak var chordLabel3: UILabel!
    
    @IBOutlet weak var chordLabel4: UILabel!
    
    @IBOutlet weak var chordButtonLabel1: UIButton!
    
    @IBOutlet weak var chordButtonLabel2: UIButton!
    
    @IBOutlet weak var chordButtonLabel3: UIButton!
    
    @IBOutlet weak var chordButtonLabel4: UIButton!
    
    
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
        chordButtonLabel1.setTitle(model.chord1, for: .normal)
        chordButtonLabel2.setTitle(model.chord2, for: .normal)
        chordButtonLabel3.setTitle(model.chord3, for: .normal)
        chordButtonLabel4.setTitle(model.chord4, for: .normal)
    }
    
    func setLabels(with model: SetLabel) {
        labelName.text = model.firstLabel
        chordLabel2.text = model.secondLabel
        chordLabel3.text = model.thirdLabel
        chordLabel4.text = model.fourthLabel        
    }

    @IBAction func chordTapped(_ sender: UIButton) {
        delegate?.onTap(playChord: chordLabel2.text!)
    }
    
}

