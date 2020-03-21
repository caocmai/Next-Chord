//
//  GetNextChordVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class GetNextChordVC: UIViewController {
    
    var allMajorKeys = [KeySignature]()
    var allTotalChords = [String]()
    
    var allOfChords = [String]()
    
    var progessiveChords = [KeySignature]()
    
    var everyProgessiveChords = [[String]]()
    
    var test = [String]()
    
    @IBOutlet weak var allChordsView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Find The Next Chord"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    
        
        allChordsView.register(UINib(nibName: "NextChordCell", bundle: .main), forCellWithReuseIdentifier: "nextChordcell")
        

        getAllMajorKeys()
        getTest()
        getMajorProgessiveChords()
        getEveryProgessiveChords()
//        let chords = getNextChord(starting: "G")
//        print("all next chords for G:", getNextChord(starting: "G"))
//        for chord in chords {
//            print("Getting next chord of \(chord):", getNextChord(starting: chord))
//        }
        
        // Do any additional setup after loading the view.
    }
    
    func getTest() {
        
        var testArray = [String]()
        for stuff in allMajorKeys {
//            print(stuff.allChords)
            for thing in stuff.allChords.values {
                testArray.append(thing)
                
            }
        }
        
        for item in testArray {
            if test.contains(item) == false {
                test.append(item)
            }
        }
        
//        print(test)
    }
    
    
    
    func getAllMajorKeys() {
        let cMajor = KeySignature(keySignatureName: "C", allChords: ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bdim"])
        
        let dMajor = KeySignature(keySignatureName: "D", allChords: ["I":"D", "ii":"Em", "iii":"F#m", "IV":"G", "V":"A", "vi":"Bm", "viio":"C#dim"])
        
        allMajorKeys.append(cMajor)
        allMajorKeys.append(dMajor)
    }
        
    func getMajorProgessiveChords() {
        
        let threeChords = [["I", "IV", "V"], // C F G
                        ["ii", "V", "I"], // Dm G C
                        ["V", "IV", "I"],
        ]
        
        for i in 0..<threeChords.count {
            for key in allMajorKeys {
                var new = key
                new.getProgessiveChords(input1: threeChords[i][0], input2: threeChords[i][1], input3: threeChords[i][2])
                progessiveChords.append(new)
            }
            
        }
    }
    
    func getEveryProgessiveChords() {
        for chord in progessiveChords {
            
            var tempArray = [String]()
            
            tempArray.append(chord.chord1!)
            tempArray.append(chord.chord2!)
            tempArray.append(chord.chord3!)
            
            everyProgessiveChords.append(tempArray)
        }
        
//        print(everyProgessiveChords)
    }
    
    func getNextChord(starting: String) -> [String] {
        
        var nextChordArray = [String]()

        for i in 0..<everyProgessiveChords.count{
//            print(everyProgessiveChords[i])
            for y in 0..<everyProgessiveChords[i].count - 1 {
                
                if everyProgessiveChords[i][y] == starting {
                    nextChordArray.append(everyProgessiveChords[i][y+1])
                }
            }
        }
        return nextChordArray
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


extension GetNextChordVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = allChordsView.dequeueReusableCell(withReuseIdentifier: "nextChordcell", for: indexPath) as! NextChordCell
        cell.backgroundColor = .yellow
        cell.chordButtonLabel.setTitle(test[indexPath.row], for: .normal)
        cell.chordButtonLabel.addTarget(self, action: #selector(chordButtonTapped), for: .touchUpInside)
        return cell
    }
    
    @IBAction func chordButtonTapped(sender: UIButton) -> Void {
//        print(sender.currentTitle!)
//        print("test")
        
        let nextChords = getNextChord(starting: sender.currentTitle!)
        
        print(nextChords)
    }
    
    
}
