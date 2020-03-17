//
//  ChordVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/16/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ChordVC: UIViewController {
    

    @IBOutlet weak var chordButtonLabel: UIButton!
    @IBOutlet weak var chordLabel: UILabel!
    
    var allChords : [String:String] = [:]
    var labelName : String = ""
    
    var commonChordProgessions : [[String]] = [
                                                ["I", "V", "vi", "IV"],
                                                ["I", "IV", "I", "V"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .yellow
        chordLabel.text = labelName
        chordButtonLabel.setTitle(allChords["I"], for: .normal)
        print(allChords["I"]!)
        
        for (_, item) in commonChordProgessions.enumerated() {
            for innerItem in item {
                print("innerIEM", innerItem)
//                print(type(of: innerItem))
                print("chord", allChords[innerItem]!)
            }
            print("------------")

        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chordButtonPressed(_ sender: UIButton) {
        print(sender.currentTitle ?? "NONE")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
