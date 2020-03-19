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
    
    let chordsCMajor : [String:String] = ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bdim"]
    
    
    let cMajor = KeySignature(allChords: ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bdim"])
    
    
    let cSharpMajor = KeySignature(allChords: ["I":"C#", "ii":"D#m", "iii":"E#m", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#o"])
    
    let cMinor = KeySignature(allChords: ["i":"Cm", "iio":"Ddim", "III":"Eb", "iv":"Fm", "v":"Gm", "VI":"Ab", "VII":"Bb"])
    
    var allMajorKeys = [KeySignature]()
    var allMinorKeys = [KeySignature]()
    
    @IBOutlet weak var majorChordCV: UICollectionView!
    
    @IBOutlet weak var minorChordCV: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.definesPresentationContext = true
        
        populateMajorKeyChords()
        populateMinorKeyChords()
        navigationItem.title = "Select a Key"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func populateMajorKeyChords() {
        
        let cMajor = KeySignature(keySignatureName: "C", allChords: ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bdim"])
        
        
        let cSharpMajor = KeySignature(keySignatureName: "C#", allChords: ["I":"C#", "ii":"D#m", "iii":"E#m", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#o"])
        
        
        allMajorKeys.append(cMajor)
        allMajorKeys.append(cSharpMajor)
        
        
    }
    
    func populateMinorKeyChords() {
        let cMinor = KeySignature(keySignatureName: "Cm", allChords: ["i":"Cm", "iio":"Ddim", "III":"Eb", "iv":"Fm", "v":"Gm", "VI":"Ab", "VII":"Bb"])
        
        
        allMinorKeys.append(cMinor)
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
            newViewController.minorKey = cMinor
            self.view.window!.rootViewController = newViewController
        } else {
            print("nothing here")
        }
        
        //        self.view.window!.rootViewController = newViewController
        
    }
    
    @IBAction func selectButtonTapped(sender: UIButton) -> Void {
        print("button title: ", sender.currentTitle!)
        
        
        
        
        
        for majorkey in allMajorKeys {
            print(majorkey.keySignatureName!)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "tableScreen") as! TableVC
            if (sender.currentTitle! == majorkey.keySignatureName!) {
                newViewController.theKey = majorkey
                self.navigationController?.pushViewController(newViewController, animated: true)
                return
            }
        }
        
        for minorkey in allMinorKeys {
            print(minorkey.keySignatureName!)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "tableScreen") as! TableVC
            
            if (sender.currentTitle! == minorkey.keySignatureName!) {
                newViewController.minorKey = minorkey
                self.navigationController?.pushViewController(newViewController, animated: true)
            }
            
            
        }
        
        
        
        //        if sender.currentTitle! == "C" {
        //            newViewController.theKey = cMajor
        ////            self.view.window!.rootViewController = newViewController
        //            self.navigationController?.pushViewController(newViewController, animated: true)
        //        } else {
        //            print("nothing here")
        //        }
        
        
    }
    
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == minorChordCV {
            return allMinorKeys.count
        } else {
            return allMajorKeys.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == minorChordCV {
            
            let cell1 = minorChordCV.dequeueReusableCell(withReuseIdentifier: "collectionViewCell2", for: indexPath) as! MinorChordCell
            cell1.backgroundColor = .blue
            cell1.layer.cornerRadius = 10
            
            cell1.minorChordButtonLabel.setTitle(allMinorKeys[indexPath.row].keySignatureName, for: .normal)
            cell1.minorChordButtonLabel.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
            
            
            return cell1
        } else {
            let cell = majorChordCV.dequeueReusableCell(withReuseIdentifier: "collectionViewCell1", for: indexPath) as! MajorChordCell
            cell.backgroundColor = .yellow
            cell.layer.cornerRadius = 10
            
            cell.majorChordButtonLabel.setTitle(allMajorKeys[indexPath.row].keySignatureName, for: .normal)
            cell.majorChordButtonLabel.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
            
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    
}
