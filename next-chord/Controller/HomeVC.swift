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
        
        let cSharpMajor = KeySignature(keySignatureName: "C#", allChords: ["I":"C#", "ii":"D#m", "iii":"Fm", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#dim"])
        
        let dFlatMajor = KeySignature(keySignatureName: "Db", allChords: ["I":"Db", "ii":"Ebm", "iii":"Fm", "IV":"Gb", "V":"Ab", "vi":"Bbm", "viio":"Cdim"])
        
        let dMajor = KeySignature(keySignatureName: "D", allChords: ["I":"D", "ii":"Em", "iii":"F#m", "IV":"G", "V":"A", "vi":"Bm", "viio":"C#dim"])
        
        let eFlatMajor = KeySignature(keySignatureName: "Eb", allChords: ["I":"Eb", "ii":"Fm", "iii":"Gm", "IV":"Ab", "V":"Bb", "vi":"Cm", "viio":"Ddim"])
        
        let eMajor = KeySignature(keySignatureName: "E", allChords: ["I":"E", "ii":"F#m", "iii":"G#m", "IV":"A", "V":"B", "vi":"C#m", "viio":"D#dim"])
        
        let fMajor = KeySignature(keySignatureName: "F", allChords: ["I":"F", "ii":"Gm", "iii":"Am", "IV":"Bb", "V":"C", "vi":"C#m", "viio":"D#dim"])
        
        
        allMajorKeys.append(cMajor)
        allMajorKeys.append(cSharpMajor)
        allMajorKeys.append(dFlatMajor)
        allMajorKeys.append(dMajor)
        allMajorKeys.append(eFlatMajor)
        allMajorKeys.append(eMajor)
        allMajorKeys.append(fMajor)
        
    }
    
    func populateMinorKeyChords() {
        let cMinor = KeySignature(keySignatureName: "Cm", allChords: ["i":"Cm", "iio":"Ddim", "III":"Eb", "iv":"Fm", "v":"Gm", "VI":"Ab", "VII":"Bb"])
        
        let cSharpMinor = KeySignature(keySignatureName: "C#m", allChords: ["i":"C#m", "iio":"D#dim", "III":"E", "iv":"F#m", "v":"G#m", "VI":"A", "VII":"B"])
        
        let dMinor = KeySignature(keySignatureName: "Dm", allChords: ["i":"Dm", "iio":"Edim", "III":"F", "iv":"Gm", "v":"Am", "VI":"Bb", "VII":"C"])
        
        let dSharpMinor = KeySignature(keySignatureName: "D#m", allChords: ["i":"Dm", "iio":"E#dim", "III":"F#", "iv":"G#m", "v":"A#m", "VI":"B", "VII":"C#"])
        
        let eFlatMinor = KeySignature(keySignatureName: "Ebm", allChords: ["i":"Dm", "iio":"Fdim", "III":"Gb", "iv":"Abm", "v":"Bbm", "VI":"Cb", "VII":"Db"])
        
        
        allMinorKeys.append(cMinor)
        allMinorKeys.append(cSharpMinor)
        allMinorKeys.append(dMinor)
        allMinorKeys.append(dSharpMinor)
        allMinorKeys.append(eFlatMinor)
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
    
    @IBAction func selectButtonTapped(sender: UIButton) -> Void {
        print("button title: ", sender.currentTitle!)
        
        for majorkey in allMajorKeys {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "tableScreen") as! TableVC
            if (sender.currentTitle! == majorkey.keySignatureName!) {
                newViewController.theKey = majorkey
                self.navigationController?.pushViewController(newViewController, animated: true)
                return
            }
        }
        
        for minorkey in allMinorKeys {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "tableScreen") as! TableVC
            
            if (sender.currentTitle! == minorkey.keySignatureName!) {
                newViewController.minorKey = minorkey
                self.navigationController?.pushViewController(newViewController, animated: true)
            }
            
            
        }
        
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
//            majorChordCV.layer.borderColor = UIColor(red:122/255, green:155/255, blue:227/255, alpha: 1).cgColor
//            majorChordCV.layer.borderWidth = 2.0
//            majorChordCV.layer.cornerRadius = 8
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
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    
}
