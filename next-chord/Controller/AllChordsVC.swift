//
//  AllChordsVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/18/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class AllChordsVC: UIViewController {
    
    // Is in 2d array because need to get the keysignature to display title
    // So purely for the table's header
    var allKeys = [[KeySignature]]()
    var allOfChords = [[String]]()
    
    @IBOutlet weak var chordsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Reference"
        navigationController?.navigationBar.prefersLargeTitles = true
        //Registering the Custom Header like custom cell for tableview cell
        chordsTableView.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        getAllKeys()
        getAllChords()
    }
    
    func getAllKeys() {
        let cMajor = KeySignature(keySignatureName: "C", allChords: ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bdim"])
        let cSharpMajor = KeySignature(keySignatureName: "C#", allChords: ["I":"C#", "ii":"D#m", "iii":"Fm", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#dim"])
        let cMinor = KeySignature(keySignatureName: "Cm", allChords: ["i":"Cm", "iio":"Ddim", "III":"Eb", "iv":"Fm", "v":"Gm", "VI":"Ab", "VII":"Bb"])
        let dFlatMajor = KeySignature(keySignatureName: "Db", allChords: ["I":"Db", "ii":"Ebm", "iii":"Fm", "IV":"Gb", "V":"Ab", "vi":"Bbm", "viio":"Cdim"])
        let dMajor = KeySignature(keySignatureName: "D", allChords: ["I":"D", "ii":"Em", "iii":"F#m", "IV":"G", "V":"A", "vi":"Bm", "viio":"C#dim"])
        let eFlatMajor = KeySignature(keySignatureName: "Eb", allChords: ["I":"Eb", "ii":"Fm", "iii":"Gm", "IV":"Ab", "V":"Bb", "vi":"Cm", "viio":"Ddim"])
        let eMajor = KeySignature(keySignatureName: "E", allChords: ["I":"E", "ii":"F#m", "iii":"G#m", "IV":"A", "V":"B", "vi":"C#m", "viio":"D#dim"])
        let fMajor = KeySignature(keySignatureName: "F", allChords: ["I":"F", "ii":"Gm", "iii":"Am", "IV":"Bb", "V":"C", "vi":"Dm", "viio":"Edim"])
        let cSharpMinor = KeySignature(keySignatureName: "C#m", allChords: ["i":"C#m", "iio":"D#dim", "III":"E", "iv":"F#m", "v":"G#m", "VI":"A", "VII":"B"])
        let dMinor = KeySignature(keySignatureName: "Dm", allChords: ["i":"Dm", "iio":"Edim", "III":"F", "iv":"Gm", "v":"Am", "VI":"Bb", "VII":"C"])
        let dSharpMinor = KeySignature(keySignatureName: "D#m", allChords: ["i":"D#m", "iio":"E#dim", "III":"F#", "iv":"G#m", "v":"A#m", "VI":"B", "VII":"C#"])
        let eFlatMinor = KeySignature(keySignatureName: "Ebm", allChords: ["i":"Ebm", "iio":"Fdim", "III":"Gb", "iv":"Abm", "v":"Bbm", "VI":"B", "VII":"Db"])
        
        allKeys.append([cSharpMinor])
        allKeys.append([dMinor])
        allKeys.append([dSharpMinor])
        allKeys.append([eFlatMinor])
        allKeys.append([cMajor])
        allKeys.append([cSharpMajor])
        allKeys.append([cMinor])
        allKeys.append([dFlatMajor])
        allKeys.append([dMajor])
        allKeys.append([eFlatMajor])
        allKeys.append([eMajor])
        allKeys.append([fMajor])
    }
    
    func getAllChords() {
        
        for key in allKeys.enumerated() {
            for chord in key.element {
                
                var tempArray : [String] = []
                let value = chord.allChords.values
                
                tempArray.append(contentsOf: value) // This adds all the values randomly to tempArray
                allOfChords.append(tempArray)
                tempArray = []
                
            }
        }
    }
}


extension AllChordsVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allOfChords.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return allKeys[section][0].keySignatureName
    //
    //    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
            "sectionHeader") as! MyCustomHeader
        let name = "Key: \(String(describing: allKeys[section][0].keySignatureName!))"
        view.title.text = name
        return view
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //To display horizontally use allkeys instead of all chords 2d array
        return allKeys[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! AllChordTableCell
        
        // To display horizontally, allkeys must be 2d array
        let key = allKeys[indexPath.section][indexPath.row]
        
        // To display veritcally also change the numberOfRowsInSection appropriately
        //        let key = allOfChords[indexPath.section][indexPath.row]
        //        print(key)
        
        var label = ""
        
        for chord in key.allChords {
            label.append(chord.value)
            label.append("  ")
        }
        cell.allChordsLabel.text = label
        return cell
    }
    
}


