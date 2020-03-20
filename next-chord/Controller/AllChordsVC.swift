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
    
    var allChords = [[KeySignature]]()
    
    @IBOutlet weak var chordsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        navigationItem.title = "Something herer"
        navigationController?.navigationBar.prefersLargeTitles = true
        getAllChords()
        print(allChords)

        // Do any additional setup after loading the view.
    }
    
    func getAllChords() {
         let cMajor = KeySignature(keySignatureName: "C", allChords: ["I":"C", "ii":"Dm", "iii":"Em", "IV":"F", "V":"G", "vi":"Am", "viio":"Bdim"])
        
        let cSharpMajor = KeySignature(keySignatureName: "C#", allChords: ["I":"C#", "ii":"D#m", "iii":"Fm", "IV":"F#", "V":"G#", "vi":"A#m", "viio":"B#dim"])
        
        allChords.append([cMajor])
        allChords.append([cSharpMajor])
        
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
        return allChords.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Test"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let name = allChords[section][0].allChords["I"]
        label.text = name
        label.backgroundColor = .gray
        return label
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allChords[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! AllChordTableCell
        
        let chordI = allChords[indexPath.section][indexPath.row].allChords["o"] ?? "None"
        
        cell.chordLabel1.text = chordI
        return cell
    }
    
    
}
