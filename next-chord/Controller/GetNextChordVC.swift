//
//  GetNextChordVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit
import AVFoundation

class GetNextChordVC: UIViewController {
    
    var player : AVAudioPlayer?
    
    var allMajorKeys = [KeySignature]()

    var allTotalChords = [String]()
    
    var allOfChords = [String]()
    
    var progessiveChordsForMajorKeys = [KeySignature]() // Think can monify to be both minor and major just append to this array
    
    var allProgessiveChords = [[String]]()
    
    var test = [String]()
    
    var nextChordsArray : [String] = []
    var nextChordLabel : String = ""
    
    var returnedChord : String?
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var allChordsView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Find The Next Chord"
        navigationController?.navigationBar.prefersLargeTitles = true

        allChordsView.register(UINib(nibName: "NextChordCell", bundle: .main), forCellWithReuseIdentifier: "nextChordcell")
        
        shouldHideResetButton()
        createRomanMajorChords()
        getTest()
        getAllMajorProgessiveChords()
        getEveryProgessiveChords()
//        print(nextChordsArray)
        
//        let chords = getNextChord(starting: "G")
//        print("all next chords for G:", getNextChord(starting: "G"))
//        for chord in chords {
//            print("Getting next chord of \(chord):", getNextChord(starting: chord))
//        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "secondChordVC" {
            let destinationVC = segue.destination as! SecondChordVC
            destinationVC.chordSelectionDelegate = self
            destinationVC.chordLabel = nextChordLabel
            destinationVC.secondChordsArray = nextChordsArray
        }
    }
    
    func shouldHideResetButton() {
        resetButton.layer.cornerRadius = 8
        
        allChordsView.translatesAutoresizingMaskIntoConstraints = false
        

        if returnedChord == nil {
            resetButton.isHidden = true
            allChordsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 20).isActive = true

        } else {
            allChordsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 60).isActive = true

        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("reset")
        returnedChord = nil
        allChordsView.reloadData()
        navigationItem.title = "Find The Next Chord"
        resetButton.isHidden = true


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
    //Ony for Major Keys!
    func createRomanMajorChords() {
        let cMajor = KeySignature(keySignatureName: "C", allChords: ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bdim"])
        
        let cSharpMajor = KeySignature(keySignatureName: "C#", allChords: ["I":"C#", "ii":"D#m", "iii":"Fm", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#dim"])
        
        let dFlatMajor = KeySignature(keySignatureName: "Db", allChords: ["I":"Db", "ii":"Ebm", "iii":"Fm", "IV":"Gb", "V":"Ab", "vi":"Bbm", "viio":"Cdim"])
        
        let dMajor = KeySignature(keySignatureName: "D", allChords: ["I":"D", "ii":"Em", "iii":"F#m", "IV":"G", "V":"A", "vi":"Bm", "viio":"C#dim"])
        
        let eFlatMajor = KeySignature(keySignatureName: "Eb", allChords: ["I":"Eb", "ii":"Fm", "iii":"Gm", "IV":"Ab", "V":"Bb", "vi":"Cm", "viio":"Ddim"])
        
        let eMajor = KeySignature(keySignatureName: "E", allChords: ["I":"E", "ii":"F#m", "iii":"G#m", "IV":"A", "V":"B", "vi":"C#m", "viio":"D#dim"])
        
        let fMajor = KeySignature(keySignatureName: "F", allChords: ["I":"F", "ii":"Gm", "iii":"Am", "IV":"Bb", "V":"C", "vi":"Dm", "viio":"Edim"])
        
        allMajorKeys.append(cMajor)
        allMajorKeys.append(cSharpMajor)
        allMajorKeys.append(dFlatMajor)
        allMajorKeys.append(dMajor)
        allMajorKeys.append(eFlatMajor)
        allMajorKeys.append(eMajor)
        allMajorKeys.append(fMajor)


    }
    
    //Because this is pattern for major keys
    func getAllMajorProgessiveChords() {
        
        let threeChords = [["I", "IV", "V"], // C F G
                        ["ii", "V", "I"], // Dm G C
                        ["V", "IV", "I"],
        ]
        
        for i in 0..<threeChords.count {
            for key in allMajorKeys {
                var new = key
                new.getProgessiveChords(input1: threeChords[i][0], input2: threeChords[i][1], input3: threeChords[i][2])
                progessiveChordsForMajorKeys.append(new)
            }
            
        }
                
        let fourChords = [["I", "vi", "IV", "V"],
                          ["I", "vi", "ii", "V"],
                          ["I", "V", "vi", "IV"],
                          ["I", "IV", "vi", "V"],
                          ["I", "iii", "IV", "V"],
                          ["I", "IV", "I", "V"],
                          ["I", "IV", "ii", "V"],
                          ["vi", "ii", "V", "I"],
        ]

        for i in 0..<fourChords.count {
            for key in allMajorKeys {
                var new = key
                new.getProgessiveChords(input1: fourChords[i][0], input2: fourChords[i][1], input3: fourChords[i][2], input4: fourChords[i][3])
                progessiveChordsForMajorKeys.append(new)
            }

        }
        
        let fiveChords = [["I", "V", "vi", "iii", "IV"],
                          ["IV", "ii", "I", "V", "I"],
        ]

        for i in 0..<fiveChords.count {
            for key in allMajorKeys {
                var new = key
                new.getProgessiveChords(input1: fiveChords[i][0], input2: fiveChords[i][1], input3: fiveChords[i][2], input4: fiveChords[i][3], input5: fiveChords[i][4])
                progessiveChordsForMajorKeys.append(new)
            }

        }
        
        
    }
    
    func getEveryProgessiveChords() {
        for chord in progessiveChordsForMajorKeys {
            
            var tempArray = [String]()
            
            tempArray.append(chord.chord1!)
            tempArray.append(chord.chord2!)
            tempArray.append(chord.chord3!)
            if let safe = chord.chord4 {
                tempArray.append(safe)
            }
        
            allProgessiveChords.append(tempArray)
        }
        
//        print(everyProgessiveChords)
    }
    
    func getNextChord(starting: String) -> [String] {
        
        var nextChordArrayWithDuplicates = [String]()

        for i in 0..<allProgessiveChords.count{
//            print(everyProgessiveChords[i])
            // Goes forward
            for y in 0..<allProgessiveChords[i].count - 1 {
                if allProgessiveChords[i][y] == starting {
                    nextChordArrayWithDuplicates.append(allProgessiveChords[i][y+1])

                }
            }
            
            // Goes backwards
            for y in 1..<allProgessiveChords[i].count {
                if allProgessiveChords[i][y] == starting {
                    nextChordArrayWithDuplicates.append(allProgessiveChords[i][y-1])

                }
            }
        }
//        print(nextChordArrayWithDuplicates)
        
        var removeDuplicate = [String]()
        
        for item in nextChordArrayWithDuplicates {
            if removeDuplicate.contains(item) == false {
                removeDuplicate.append(item)
            }
        }
        
        return removeDuplicate
    }
    
}


extension GetNextChordVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if returnedChord != nil {
            return nextChordsArray.count
        } else {
            return test.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if returnedChord != nil {
            let cell = allChordsView.dequeueReusableCell(withReuseIdentifier: "nextChordcell", for: indexPath) as! NextChordCell
//            print("the button is not nil")
            cell.layer.cornerRadius = 7
            cell.backgroundColor = .red
            cell.chordButtonLabel.setTitle(nextChordsArray[indexPath.row], for: .normal)
            cell.chordButtonLabel.addTarget(self, action: #selector(chordButtonTapped), for: .touchUpInside)
            return cell
        } else {
            let cell = allChordsView.dequeueReusableCell(withReuseIdentifier: "nextChordcell", for: indexPath) as! NextChordCell
//            print("button is nil")
            cell.layer.cornerRadius = 7
            cell.backgroundColor = .yellow
            cell.chordButtonLabel.setTitle(test[indexPath.row], for: .normal)
            cell.chordButtonLabel.addTarget(self, action: #selector(chordButtonTapped), for: .touchUpInside)
            return cell
        }
    }
    
    func playSound(soundName: String) {
        //        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        //        player = try! AVAudioPlayer(contentsOf: url!)
        //        player?.play()
        
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func chordButtonTapped(sender: UIButton) -> Void {
//        print(sender.currentTitle!)
//        print("test")
        nextChordLabel = sender.currentTitle!
//        print(nextChordLabel)
        nextChordsArray = getNextChord(starting: sender.currentTitle!)
        
        // TO Play sounds, enable this line
//        playSound(soundName: sender.currentTitle!)
//        print(nextChordsArray)
        self.performSegue(withIdentifier: "secondChordVC", sender: nil)
        
        
        
        
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


extension GetNextChordVC: SecondChordSelectionDelegate {
    func didTapChord(button: String) {
//        print("button clicked", button)
        
        returnedChord = button
        navigationItem.title = "The Next Chord For \(button)"
        nextChordsArray = getNextChord(starting: button)
        allChordsView.reloadData()
//        print("next chords after button pressed", nextChordsArray)
        resetButton.isHidden = false
    }
    
    

}
