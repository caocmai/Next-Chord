//
//  ViewController.swift
//  next-chord
//
//  Created by Cao Mai on 3/16/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var chords = [["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bo"],
                  ["I":"C#", "ii":"D#m", "iii":"E#m", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#o"],
                  ["I":"Db", "ii":"Ebm", "iii":"Fm", "IV":"Gb", "V":"Ab", "vi":"Bbm", "viio":"Co"]
        
    ]
    
    // Could do a struct here for major and for minor
    let chordsCMajor : [String:String] = ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bo"]
    
    
    let cMajor = MajorKeys(allChords: ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bo"])

    
    let cSharpMajor = MajorKeys(allChords: ["I":"C#", "ii":"D#m", "iii":"E#m", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#o"])

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextVCTapped(_ sender: UIButton) {
        
        print(sender.currentTitle!)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "chordScreen") as! ChordVC
        newViewController.labelName = chords[0]["I"] ?? "None"
        // Do a switch statement here!
        if sender.currentTitle! == "chordCMajor" {
            newViewController.allChords = chordsCMajor
            
            self.view.window!.rootViewController = newViewController
            
            // This to move as navigationcontroller, but not must embed the nagivation controller in the storyboard first!
            //        self.navigationController?.pushViewController(newViewController, animated: true)
            
            // To present view
            //        self.present(newViewController, animated: true, completion: nil)
        } else {
            print("Nothing here")
        }
    }
    
    
    @IBAction func toTableTapped(_ sender: UIButton) {
        
        print(sender.currentTitle!)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "tableScreen") as! TableVC
        
        if sender.currentTitle! == "ToTable" {
            newViewController.theKey = cMajor
            self.view.window!.rootViewController = newViewController
            

        } else {
            print("nothing here")
        }
        
//        self.view.window!.rootViewController = newViewController

    }
    
}
