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
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "tableScreen")
        
        self.view.window!.rootViewController = newViewController

    }
    
}


struct MajorKeys {
    
    //    var I : String
    //    var ii : String
    //    var iii : String
    //    var IV : String
    //    var V : String
    //    var vi : String
    //    var viio : String
    
    var chord1 : String = ""
    var chord2 : String = ""
    var chord3 : String = ""
    
    var allChords = [String:String]()
    
    mutating func getProgessiveChords2(input1: String?, input2: String?, input3: String?=nil) {
        
        if let a = input1 {
            self.chord1 = allChords[a]!
        }else {}
        if let b = input2 {
            self.chord2 = allChords[b]!
        }else {}
        if let c = input3 {
            self.chord3 = allChords[c]!
        } else {}
    }
    
    
    func getProgessiveChords (input1: String?, input2: String?, input3: String?=nil, input4: String?=nil) -> [String] {
        
        var array : [String] = []
        
        if let a = input1 {
            array.append(allChords[a]!)
        }
        
        if let b = input2 {
            array.append(allChords[b]!)
        }else {
        }
        
        if let c = input3 {
            array.append(allChords[c]!)
        }else {
        }
        
        if let d = input4 {
            array.append(allChords[d]!)
        }else {
        }
        
        return array
        
    }
    
}

struct MinorKeys {
    
}

//let e = MajorKeys(I: "E", ii: "F#m", iii: "G#m", IV: "A", V: "B", vi: "C#m", viio: "D#o")


//var e = MajorKeys(allChords: ["I":"E", "ii": "F#m", "iii": "G#m", "IV": "A", "V": "B", "vi": "C#m", "viio": "D#o"])
//
//e.getProgessiveChords2(input1: "I", input2: "ii")
//print(e.chord1)
//print(e.chord2)
//
//let newArray = [["V", "ii"], ["ii", "V"]]
//var obj = [MajorKeys]()
//for i in 0..<newArray.count {
//
//    var new = MajorKeys(allChords: ["I":"E", "ii": "F#m", "iii": "G#m", "IV": "A", "V": "B", "vi": "C#m", "viio": "D#o"])
//    new.getProgessiveChords2(input1: newArray[0][i], input2: newArray[1][i])
//    obj.append(new)
//
//
//}
//
//print(obj[0])
