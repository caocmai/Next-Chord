//
//  TableVC.swift
//  next-chord
//
//  Created by Cao Mai on 3/17/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class TableVC: UIViewController {
    
    let sampleData : [String] = ["JOne", "Bob", "Jone", "Lisa"]
    
    var obj = [MajorKeys]()

    @IBOutlet weak var newTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getChords()
        newTableView.delegate = self
        newTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func getChords() {
        let newArray = [["V", "ii"], ["ii", "V"]]
        for i in 0..<newArray.count {
            
            var new = MajorKeys(allChords: ["I":"E", "ii": "F#m", "iii": "G#m", "IV": "A", "V": "B", "vi": "C#m", "viio": "D#o"])
            new.getProgessiveChords2(input1: newArray[0][i], input2: newArray[1][i])
            obj.append(new)
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

extension TableVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return obj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewTableViewCell
        //        cell?.textLabel?.text = "\(indexPath.row) \(balloonArray[indexPath.row])"
//        cell?.labelName.text = sampleData[indexPath.row]
        cell?.delegate = self
        cell?.index = indexPath
        cell?.setChord(with: obj[indexPath.row])
        return cell!
    }
    
    
}

extension TableVC: TableViewSound {
    func onTap(playChord: String) {
        print(" is Clicked")
        print(playChord)
    }
    
    
}


