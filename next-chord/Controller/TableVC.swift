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
    
    var theKey : MajorKeys!
    
    var progessiveChords = [MajorKeys]()
    
    var allLabels = [SetLabel]()
    
    @IBOutlet weak var newTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getChords()
        newTableView.delegate = self
        newTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    //    func getChords() {
    //        let newArray = [["I", "IV", "V", "I"], ["I", "vi", "IV", "V"]]
    //        for i in 0..<newArray.count {
    //
    //            var new = theKey!
    //            new.getProgessiveChords(input1: newArray[0][i], input2: newArray[1][i])
    //            progessiveChords.append(new)
    //
    //            let labelOne = SetLabel(firstLabel: newArray[0][i], secondLabel: newArray[0][i], thirdLabel: newArray[1][i], fourthLabel: newArray[1][i])
    //            allLabels.append(labelOne)
    //
    //        }
    //
    //        print(allLabels)
    //    }
    
    func getChords() {
        let newArray = [["I", "IV", "V", "I"], ["I", "vi", "IV", "V"]]
        for i in 0..<newArray.count {
            
            let labelOne = SetLabel(firstLabel: newArray[i][0], secondLabel: newArray[i][1], thirdLabel: newArray[i][2], fourthLabel: newArray[i][3])
            allLabels.append(labelOne)
            
            var new = theKey!
            new.getProgessiveChords(input1: newArray[i][0], input2: newArray[i][1], input3: newArray[i][2], input4: newArray[i][3])
            progessiveChords.append(new)
            
        }
        
        print(progessiveChords)
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
        return progessiveChords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewTableViewCell
        //        cell?.textLabel?.text = "\(indexPath.row) \(balloonArray[indexPath.row])"
        //        cell?.labelName.text = sampleData[indexPath.row]
        cell?.delegate = self
        cell?.index = indexPath
                cell?.setChord(with: progessiveChords[indexPath.row])
        cell?.setLabels(with: allLabels[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

extension TableVC: TableViewSound {
    func onTap(playChord: String) {
        print(" is Clicked")
        print(playChord)
    }
    
    
}


