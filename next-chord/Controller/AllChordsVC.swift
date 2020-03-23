//
//  AllChordsVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/18/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class AllChordsVC: UIViewController {
    
    var oneArray = ["a", "aa", "aaa"]
    
    var twoArray = [["a", "as", "ass"], ["B", "bb", "bbb"], ["c", "cc", "ccc"]]
    
    // Is in 2d array because need to get the keysignature to display title
    // So purely for the table's header
    var allKeys = [[KeySignature]]()
    
    var allOfChords = [[String]]()
    
    @IBOutlet weak var chordsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = #colorLiteral(red: 0.9943221211, green: 0.544516325, blue: 0.2199267149, alpha: 1)
        navigationItem.title = "Reference"
        navigationController?.navigationBar.prefersLargeTitles = true
        //Registering the Custom Header like custom cell for tableview cell
        chordsTableView.register(MyCustomHeader.self,
                                 forHeaderFooterViewReuseIdentifier: "sectionHeader")
        getAllKeys()
        getAllChords()
        
        //        print(allChords)
        
        
        // Do any additional setup after loading the view.
    }
    
    func getAllKeys() {
        let cMajor = KeySignature(keySignatureName: "C", allChords: ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bdim"])
        
        let cSharpMajor = KeySignature(keySignatureName: "C#", allChords: ["I":"C#", "ii":"D#m", "iii":"Fm", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#dim"])
        
        let cMinor = KeySignature(keySignatureName: "Cm", allChords: ["i":"Cm", "iio":"Ddim", "III":"Eb", "iv":"Fm", "v":"Gm", "VI":"Ab", "VII":"Bb"])
        
        allKeys.append([cMajor])
        allKeys.append([cSharpMajor])
        allKeys.append([cMinor])
        
    }
    
    func getAllChords() {
        
        for key in allKeys.enumerated() {
            for chord in key.element {
                
                var tempArray : [String] = []
                let value = chord.allChords.values
                //                print(value)
                
                tempArray.append(contentsOf: value)
                allOfChords.append(tempArray)
                tempArray = []
                
            }
        }
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


extension AllChordsVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allOfChords.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return allKeys[section][0].keySignatureName
    //
    //    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
            "sectionHeader") as! MyCustomHeader
        
        let name = "Key: \(String(describing: allKeys[section][0].keySignatureName!))"
        
        view.title.text = name
        
        //        let label = UILabel()
        //        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        //        let name = allKeys[section][0].keySignatureName
        //        label.text = name
        //        label.font = UIFont.systemFont(ofSize: 24.0)
        //        label.backgroundColor = .gray
        
        return view
    }
    
    //    override func tableView(_ tableView: UITableView,
    //            viewForHeaderInSection section: Int) -> UIView? {
    //       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
    //                   "sectionHeader") as! MyCustomHeader
    //       view.title.text = sections[section]
    //       view.image.image = UIImage(named: sectionImages[section])
    //
    //       return view
    //    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOfChords[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! AllChordTableCell
        
        
        //        let key = twoArray[indexPath.section][indexPath.row]
        let key = allOfChords[indexPath.section][indexPath.row]
        //        print(key)
        
        //        var label = ""
        //
        //        for chord in key.allChords {
        //
        //            label.append(chord.value)
        //            label.append("  ")
        //
        //        }
        
        //        print(label)
        
        cell.allChordsLabel.text = key
        return cell
    }
    
    
}


