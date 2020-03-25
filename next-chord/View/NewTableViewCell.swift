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
    
    @IBOutlet weak var chordLabel1: UILabel!
    @IBOutlet weak var chordLabel2: UILabel!
    @IBOutlet weak var chordLabel3: UILabel!
    @IBOutlet weak var chordLabel4: UILabel!
    @IBOutlet weak var chordLabel5: UILabel!
    @IBOutlet weak var chordButtonLabel1: UIButton!
    @IBOutlet weak var chordButtonLabel2: UIButton!
    @IBOutlet weak var chordButtonLabel3: UIButton!
    @IBOutlet weak var chordButtonLabel4: UIButton!
    @IBOutlet weak var chordButtonLabel5: UIButton!
    
    var cellDelegate: TableViewSound?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setChord(with model: KeySignature) {
        chordButtonLabel1.layer.cornerRadius = 7
        chordButtonLabel2.layer.cornerRadius = 7
        chordButtonLabel3.layer.cornerRadius = 7
        chordButtonLabel4.layer.cornerRadius = 7
        chordButtonLabel5.layer.cornerRadius = 7
        chordButtonLabel1.setTitle(model.chord1, for: .normal)
        chordButtonLabel2.setTitle(model.chord2, for: .normal)
        chordButtonLabel3.setTitle(model.chord3, for: .normal)
                
        if let safeChord4 = model.chord4 {
            chordButtonLabel4.setTitle(safeChord4, for: .normal)
            chordButtonLabel4.isHidden = false
        } else {
            chordButtonLabel4.isHidden = true
        }
        
        if let safeChord5 = model.chord5 {
            chordButtonLabel5.setTitle(safeChord5, for: .normal)
            chordButtonLabel5.isHidden = false
        } else {
            chordButtonLabel5.isHidden = true
        }
    }
    
    func setLabels(with model: SetLabel) {
        chordLabel1.text = model.firstLabel
        chordLabel2.text = model.secondLabel
        chordLabel3.text = model.thirdLabel
        chordLabel4.text = model.fourthLabel
        chordLabel5.text = model.fithLabel
    }
    
    @IBAction func chordTapped(_ sender: UIButton) {
        cellDelegate?.onTap(playChord: sender.currentTitle!)
    }
    
}

