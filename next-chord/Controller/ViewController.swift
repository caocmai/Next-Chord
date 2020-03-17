//
//  ViewController.swift
//  next-chord
//
//  Created by Cao Mai on 3/16/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var chords = [["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bo"],
                  ["I":"C#", "ii":"D#m", "iii":"E#m", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#o"],
                  ["I":"Db", "ii":"Ebm", "iii":"Fm", "IV":"Gb", "V":"Ab", "vi":"Bbm", "viio":"Co"]

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }

    @IBAction func nextVCTapped(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "chordScreen") as! ChordVC
        newViewController.labelName = chords[0]["I"] ?? "None"
        newViewController.allChords = chords[0]

        self.view.window!.rootViewController = newViewController

        // This to move as navigationcontroller, but not must embed the nagivation controller in the storyboard first!
//        self.navigationController?.pushViewController(newViewController, animated: true)
        
        // To present view
//        self.present(newViewController, animated: true, completion: nil)
    }
    
}

